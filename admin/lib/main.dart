import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_app/Page/HomePage.dart';
import 'package:shop_app/Page/welcomePage.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      color: Colors.white,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => Homepage(index:0),
         "welcomPage":(context) => WelcomePage()
      },
    
    );
  }
}

