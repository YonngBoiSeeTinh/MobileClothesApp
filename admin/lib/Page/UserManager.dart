import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/AppConfig.dart';

class UserManager extends StatefulWidget {
  const UserManager({super.key});

  @override
  _UserManagerState createState() => _UserManagerState();
}

class _UserManagerState extends State<UserManager> {
  List<dynamic> users = [];
 @override
  void initState() {
    super.initState();
    fetchUsers();
  }
  Future<void> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/api/Users'));
      if (response.statusCode == 200) {
        setState(() {
          users = jsonDecode(response.body);
        });
      } else {
        print('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
  void _showUserDetails(Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "User Details",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${user['name']}", style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text("Address: ${user['address']}", style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text("Phone: ${user['phone']}", style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text("Role: ${user['role']}", style: TextStyle(fontSize: 18)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
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
          "User Manager",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: EdgeInsets.all(16),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)
                            ),
                      child: user?['image'] != null
                            ? Image.memory(
                                base64Decode(user['image']),
                                height: 40,
                            )
                          : Container(
                              height: 40,
                              color: Colors.grey[200],
                              child: Icon(Icons.image, color: Colors.grey),
                            ),
                    ),
                  
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['name'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Text(user['phone'], style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                     Container(
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: user['role'] == 'Admin'
                              ? Colors.green
                                  : const Color.fromARGB(255, 95, 165, 195),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        ' ${ user['role']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 47, 47, 47)),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _showUserDetails(user);
                          },
                          icon: Icon(Icons.remove_red_eye),
                          color: Colors.blue,
                        ),
                        IconButton(
                          onPressed: () {
                            print('Edit user: ${user['name']}');
                          },
                          icon: Icon(Icons.edit),
                          color: Colors.orange,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              users.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
