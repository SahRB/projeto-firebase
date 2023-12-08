import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AutenticacaoServico {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  cadastrarUsuario({
    required String nome,
    required String senha,
    required String email,
    required BuildContext context, // Adicione o parâmetro BuildContext
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      await userCredential.user!.updateDisplayName(nome);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        // Use ScaffoldMessenger para exibir um Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("O e-mail já está em uso."),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<String?> logarUsuarios({required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
      return null; // Sucesso no login, sem mensagem de erro
    } on FirebaseAuthException catch (e) {
      return e.message; // Retorna a mensagem de erro em caso de falha no login
    }
  }

}
