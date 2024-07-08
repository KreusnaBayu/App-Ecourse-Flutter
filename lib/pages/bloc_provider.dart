import 'dart:js';

import 'package:acourse/app_blocs.dart';
import 'package:acourse/pages/register/bloc/register_bloc.dart';
import 'package:acourse/pages/signin/bloc/sigin_blocs.dart';
import 'package:acourse/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProvider{
  static get allBlocProviders=>[
    BlocProvider(
          //lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        /* BlocProvider(
          //lazy: false,
          create: (context) => AppBlocs(),
        ), */
        BlocProvider(create: (context)=>SignInBloc()),
        BlocProvider(create: (context)=>RegisterBlocs())
  ];
}