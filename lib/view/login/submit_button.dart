import 'package:bloc_flutter/bloc/bloc/login_bloc.dart';
import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:bloc_flutter/utils/enum.dart';
import 'package:bloc_flutter/utils/flushbar_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          context.flushBarErrorMessage(message: state.message.toString());
        }

        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(
            context,
            RoutesName.homeScreen,
          );
          context.flushBarSuccessMessage(message: state.message.toString());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) =>
              current.postApiStatus != previous.postApiStatus,
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginApi());
                  }
                },
                child: state.postApiStatus == PostApiStatus.loading
                    ? const Center(child: CircularProgressIndicator())
                    : const Text('Login'));
          }),
    );
  }
}
