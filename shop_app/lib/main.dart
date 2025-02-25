import 'package:flutter/material.dart';
import 'package:shop_app/Page/CartPage.dart';
import 'package:shop_app/Page/HomePage.dart';
import 'package:shop_app/Page/ProductDetail.dart';
import 'package:shop_app/Page/welcomePage.dart';

void main() {
  runApp(const MyApp());
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
        "/":(context) => Homepage(),
        "/cartPage":(context)=>Cartpage(),
         "welcomPage":(context) => WelcomePage()
      },
    
    );
  }
}

