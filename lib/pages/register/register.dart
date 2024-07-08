import 'package:acourse/pages/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar("Sign up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                    child: reusableText(
                        "Enter your details below and free sign up")),
                Container(
                  margin: EdgeInsets.only(top: 36.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Username"),
                      buildTextField("Enter your username ", "name", "user",
                          (value) {
                        //context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      reusableText("Email"),
                      buildTextField("Enter your email adress", "email", "user",
                          (value) {
                        //context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      reusableText("Password"),
                      buildTextField("Enter your password", "password", "lock",
                          (value) {
                        //context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                      reusableText("Re-enter your password"),
                      buildTextField("Re-enter your password to confirm",
                          "password", "user", (value) {
                        //context.read<SignInBloc>().add(EmailEvent(value));
                      })
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child: reusableText("Enter your details below and free sign up"),
                ),
                buildLogInAndRegButton("Sign up", "login", () {
                  Navigator.of(context).pushNamed("signIn");
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
