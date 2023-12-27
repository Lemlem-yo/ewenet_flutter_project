import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12A19A) ,
      appBar: AppBar(
        actions: [
          Center(
            child: Padding(

              padding: const EdgeInsets.only(right: 10.0), // Optional padding
              child: SvgPicture.asset(
                'assets/images/4kilo_title.svg',
                width: 60.0, // Set the desired width
                height: 30.0, // Set the desired height
              ),
            ),
          ),
        ],
      ),
     body: Column(
       children: [
         SizedBox(height: 40,),
         Container(
           padding: const EdgeInsets.all(7.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [
             ClipRRect(
               borderRadius: BorderRadius.circular(100.0),
               child: Container(
                 margin: EdgeInsets.only(
                   right: 100,
                   left: 100,
                   top: 40
                 ),
                 decoration: BoxDecoration(
                   color: Colors.grey[300],
                 ),
                 child: SvgPicture.asset(
                   'assets/images/4kilo_logo.svg',
                   height: 200.0,
                 ),
               ),
             ),
             ],
           ),

         ),
         SizedBox(height: 40,),
         const Text("Thank You",
         style: TextStyle(
           color: Colors.white,
           fontSize: 45,
           fontWeight: FontWeight.bold
         ),),
         const Padding(
           padding: EdgeInsets.all(20.0),
           child: Text("Thank you for registering your intereset in one of our programmes.\n"
               "We will notify you once the application re-opens.",
           style: TextStyle(
             color: Colors.white,
             fontSize: 18,
           ),),
         )
       ],

     )
    );
  }
}
