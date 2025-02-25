import 'dart:convert'; // Để decode Base64
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/Page/AddProduct.dart';
import 'package:shop_app/Page/EditProduct.dart';
import 'package:shop_app/Widget/Alter.dart';
import '../AppConfig.dart';
class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  List<dynamic> products = []; // Danh sách sản phẩm
  List<dynamic> categories = []; 
  @override
  void initState() {
    super.initState();
    fetchProducts(); 
    fetchCategories();// Gọi API khi khởi tạo
  }
  Future<void> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/api/Categories'));
      if (response.statusCode == 200) {
        setState(() {
          categories = jsonDecode(response.body);
        });
      } else {
        print('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/api/Products')); 
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

   Future<void> deleteProduct(int id) async {
    try {
      final response = await http.delete(Uri.parse('${ApiConfig.baseUrl}/api/Products/${id}')); 
      if (response.statusCode == 204) {
        showDialog(
        context: context,
        builder: (BuildContext context) {
          return Alter(message: 'Cập nhật sản phẩm thành công!');
        },
      ).then((_) {
        fetchProducts();
      });
      } else {
        print('Failed to delete products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
  String getCategoryName(int categoryId) {
    final category = categories.firstWhere(
      (category) => category['id'] == categoryId,
      orElse: () => null,
    );
    return category != null ? category['name'] : 'Unknown Category';
  }
  void _showProductDetailDialog(BuildContext context, dynamic product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: Container(
             width: MediaQuery.of(context).size.width * 0.7, 
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    "${product['name']}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Image
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: product['image'] != null
                          ? Image.memory(
                              base64Decode(product['image']),
                              height: 200,
                            )
                          : Container(
                              height: 200,
                              color: Colors.grey[200],
                              child: Icon(Icons.image, color: Colors.grey),
                            ),
                    ),
                  ),
                  SizedBox(height: 8),
                   Text(
                    "Category: ${getCategoryName(product['categoryId'])}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  // Price
                   SizedBox(height: 8),
                  Text(
                    "Price: ${product['price']} VND",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                     Text(
                              'Promotion: ${product['promo']}%',
                              style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 104, 176, 239)),
                            ),
                  SizedBox(height: 8),
                  // Rate
                  // Sold
                  Text(
                    "Sold: ${product['sold']}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
               
                  Row(
                    children: [
                      Text(
                        "Rate: ",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      ...List.generate(
                        product['rate'] ?? 0,
                        (index) => Icon(Icons.star, color: Colors.amber, size: 20),
                      ),
                      // ...List.generate(
                      //   5 - (product['rate'] ?? 0),
                      //   (index) => Icon(Icons.star_border, color: Colors.grey, size: 20),
                      // ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Category
                 
                ],
              ),
            ),
          ),
        );
      },
    );
  }
    Future<void> showConfirmDialog({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng hộp thoại
              },
              child: Text("Hủy"),
            ),
            TextButton(
              onPressed: () {
                onConfirm(); // Gọi hành động xác nhận
                Navigator.of(context).pop(); // Đóng hộp thoại
              },
              child: Text("Xóa"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Manager",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF4C53A5)),
        ),
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final String? base64Image = product['image'];

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      // Hiển thị ảnh từ Base64
                      base64Image != null
                          ? Image.memory(
                              base64Decode(base64Image),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey[200],
                              child: Icon(Icons.image, color: Colors.grey),
                            ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C53A5),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Giá: ${product['price']} VND',
                              style: TextStyle(fontSize: 16, color: Color(0xFF4C53A5)),
                            ),
                            SizedBox(height: 4),
                            
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _showProductDetailDialog(context, product);
                            },
                            icon: Icon(Icons.remove_red_eye),
                            color: Color.fromARGB(255, 68, 128, 202),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductUpdatePage(id: product['id']), // Truyền id vào ProductUpdatePage
                                  ),
                                );
                             },
                            icon: Icon(Icons.edit),
                            color: Colors.orange,
                          ),
                          IconButton(
                            onPressed: () {
                              showConfirmDialog(
                                context: context,
                                title: "Xác nhận",
                                content: "Bạn có chắc muốn xóa sản phẩm này không?",
                                onConfirm: () {
                                  deleteProduct(product['id']);
                                },
                              );
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => (AddProductPage()), // Truyền id vào ProductUpdatePage
          ),);
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF4C53A5),
      ),
    );
  }
}
