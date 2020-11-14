//  Essa classe gerencia o estado do usuario, como se esta logado
//  e tambem envia as senhas para o firebase.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn({@required String email, @required String pass}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() async {
    await _auth.signOut();
  }
}
