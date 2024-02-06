// ignore_for_file: file_names, avoid_print, prefer_typing_uninitialized_variables, depend_on_referenced_packages

// Dart imports:

import 'package:flutter/material.dart';
import 'package:onestopservices/models/permissions/permissions.dart';

// Project imports:
import 'package:onestopservices/models/signin/signin.dart';
import 'package:onestopservices/models/signin/signin_response.dart';
import 'package:onestopservices/services/login/login_service.dart';

class LoginFactory with ChangeNotifier {
  List<Permissions>? permission;
  Future<SignInResponse?> signIn(email, password) async {
    final model = SignIn(
      email: email,
      password: password,
    );

    LoginService requests = LoginService();
    var user = await requests.signIn(model);
    if (user != null) {
      permission = user.permissions;
    }
    notifyListeners();
    return user;
  }
}
