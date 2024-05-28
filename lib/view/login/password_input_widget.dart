import 'package:bloc_flutter/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return TextFormField(
            focusNode: focusNode,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              helperText: "Password",
              helperMaxLines: 2,
              labelText: "Password",
              errorMaxLines: 2,
            ),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter password';
              }
              if (value.length < 6) {
                return 'please enter password greater than 6 char';
              }
              return null;
            },
            onChanged: (value) {
              context.read<LoginBloc>().add(PasswordChange(password: value));
            },
            textInputAction: TextInputAction.done,
          );
        });
  }
}
