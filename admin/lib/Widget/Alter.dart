import 'package:flutter/material.dart';

class Alter extends StatelessWidget {
  final String message;

  Alter({required this.message});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return AlertDialog(
          title: Text('Thông báo'),
          backgroundColor: Colors.white,
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      }
    );
  }
}
