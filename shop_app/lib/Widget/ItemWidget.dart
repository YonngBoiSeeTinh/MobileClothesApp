import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/AppConfig.dart';
import 'dart:convert';

import 'package:shop_app/Page/ProductDetail.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConfig.baseUrl}/api/Products'));
       
      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
        });
      } else {
        print('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
          );
          
  }
}

class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              if (product['discount'] != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4C53A5),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Text(
                    "${product['discount']}%",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const Spacer(),
              const Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product,), // Truyền id vào ProductUpdatePage
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Image.memory(
               base64Decode(product['image']),
                height: 120,
                width: 120,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              product['name'] ?? "Item name",
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF4C53A5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: index < (product['rating'] ?? 0)
                        ? Colors.amber
                        : Colors.grey,
                    size: 18,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                "${product['reviews'] ?? 0} reviews",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 76, 78, 95),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${product['price'] ?? 0} VNĐ",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 68, 72, 109),
                  ),
                ),
                const Icon(
                  Icons.shopping_cart_checkout_rounded,
                  color: Color.fromARGB(255, 68, 72, 109),
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
