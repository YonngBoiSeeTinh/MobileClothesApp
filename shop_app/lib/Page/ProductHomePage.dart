import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/AppConfig.dart';
import 'package:shop_app/Page/CartPage.dart';
import 'package:shop_app/Page/welcomePage.dart';
import 'package:shop_app/Widget/CategoryWidget.dart';
import 'package:shop_app/Widget/ItemWidget.dart';
import 'package:shop_app/Widget/HomeAppBar.dart';
import 'package:shop_app/Widget/PromoWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shop_app/Widget/SearchItemWidget.dart';
class ProductHomepage extends StatefulWidget {
  const ProductHomepage({super.key});
  @override
  _ProductHomepageState createState() => _ProductHomepageState(); 

}

class _ProductHomepageState extends State<ProductHomepage> {

  String? searchFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:ListView(
        children: [
          HomeAppBar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search here",
                            icon: Icon(Icons.search),
                          ),
                           onFieldSubmitted: (value) {
                            setState(() {
                              searchFilter = value;
                            });
                            print("Search filter: $searchFilter");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                 (searchFilter == null || searchFilter!.isEmpty) ? Promowidget() : SizedBox(height: 1,),
                 (searchFilter == null || searchFilter!.isEmpty) ? SizedBox(height: 1,) : SizedBox(height: 20,),
                Categorywidget(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Best seller",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                Container(
                  height: 1200,
                  child: (searchFilter == null || searchFilter!.isEmpty)
                          ? ItemWidget()
                          : SearchItemWidget(filter: searchFilter)
                ),
              ],
            ),
          ),
        ],
      ),
  
     );
  }
}
