
import 'package:flutter/material.dart';

class Promowidget extends StatelessWidget {
  const Promowidget({super.key});

  @override 
  Widget build(BuildContext context) {
   return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
           boxShadow: [
            BoxShadow(
              blurRadius: 20, 
              color: Color.fromARGB(255, 106, 107, 122), 
            ),
          ],         
        ),
        child: Stack(
          children: [
            // Ảnh nền
            Container(
              width: 380,
              height: 250,
              padding: EdgeInsets.only(left: 120),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                 color: Colors.white,
              ),
              child: Image.asset("image/1.png",width: 250),
            ),
            // Chữ nổi
            Positioned(
              top: 50,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
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
                  SizedBox(height: 10),
                  Text(
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
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor:  Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                         side: BorderSide(
                            color: Color(0xFF4C53A5), // Màu viền
                            width: 2, // Độ dày viền
                          ),
                      ),
                    ),
                    child: Text(
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
        ),
      );
 
  }
}