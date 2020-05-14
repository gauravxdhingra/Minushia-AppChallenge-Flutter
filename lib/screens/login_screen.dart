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

  Widget loginButton(context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Text(
          'LOGIN',
          style: Theme.of(context).textTheme.headline1.copyWith(
                color: Colors.white,
                fontSize: 25
              ),
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
