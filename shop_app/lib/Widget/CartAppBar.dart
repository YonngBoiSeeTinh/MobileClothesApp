
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CartAppbar extends StatelessWidget {
  const CartAppbar({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
             InkWell(
              onTap: () {
              Navigator.pushNamed(context, '/');
              },
              child: Icon(
                Icons.arrow_back, 
                size: 30,
                color: Color(0xFF4C53A5)),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                          text: 'Cart',
                          style: GoogleFonts.portLligatSans(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                    ),
                    Icon(Icons.shopping_bag_outlined,
                    size: 33,
                    color: Color(0xFF4C53A5),
                  ),
                  ],
                ),
              ),
              Spacer(),
               Icon(
                Icons.more_vert, 
                size: 30,
                color: Color(0xFF4C53A5)),
          ]
         ),
    );
  }
}