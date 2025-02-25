import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AdminAppBar extends StatelessWidget {
  const AdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xFF4C53A5),
      padding: EdgeInsets.all(5),
      height: 60,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child:  RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: 'Sh',
                    style: GoogleFonts.portLligatSans(
                      
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 254, 255, 255),
                    ),
                    children: [
                      TextSpan(
                        text: 'op App',
                        style: TextStyle(color: const Color.fromARGB(255, 219, 124, 64), fontSize: 30),
                      ),
                      TextSpan(
                        text: ' Manager',
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 30),
                      ),
                    ]),
              )
          ),
          
        ],
      ),
    );
  }
}