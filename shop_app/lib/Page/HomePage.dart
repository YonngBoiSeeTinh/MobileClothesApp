import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Page/CartPage.dart';
import 'package:shop_app/Page/LoginPage.dart';
import 'package:shop_app/Page/ProductHomePage.dart';
import 'package:shop_app/Page/welcomePage.dart';
import 'package:shop_app/Widget/CategoryWidget.dart';
import 'package:shop_app/Widget/ItemWidget.dart';
import 'package:shop_app/Widget/HomeAppBar.dart';
import 'package:shop_app/Widget/PromoWidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
  

}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Trang Home
    ProductHomepage(),  // Trang Shopping Bag
    Center(
      child: Cartpage()
    ),
    // Trang Account
    Center(
      child: LoginPage()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex], // Hiển thị trang dựa vào chỉ số hiện tại
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cập nhật trạng thái chỉ số trang
          });
        },
        backgroundColor: Colors.transparent,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
            Icons.home_filled,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle_rounded,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
