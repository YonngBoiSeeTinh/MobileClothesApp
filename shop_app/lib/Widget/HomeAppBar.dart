import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5),
      height: 60,
      child: Row(
        children: [
          Icon(Icons.sort,
          size: 30,
          color: Color(0xFF4C53A5)),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child:  RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: 'Sh',
                    style: GoogleFonts.portLligatSans(
                      
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF4C53A5),
                    ),
                    children: [
                      TextSpan(
                        text: 'op',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      TextSpan(
                        text: ' App',
                        style: TextStyle(color: Color(0xFF4C53A5), fontSize: 30),
                      ),
                    ]),
              )
          ),
          Spacer(),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/cartPage');
            },
            child: Icon(Icons.shopping_bag_outlined,
                     
              size: 33,
              color: Color(0xFF4C53A5),
            ),
          ),
         
          
        ],
      ),
    );
  }
}