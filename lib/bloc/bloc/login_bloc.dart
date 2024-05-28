import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/repository/auth/login_repository.dart';
import 'package:bloc_flutter/services/session_manager/session_manager.dart';
import 'package:bloc_flutter/utils/enum.dart';
import 'package:equatable/equatable.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginState()) {
    on<EmailChange>(_onEmailchanged);
    on<PasswordChange>(_onPasswordchanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailchanged(EmailChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordchanged(PasswordChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    // Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};

    Map data = {"email": state.email, "password": state.password};

    emit(state.copyWith(
      postApiStatus: PostApiStatus.loading,
    ));
    await loginRepository.loginapi(data).then((value) async {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
          message: value.error.toString(),
          postApiStatus: PostApiStatus.error,
        ));
      } else {
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(
            message: value.token, postApiStatus: PostApiStatus.success));
      }
    }).onError((error, stackTrace) {
      debugger();
      print(error.toString());

      emit(state.copyWith(
          message: error.toString(), postApiStatus: PostApiStatus.error));
    });
  }
}
