import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minushia_demo/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileInputController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final String url =
      // "https://www.google.com/url?q=http://3.85.225.88/accounts/login/&sa=D&ust=1589463692150000&usg=AFQjCNELIRRzU9g7NZf8_huuHZrFowrfxw";
      "http://3.85.225.88/accounts/login/";

  onSubmit(context) {
    // Future<http.Response> login() {
    //   return http.post(
    //     url,
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(<String, String>{
    //       "mobile": "9880420891",
    //       "password": "Sameer",
    //       "secret_key": "c4081867-d9bf-47cf-a"
    //     }),
    //   );
    // }

    // login();
// {
//   "mobile" : "9880420891",
// "password" : "Sameer",
// "secret_key": "c4081867-d9bf-47cf-a"
// }
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomeScreen()));

    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: HomeScreen()));
  }

  TextFormField inputField(obscureText, controller) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
    );
  }

  Widget loginButton(context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Text(
          'LOGIN',
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(color: Colors.white, fontSize: 25),
        ),
      ),
      onPressed: () => onSubmit(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'MOBILE NUMBER',
              style:
                  Theme.of(context).textTheme.headline2.copyWith(fontSize: 17),
            ),
            inputField(false, mobileInputController),
            SizedBox(
              height: 70,
            ),
            Text(
              'PASSWORD',
              style:
                  Theme.of(context).textTheme.headline2.copyWith(fontSize: 17),
            ),
            inputField(true, passwordController),
            SizedBox(
              height: 50,
            ),
            Center(child: loginButton(context)),
          ],
        ),
      ),
    );
  }
}
