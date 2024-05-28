import 'dart:convert'; // Importing dart:convert for JSON encoding and decoding

import 'package:bloc_flutter/models/user/user_model.dart';
import 'package:bloc_flutter/services/storage/storage.dart';
import 'package:flutter/material.dart'; // Importing Flutter material library

class SessionController {
  final LocalStorage sharedPreferenceClass = LocalStorage();

  static final SessionController _session = SessionController._internal();

  static bool? isLogin;

  static UserModel user = UserModel();

  SessionController._internal() {
    isLogin = false;
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    sharedPreferenceClass.setValue('token', jsonEncode(user));
    sharedPreferenceClass.setValue('isLogin', 'true');
  }

  Future<void> getUserFromPreference() async {
    try {
      var userData = await sharedPreferenceClass.readValue('token');
      var isLogin = await sharedPreferenceClass.readValue('isLogin');
      if (userData.isNotEmpty) {
        SessionController.user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController.isLogin = isLogin == 'true' ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
