
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Cartitemwidget extends StatelessWidget {
  const Cartitemwidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        for(int i =1 ; i<4; i++)
        Container(
        height: 110,
        margin:EdgeInsets.symmetric(horizontal: 20, vertical: 10) ,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(children: [
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(right: 15),
            child: Image.asset("image/1.png"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Produc title",
                   style:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    )
                   ),
                   Text("Black - Size L",
                   style:TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 169, 174, 222),
                    )
                   ),
                  Text("\$55 ",
                   style:TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    )
                   ),
                ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.delete,
                  color: Colors.red,
                ),
                Container(
                  width: 120,
                  height: 40,
                  padding: EdgeInsets.only(left: 10),
                 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    crossAxisAlignment: CrossAxisAlignment.center, 
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey,
                              spreadRadius: 1,
                              blurRadius: 10,
                            )
                          ]
                        ),
                        child:Icon(CupertinoIcons.plus, 
                        size: 18,
                        ) ,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child:Text (
                          "01", 
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ) ,
                        ) ,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey,
                              spreadRadius: 1,
                              blurRadius: 10,
                            )
                          ]
                        ),
                        child:Icon(CupertinoIcons.minus, 
                        size: 18,
                        ) ,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
        ),
      )
      ]
      
    );  
        
    
  }}