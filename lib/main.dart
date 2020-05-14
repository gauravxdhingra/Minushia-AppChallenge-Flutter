import 'dart:async';
import 'screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffEA4335),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Color(0xffEA4335),
            fontSize: 30,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.1,
          ),
          headline2: TextStyle(
            color: Color(0xffEA4335),
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
          bodyText2: TextStyle(
            // color: Color(0xffEA4335),
            fontSize: 15,
            // fontWeight: FontWeight.bold,
            // letterSpacing: 1.1,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(milliseconds: 1000);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Image.asset(
            "assets/Minushia.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
