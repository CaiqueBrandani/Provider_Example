import 'package:provider_app/src/shared/models/serveices/client_http.dart';
import 'models/auth_request_model.dart';
import 'package:flutter/material.dart';
import '../../shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthState {idle, success, error, loading}

class AuthController extends ChangeNotifier{
  var authRequest = AuthRequestModel('', '');

  var state = AuthState.idle;

  final ClientHttp client;

  AuthController(this.client);

  Future<void> loginAction(BuildContext context) async {
    state = AuthState.loading;
    notifyListeners();

    try {
      final response = await client.post('http://localhost:8080/auth', data: authRequest.toMap());
      final shared = await SharedPreferences.getInstance();
      globaUserModel = UserModel.fromMap(response);
      await shared.setString('UserModel', globaUserModel!.toJson());
      state = AuthState.success;
      notifyListeners();
    } catch (e) {
      state = AuthState.error;
      notifyListeners();
    }
  }
}
