
import 'package:flutter/material.dart';

class Categorywidget extends StatelessWidget {
  const Categorywidget({super.key});

  @override 
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i = 1; i<8; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("image/1.png",width: 40,height: 40,),
                Text("Shoes",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4C53A5),
                  fontWeight: FontWeight.w400,
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}