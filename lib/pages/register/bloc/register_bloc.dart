import 'package:acourse/pages/register/bloc/register.states.dart';
import 'package:acourse/pages/register/bloc/register_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates>{
  RegisterBlocs():super(const RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_repasswordEvent);

  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit){
    emit(state.copyWith(userName:event.userName));
  }
  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit){
    emit(state.copyWith(email:event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit){
    emit(state.copyWith(password:event.password));
  }
  void _repasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit){
    emit(state.copyWith(rePassword:event.rePassword));
  }
}