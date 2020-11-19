//  Essa classe gerencia o estado do usuario, como se esta logado
//  e tambem envia as senhas para o firebase.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_up/models/usuario.dart';
import 'package:projeto_up/services/router_service.dart';

class UserService extends GetxService {
  static const colName = "users";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxBool _isLogged = false.obs;
  final Rx<Usuario> usuario = Rx<Usuario>();
  final RxBool _hasCompanyRegister = false.obs;
  User fireBaseUser;

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
      } else {
        _triggerCreateStartup();
      }
    }
  }

  void _triggerCreateStartup() {
    _hasCompanyRegister.value = false;
    Get.toNamed(RouterService.WELCOME);
  }

  bool get isLoggedIn {
    return _isLogged();
  }

  bool get hasCompany {
    return _hasCompanyRegister();
  }
}
