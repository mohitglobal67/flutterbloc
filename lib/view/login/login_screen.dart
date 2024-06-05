import 'package:bloc_flutter/bloc/bloc/login_bloc.dart';
import 'package:bloc_flutter/main.dart';
import 'package:bloc_flutter/view/login/email_input_widget.dart';
import 'package:bloc_flutter/view/login/password_input_widget.dart';
import 'package:bloc_flutter/view/login/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();

    _loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmailInput(
                  focusNode: emailfocusnode,
                ),
                PasswordInput(focusNode: passwordfocusnode),
                SubmitButton(
                  formKey: _formkey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
