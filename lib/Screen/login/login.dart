import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(children: [
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Hi',
                        style: GoogleFonts.montez(
                            textStyle: const TextStyle(fontSize: 100))),
                    const SizedBox(height: 30),
                    _loginForm()
                  ],
                ),
              ),
            ),
          ),
        ]));
  }

  Widget _loginForm() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            _emailField(),
            const SizedBox(height: 10),
            _passwordField(),
            const SizedBox(height: 15),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginErrorState) {
                  return Text(
                    state.errorMessage,
                    style: GoogleFonts.kumbhSans(
                        textStyle: const TextStyle(
                      color: Color(0xffc7021b),
                      fontSize: 18,
                    )),
                  );
                } else {
                  return Container();
                }
              },
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: const Color(0xffc7021b)),
          borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextField(
          controller: _emailController,
          onChanged: (val) {
            BlocProvider.of<LoginBloc>(context).add(LogInTextChangeEvent(
                _emailController.text, _passwordController.text));
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              icon: const Icon(Icons.person_outline_rounded,
                  color: Color(0xffc7021b)),
              hintText: 'Email',
              hintStyle: GoogleFonts.kumbhSans()),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: const Color(0xffc7021b)),
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            controller: _passwordController,
            onChanged: (val) {
              BlocProvider.of<LoginBloc>(context).add(LogInTextChangeEvent(
                  _emailController.text, _passwordController.text));
            },
            obscureText: true,
            decoration: InputDecoration(
                border: InputBorder.none,
                icon: const Icon(Icons.password_rounded,
                    color: Color(0xffc7021b)),
                hintText: 'Password',
                hintStyle: GoogleFonts.kumbhSans()),
          ),
        ));
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        /*if(state is LoginLoadingState){
          return const CircularProgressIndicator(color: Color(0xffc7021b));
        }*/

        return GestureDetector(
          onTap: () {
            if (state is LoginValidState){
              BlocProvider.of<LoginBloc>(context).add(LogInSubmittedEvent(
                  _emailController.text, _passwordController.text));
              Navigator.push(context,MaterialPageRoute(builder: (context) => const Home()));
            }
          },
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: (state is LoginValidState)
                      ? const Color(0xffc7021b)
                      : const Color(0xff070000),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                'Login In',
                style: GoogleFonts.kumbhSans(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ))),
        );
      },
    );
  }
}
