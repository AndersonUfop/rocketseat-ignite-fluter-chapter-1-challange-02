import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/create_note/create_note_page.dart';
import 'package:notes/pages/error/error_page.dart';
import 'package:notes/pages/home/home_page.dart';
import 'package:notes/pages/login/login_page.dart';

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
      Navigator.pushNamed(context, "/error");
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Material(
        child: Center(
          child: Text("Erro na inicialização do firebase"),
        ),
      );
    }

    if (!_initialized) {
      return Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      title: 'Notes',
      initialRoute: "/login",
      routes: {
        "/home": (context) => HomePage(),
        "/login": (contex) => LoginPage(),
        "/error": (context) => ErrorPage(),
        "/create-note": (context) => CreateNotePage()
      },
    );
  }
}
