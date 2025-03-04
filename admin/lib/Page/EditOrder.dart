import 'package:flutter/material.dart';
import 'package:shop_app/AppConfig.dart';
import 'package:shop_app/Page/HomePage.dart';
import 'package:shop_app/Widget/Alter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class OrderUpdateWidget extends StatefulWidget {
  final List<dynamic> orders; 
  final List<dynamic> orderDetails; 
  final List<dynamic> products;
  final int orderId;
  const OrderUpdateWidget({super.key, 
    required this.orderDetails,
    required this.orders,
    required this.products,
    required this.orderId,
  });
  
  @override
  _OrderUpdateWidgetState createState() => _OrderUpdateWidgetState();
}

class _OrderUpdateWidgetState extends State<OrderUpdateWidget> {

  List<dynamic> getOrderDetailsByOrderId(int orderId) {
    return widget.orderDetails.where((detail) => detail['orderId'] == orderId).toList();
  }
  Map<String, dynamic>? order;

  String getProduct(dynamic productId) {
    final product = widget.products.firstWhere(
      (product) => product['id'].toString() == productId.toString(),
      orElse: () => null,
    );
    return product?['name'] ?? 'Không rõ sản phẩm';
  }

  String? selectedStatus;
  final List<String> statuses = ["Chờ xác nhận", "Đã xác nhận", "Đang giao", "Đã giao"];

  @override
  void initState() {
    super.initState();
    order = widget.orders.firstWhere((o) => o['id'] == widget.orderId, orElse: () => null);
    selectedStatus =  order?['status'] ;
  }
  Future<void> updateOrder() async {
    var uri = Uri.parse('${ApiConfig.baseUrl}/api/Orders/${widget.orderId}');
      final body = jsonEncode({
        "createdAt": order?['createdAt'],
        "userId": order?['userId'],
        "totalPrice": order?['totalPrice'],
        "name": order?['name'],
        "paymentMethod": order?['paymentMethod'],
        "paymentStatus": order?['paymentStatus'],
        "cancellationReason": order?['cancellationReason'],
        "phone": order?['phone'],
        "address": order?['address'],
        "status": selectedStatus,
      });

    try {
      final response = await http.put(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );

      if (response.statusCode == 204) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alter(message: 'Cập nhật đơn hàng thành công!');
          },
        ).then((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(index: 2),
            ),
          );
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alter(message: 'Cập nhật đơn hàng thất bại!');
          },
        );
        print('Failed to update order: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    final order = widget.orders.firstWhere((o) => o['id'] == widget.orderId, orElse: () => null);
    final selectedOrderDetails = getOrderDetailsByOrderId(widget.orderId);
    if (order == null) {
      return Center(
        child: Text(
          "Order not found",
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Update Order" ,style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),),
        backgroundColor: Color(0xFF4C53A5),
         iconTheme: IconThemeData(
          color: Colors.white,
         ),
      ),
      body: Container(
      
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customer Name: ${order['name'] ?? 'N/A'}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                "Address: ${order['address'] ?? 'N/A'}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                "Phone: ${order['phone'] ?? 'N/A'}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                "Product List:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              SizedBox(height: 8),
              Column(
                children:
                 selectedOrderDetails.map((od) {
                  String productName = getProduct(od['productId']);
                  String formattedPrice = "${od['price']}".replaceAllMapped(
                    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
                    (match) => "${match[1]},",
                  );
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 16),
                        Expanded(
                          child: Text(
                            productName,
                            style: TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${od['quantity']} x ",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "$formattedPrice VND",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Divider(color: Color.fromARGB(255, 75, 83, 174)),
              Text(
                "Total Price: ${order['totalPrice'] ?? '0'} VND",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(height: 16),
              Text(
                "Update Status:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                items: statuses.map((String status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                updateOrder();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                          Container(
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFF4C53A5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
              ),
            ),
          ),
    );
  }
}
