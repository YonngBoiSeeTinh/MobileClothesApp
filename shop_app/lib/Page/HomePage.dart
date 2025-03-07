import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/AppConfig.dart';
import 'package:shop_app/Page/AccountPage.dart';
import 'package:shop_app/Page/CartPage.dart';
import 'package:shop_app/Page/ProductHomePage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  List<dynamic> products = [];
  List<dynamic> categories = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchProducts(); 
    fetchCategories();
  }

  Future<void> fetchProducts() async {
    setState(() {
      isLoading = true; 
    });
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/api/Products'));
      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
        });
        print('product at home ${response.body}');
      } else {
        print('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      setState(() {
        isLoading = false; // Kết thúc tải dữ liệu
      });
    }
  }
   Future<void> fetchCategories() async {
    setState(() {
      isLoading = true; 
    });
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/api/Categories'));
      if (response.statusCode == 200) {
        setState(() {
          categories = jsonDecode(response.body);
        });
        print('categories ${response.body}');
      } else {
        print('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      setState(() {
        isLoading = false; // Kết thúc tải dữ liệu
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Trang hiện tại dựa trên `_currentIndex`
    Widget currentPage;
    if (_currentIndex == 0) {
      currentPage = isLoading
          ? const Center(child: CircularProgressIndicator())
          : ProductHomepage(products: products, categories: categories,);
    } else if (_currentIndex == 1) {
      currentPage = const Cartpage();
    } else {
      currentPage = const AccountWidget();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: currentPage, 
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.transparent,
        color: const Color(0xFF4C53A5),
        items: const [
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
