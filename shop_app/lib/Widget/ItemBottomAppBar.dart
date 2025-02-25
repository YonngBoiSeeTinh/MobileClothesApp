import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatefulWidget {
   Map<String, dynamic>? product;
  ItemBottomNavBar({required this.product});
  @override
  _ItemBottomNavBarState createState() => _ItemBottomNavBarState();
}
  
class _ItemBottomNavBarState extends State<ItemBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return  Positioned(
            bottom: 0,
            left: 0,
            right: 0,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.product?['price']} VND',
                        style: TextStyle(
                          color: Color(0xFF4C53A5),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xFF4C53A5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "Add to cart",
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
          );
    }
}
