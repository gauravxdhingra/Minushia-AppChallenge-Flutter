import 'package:flutter/material.dart';
import 'package:minushia_demo/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileInputController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final String url =
      "https://www.google.com/url?q=http://3.85.225.88/accounts/login/&sa=D&ust=1589463692150000&usg=AFQjCNELIRRzU9g7NZf8_huuHZrFowrfxw";

  onSubmit(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  TextFormField inputField(obscureText, controller) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
    );
  }

  FlatButton loginButton(context) {
    return FlatButton(
      child: Text('LOGIN'),
      onPressed: () => onSubmit(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('MOBILE NUMBER'),
          inputField(false, mobileInputController),
          Text('PASSWORD'),
          inputField(true, passwordController),
          loginButton(context),
        ],
      ),
    );
  }
}
