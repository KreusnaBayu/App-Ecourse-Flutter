import 'package:acourse/common/widget/flutter_toast.dart';
import 'package:acourse/pages/signin/bloc/sigin_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddres = state.email;
        String password = state.password;
        if (emailAddres.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
          //
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddres, password: password);
          if (credential.user == null) {
            //
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");
            return;
            //
          }

          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
            print("user exist");
          } else {
            toastInfo(msg: "Currently you are not a user of this app");
            return;
            //we have error getting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            print("No user found for that email.");
            toastInfo(msg: "No user found for that email");
          } else if (e.code == "wrong password") {
            print("Wrong password provided fo that user.");
            toastInfo(msg: "Wrong password provided fo that user");
          } else if (e.code == "invalid-email") {
            print("Your email format is wrong");
            toastInfo(msg: "Your email address format is wrong");
          }
        }
      }
    } catch (e) {}
  }
}
