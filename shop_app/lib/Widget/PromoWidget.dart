import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:shop_app/Page/ProductDetail.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/AppConfig.dart';
import 'dart:convert';

class Promowidget extends StatefulWidget {
  const Promowidget({super.key});
  @override
  _PromowidgetState createState() => _PromowidgetState();
}

class _PromowidgetState extends State<Promowidget> {
  Map<String, dynamic>? product;
  bool isLoading = true; //  biến trạng thái để kiểm tra  tải dữ liệu

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConfig.baseUrl}/api/Products/3'));

      if (response.statusCode == 200) {
        setState(() {
          product = jsonDecode(response.body);
          isLoading = false; // Dữ liệu đã được tải
        });
      } else {
        print('Failed to load products: ${response.statusCode}');
       
      }
    } catch (e) {
      print('Error fetching products: $e');
    }finally{
       setState(() {
        isLoading = false; // Ngừng trạng thái tải nếu gặp lỗi
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Color.fromARGB(255, 106, 107, 122),
          ),
        ],
      ),
      child: product == null
              ?  Container(
                  width: 380,
                  height: 250,
                  child: Text(''),
                )
              : buildPromoContent(context),
    );
  }

  Widget buildPromoContent(BuildContext context) {
    Uint8List bytesImage = const Base64Decoder().convert(product?['image'] ?? '');

    return Stack(
      children: [
        // Ảnh nền
        Container(
          width: 380,
          height: 250,
          padding: const EdgeInsets.only(left: 120),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: isLoading
          ? const Center(
              child: CircularProgressIndicator(), // Hiển thị khi đang tải dữ liệu
            )
          :  Image.memory(
                  bytesImage,
                  width: 250,
                )
             
        ),
        // Chữ nổi
        Positioned(
          top: 50,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '25% Off',
                style: TextStyle(
                  color: Color.fromARGB(255, 138, 143, 213),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 3,
                      color: Color.fromARGB(255, 28, 34, 99),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sep 10 - Sep 17',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: product,
                      ), 
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: Color(0xFF4C53A5), // Màu viền
                      width: 2, // Độ dày viền
                    ),
                  ),
                ),
                child: const Text(
                  'Grab Now',
                  style: TextStyle(
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
