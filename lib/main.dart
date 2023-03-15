import 'package:bloc_login_verification/Screen/login/bloc/login_bloc.dart';
import 'package:bloc_login_verification/Screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login verification using Bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginPage()),
    );
  }
}
