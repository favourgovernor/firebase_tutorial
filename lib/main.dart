import 'dart:io';

//import 'package:auth_app/pages/login.dart';
//import 'package:auth_app/pages/home_page.dart';
//import 'package:auth_app/pages/login.dart';
//import 'package:auth_app/pages/login.dart';
import 'package:auth_app/auth/main_pages.dart';
//import 'package:auth_app/pages/main_pages.dart';
//import 'package:auth_app/pages/main_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid 
  ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA3qQ4WEWiMpEtg8erxkGvi_4Zqt48ZDvE', 
      appId: '1:12378803798:android:03924ed903179cca6b75f7',
      messagingSenderId: '12378803798',
      projectId: 'fir-tutorial-8d457'
  )
  )
  : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}


