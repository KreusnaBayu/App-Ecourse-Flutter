import 'package:acourse/pages/signin/bloc/sigin_events.dart';
import 'package:acourse/pages/signin/bloc/sigin_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc():super(SignInState()){
    on<EmailEvent>((_emailEvent));

    on<PasswordEvent>((_passwordEvent)); 
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    print("my email is ${event.email}");
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    print("my password is ${event.password}");
    emit(state.copyWith(password: event.password));
  }
}