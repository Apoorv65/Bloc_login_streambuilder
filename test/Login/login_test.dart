import 'package:bloc_login_verification/Screen/login/bloc/login_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login Tests', () {
    blocTest(
      'valid Entries',
      build: () => LoginBloc(),
      act: (bloc) => bloc.add(LogInTextChangeEvent('abc@xyz.com', '321654987')),
      expect: () => [LoginValidState()],
    );

    blocTest(
      'Entries Submitted',
      build: () => LoginBloc(),
      act: (bloc) => bloc.add(LogInSubmittedEvent('abc@xyz.com', '12345')),
      expect: () => [LoginLoadingState()],
    );
  });
}