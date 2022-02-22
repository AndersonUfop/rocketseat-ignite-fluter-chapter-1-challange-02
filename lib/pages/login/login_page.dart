import 'package:flutter/material.dart';
import 'package:notes/pages/login/login_controller.dart';
import 'package:notes/pages/login/login_service.dart';
import 'package:notes/pages/login/login_state.dart';
import 'package:notes/pages/login/widgets/button_login_widget.dart';
import 'package:notes/themes/app_theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late loginController controller;

  @override
  void initState() {
    controller = loginController(
        service: LoginServiceImpl(),
        onUpdate: () {
          if (controller.state is LoginStateSuccess) {
            final user = (controller.state as LoginStateSuccess).user;
            Navigator.pushReplacementNamed(context, "/home", arguments: user);
          } else {
            setState(() {});
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(children: [
                Container(
                    width: 236,
                    child: Text(
                      "Faça login para iniciar",
                      style: AppTheme.textStyles.titleLogin,
                    ))
              ])),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ButtonLoginWidget(
                  imagePath: "assets/images/google.png",
                  label: "Login",
                  onTap: () async {
                    controller.googleSignIn();
                  },
                ),
              ),
              SizedBox(height: 12),
            ],
          )
        ]));
  }
}
