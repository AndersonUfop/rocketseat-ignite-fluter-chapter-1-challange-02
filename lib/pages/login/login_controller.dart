import 'package:flutter/material.dart';
import 'package:notes/pages/login/login_service.dart';
import 'package:notes/pages/login/login_state.dart';
import 'package:notes/pages/login/models/user_model.dart';

class loginController {
  UserModel? user;
  LoginState state = LoginStateEmpty();
  VoidCallback onUpdate;
  Function(LoginState state)? onChange;
  final LoginService service;
  loginController({required this.onUpdate, required this.service});

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();
      final user = await service.googleSignIn();
      state = LoginStateSuccess(user: user);
      update();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();
    if (onChange != null) {
      onChange!(state);
    }
  }

  void listen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
