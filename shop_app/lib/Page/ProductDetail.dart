import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_app/AppConfig.dart';
import 'package:shop_app/Widget/ItemAppBarWidget.dart';
import 'package:shop_app/Widget/ItemBottomAppBar.dart';

class ProductDetailPage extends StatefulWidget {
  Map<String, dynamic>? product;
  ProductDetailPage({required this.product});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          Itemappbarwidget(),
          _buildProductImage(),
          _buildProductDetails(),
        ],
      ),
      bottomNavigationBar: ItemBottomNavBar(product: widget.product,),
    );
  }

  Widget _buildProductImage() {
    return Arc(
      height: 30,
      edge: Edge.BOTTOM,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Image.memory(
            base64Decode(widget.product?['image']),
            height: 350,
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            widget.product?['name'],
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C53A5),
            ),
          ),
        ),
       
        _buildRatingAndQuantity(),
         _buildColorSizeOptions(),
        _buildDescription(),
      
      ],
    );
  }

  Widget _buildRatingAndQuantity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                    for(int i = 0; i < 5;i++)
                  Icon(  Icons.favorite,
                    color: Color(0xFF4C53A5),
                    size: 30,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
              children: [
                _buildQuantityButton(CupertinoIcons.plus),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "01",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ),
                _buildQuantityButton(CupertinoIcons.minus),
              ],
                        ),
            ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
  Widget _buildColorSizeOptions() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 10),
                child: Text(
                  "Color :",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),
              Wrap(
                spacing: 6,
                runSpacing: 8,
                children: List.generate( 3,
                  (index) => Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF4C53A5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 146, 148, 175),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10,),
                child: Text(
                  "Sizes :",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),
              Wrap(
                spacing: 6,
                runSpacing: 8,
                children: List.generate( 3,
                  (index) => Container(
                    height: 35,
                    width: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: const Color.fromARGB(255, 146, 148, 175),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "M",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildDescription() {
  return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  child: RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "Description: ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4C53A5),
          ),
        ),
        TextSpan(
          text:
              widget.product?['description'],
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 129, 136, 208),
          ),
        ),
      ],
    ),
    maxLines: 3, // Giới hạn dòng (tùy chọn)
    overflow: TextOverflow.ellipsis, // Dấu "..." khi bị cắt
  ),
);


  }
}
