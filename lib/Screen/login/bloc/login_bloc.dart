import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LogInTextChangeEvent>((event, emit) {
      if (event._email == '' || event._email.isEmpty ||!RegExp(r'\S+@\S+\.\S+').hasMatch(event._email)) {
        emit(LoginErrorState('Please enter a valid email address.'));
      } else if (event._password.length <= 6) {
        emit(LoginErrorState('Please enter a valid password.'));
      } else {
        emit(LoginValidState());
      }
    });

    on<LogInSubmittedEvent>((event, emit) {
      emit(LoginLoadingState());
    });
  }
}
