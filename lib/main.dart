import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/firebase_options.dart';
import 'package:project/login/views/home.dart';
import 'package:project/login/views/login.dart';
import 'package:project/login/views/signUp.dart';
import 'package:project/news/model/articelModel.dart';
import 'package:project/news/screens/details.dart';
import 'package:project/news/screens/news.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => home(),
        'login': (context) => login(),
        'signUp': (context) => signUp(),
        'news': (context) => news(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'details') {
          final articleModel = settings.arguments as ArticalModel;
          return MaterialPageRoute(
              builder: (context) => details(articleModel: articleModel));
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Image.asset(
                'assets/logo.jpg',
                width: double.infinity,
                height: 810,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
