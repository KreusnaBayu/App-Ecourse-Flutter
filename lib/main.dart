import 'package:acourse/app_blocs.dart';
import 'package:acourse/common/values/colors.dart';
import 'package:acourse/firebase_options.dart';
import 'package:acourse/pages/bloc_provider.dart';
import 'package:acourse/pages/register/register.dart';
import 'package:acourse/pages/signin/bloc/sigin_blocs.dart';
import 'package:acourse/pages/signin/sign_in.dart';
import 'package:acourse/pages/welcome/bloc/welcome_blocs.dart';
import 'package:acourse/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* void main() {
  runApp(const MyApp());
} */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp()); // Jangan lupa menjalankan aplikasi utama
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText
              ),
              elevation: 0,
              backgroundColor: Colors.white
            )
          ),
          home: const Welcome(),
          routes: {
            "signIn":(context) => const SignIn(),
            "register":(context) => const Register()
          },
        ),
      ),
    );
  }
}

