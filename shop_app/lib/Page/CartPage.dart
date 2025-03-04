import 'package:flutter/material.dart';
import 'package:shop_app/Widget/CartAppBar.dart';
import 'package:shop_app/Widget/CartBottomNavBar.dart';
import 'package:shop_app/Widget/CartItemWidget.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: ListView(
        children: [
          CartAppbar(),
          
          Container(
            height: 700,
            padding: EdgeInsets.only(top:15),
            decoration:BoxDecoration (
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(topLeft:Radius.circular(30) , topRight: Radius.circular(30) ),
            ),
            child: Column(
              children: [
                Cartitemwidget(),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                  padding: EdgeInsets.all(10),
                  child:
                   Row(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF4C53A5) ,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.add, 
                          color: Colors.white,),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Add Coupon Code",
                        style:TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          )
                      ),),
                      
                    ],),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }}
  
  