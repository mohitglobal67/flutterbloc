import 'package:bloc_flutter/bloc/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInput extends StatelessWidget {
  final FocusNode focusNode;
  const EmailInput({Key? key, required this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => current.email != previous.email,
        builder: (context, state) {
          return TextFormField(
            focusNode: focusNode,
            decoration: InputDecoration(
              icon: const Icon(Icons.email),
              labelText: "Email",
              helperText: "Email",
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              context.read<LoginBloc>().add(EmailChange(email: value));
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter email';
              }
              // if (value.emailValidator()) {
              //   return 'Email is not correct';
              // }
              return null;
            },
            textInputAction: TextInputAction.next,
          );
        });
  }
}
