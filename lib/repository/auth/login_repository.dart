

import 'package:bloc_flutter/config/app_url.dart';
import 'package:bloc_flutter/data/network/network_api_services.dart';

import 'package:bloc_flutter/models/user/user_model.dart';

class LoginRepository {
  final _api = NetworkServisesApi();

  Future<UserModel> loginapi(dynamic data) async {
    final response = await _api.postApi(AppUrl.baseUrl, data);
    return UserModel.fromJson(response);
  }
}
