import 'package:flutter/material.dart';

class Itemwidget extends StatelessWidget {
  const Itemwidget({super.key});

    @override 
    Widget build(BuildContext context){
      return  GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        shrinkWrap: true,
        padding: const EdgeInsets.all(6),
        children:[
        for(int i = 0; i<10; i++)
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFF4C53A5),
                      borderRadius: BorderRadius.circular(1000)
                    ),
                    child: Text("50%", style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                  Spacer(),
                  Icon(Icons.favorite_border,
                    color: Colors.red,),
                  
                ],
              ),
              InkWell(
                onTap: () {
                   Navigator.pushNamed(context, '/productDetail');
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    "image/1.png",
                   height: 120,
                   width: 120,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Item name", style: TextStyle(
                      fontSize: 18,
                       color: Color(0xFF4C53A5),
                      fontWeight: FontWeight.bold
                    ),),
              ),
             
              Row(
                  children: [
                    Row(
                      children: [
                        for (int i = 0; i<=4; i++)
                        Icon(Icons.star,
                        color: Colors.amber,
                        size:18,)
                      ],
                    ),
                    Spacer(),
                    Text("5049 rates", style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 76, 78, 95),
                    ),)
                  ],
                ),
               
              Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("5000", style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 68, 72, 109),
                        ),),
                        Icon(Icons.shopping_cart_checkout_rounded,
                          color: Color.fromARGB(255, 68, 72, 109),
                          size:20,
                          )
                    ],
                                    
                                  ),
                  )
            ],
          ),
        ),]
      );
    }
 
} 