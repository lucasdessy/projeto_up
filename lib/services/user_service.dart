//  Essa classe gerencia o estado do usuario, como se esta logado
//  e tambem envia as senhas para o firebase.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projeto_up/models/projeto.dart';
import 'package:projeto_up/models/startup.dart';
import 'package:projeto_up/models/usuario.dart';
import 'package:projeto_up/services/projects_service.dart';
import 'package:projeto_up/services/router_service.dart';
import 'package:projeto_up/services/startup_service.dart';

class UserService extends GetxService {
  static const colName = "users";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxBool _isLogged = false.obs;
  final Rx<Usuario> usuario = Rx<Usuario>();
  final RxBool _hasCompanyRegister = false.obs;
  final RxBool _loading = false.obs;
  final StartupService _startupService = Get.find();
  final ProjectsService _projectsService = Get.find();
  final Rx<Startup> _startupPessoal = Startup().obs;
  List<Projeto> _projetosPessoais = List<Projeto>().obs;

  User fireBaseUser;

  String get userId => fireBaseUser.uid;

  String get startupId => usuario().idStartup;

  bool get isLoading => _loading();

  bool get loading => _loading();

  Startup get startupPessoal => _startupPessoal();

  Rx<Startup> get startupPessoalStream => _startupPessoal;

  List<Projeto> get projetosPessoais => _projetosPessoais;

  void _setLoading(bool v) {
    _loading.value = v;
    _loading.refresh();
  }

  Future<void> signUp({@required String email, @required String pass}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: pass,
      );
      loadUser();
    } catch (e) {
      print(e.toString());
      throw ('Ocorreu um erro interno');
    }
  }

  Future<void> signIn({@required String email, @required String pass}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: pass,
      );
      loadUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('Email ou senha errados.');
      } else if (e.code == 'wrong-password') {
        throw ('Email ou senha errados.');
      }
    } catch (e) {
      print(e.toString());
      throw ('Ocorreu um erro interno');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      loadUser();
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> signInWithFacebook() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        FacebookAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken.token);
        await FirebaseAuth.instance.signInWithCredential(credential);
        loadUser();
        return true;
      case FacebookLoginStatus.error:
        throw ('Ocorreu um erro interno');
      case FacebookLoginStatus.cancelledByUser:
        return false;
    }
    return false;
  }

  Future<void> forgotPassword({@required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('Usuário não encontrado com este email.');
      }
    } catch (e) {
      print(e.toString());
      throw ('Ocorreu um erro interno');
    }
  }

  Future<bool> signOut() async {
    bool ok = false;
    await Get.dialog(
      AlertDialog(
        title: Text("Deseja fazer logout?"),
        actions: [
          FlatButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Não"),
          ),
          FlatButton(
            onPressed: () {
              ok = true;
              Get.back();
            },
            child: Text("Sim"),
          ),
        ],
      ),
    );
    if (ok) {
      await _auth.signOut();
      usuario.value = null;
    }
    return ok;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _auth.authStateChanges().listen((User user) {
      fireBaseUser = user;
      if (user == null) {
        _isLogged.value = false;
      } else {
        _isLogged.value = true;
      }
    });
    super.onReady();
  }

  void loadUser() async {
    if (usuario.value == null && isLoggedIn) {
      DocumentSnapshot snap =
          await _firestore.collection(colName).doc(fireBaseUser.uid).get();
      if (snap.exists) {
        _hasCompanyRegister.value = true;
        Usuario _tempUsuario = Usuario.fromDocument(snap);
        usuario.value = _tempUsuario;
        _startupPessoal.value = await _startupService.getStartup(startupId);
        _projetosPessoais = await _projectsService.getProjectsById(startupId);
        _startupPessoal.refresh();
      } else {
        _triggerCreateStartup();
      }
    }
  }

  void _triggerCreateStartup() {
    _hasCompanyRegister.value = false;
    Get.toNamed(RouterService.WELCOME);
  }

  Future<void> uploadUser(String startupId) async {
    _setLoading(true);
    Usuario _tempUsuario = Usuario(idStartup: startupId);
    await _firestore.collection(colName).doc(userId).set(_tempUsuario.toJson());
    usuario.value = _tempUsuario;
    _hasCompanyRegister.value = true;
    _startupPessoal.value = await _startupService.getStartup(startupId);
    _projetosPessoais = await _projectsService.getProjectsById(startupId);
    _startupPessoal.refresh();
    _setLoading(false);
  }

  bool get isLoggedIn {
    return _isLogged();
  }

  bool get hasCompany {
    return _hasCompanyRegister();
  }

  Future<void> saveStartup(Startup _startup) async {
    _setLoading(true);
    try {
      await _startupService.saveStartup(_startup);
      _startupPessoal.value = _startup;
    } catch (e) {
      _setLoading(false);
      throw ('Ocorreu um erro interno');
    }
    _setLoading(false);
  }
}
