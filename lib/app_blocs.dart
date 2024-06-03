import 'package:acourse/app_events.dart';
import 'package:acourse/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppStates>{
    AppBlocs():super(InitStates()){
      on<Increment>((event, emit){
        emit(AppStates(counter: state.counter+1));

      });
    }

    
}