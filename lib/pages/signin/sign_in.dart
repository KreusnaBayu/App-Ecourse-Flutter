import 'package:acourse/pages/common_widget.dart';
import 'package:acourse/pages/signin/bloc/sigin_blocs.dart';
import 'package:acourse/pages/signin/bloc/sigin_events.dart';
import 'package:acourse/pages/signin/bloc/sigin_states.dart';
import 'package:acourse/pages/signin/sign_in_controller.dart';
//import 'package:acourse/pages/signin/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: 
            buildAppBar("Log In"),
            
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child:
                          reusableText("Or use your email account to login")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email adress", "email", "user",
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        })
                      ],
                    ),
                  ),
                  forgotPassword(),
                  buildLogInAndRegButton("Log in", "login", () {
                    SignInController(context: context).handleSignIn("email");
                  }),
                  buildLogInAndRegButton("Sign Up", "register", () {
                    Navigator.of(context).pushNamed("register");
                  })
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
