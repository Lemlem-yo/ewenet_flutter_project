import 'package:arat_kilo/Screens/Home.dart';
import 'package:arat_kilo/content_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
//
int currentIndex = 0;
late PageController _controller;

@override
  void initState() {

    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }
  //
  @override
  void dispose() {
  _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
                onPageChanged: (int index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        decoration: const BoxDecoration(
                            color: Color(0xFFede8e8),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200),
                              bottomRight: Radius.circular(10)

                            )
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              contents[index].image,
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                       Text(
                        contents[index].title,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,

                          ),

                    ),
                     Padding(
                        padding:  EdgeInsets.all(40),
                        child:  Text(
                            contents[index].discription,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey
                        )
                        ),
                      ),
                    ],
                  );
                },
            ),
          ),
          Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: List.generate(contents.length, (index) => buildDot(index, context)),
             ),
          ),
          Container(
            height: 55,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF12A19A),
              borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
            ),
            child: TextButton(
              onPressed: () {
                if(currentIndex == contents.length - 1){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_)=> HomePage()));

                }
                _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn,);
              },
              child:  Text(
                currentIndex == contents.length - 1 ? "Continue": "Next",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),

              ),
            ),
          )
        ],
      ),

    );
  }

  Container buildDot( int index, BuildContext context) {
    return Container(
              height: 10,
              width: currentIndex == index ? 25 : 10,
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF12A19A),
              ),
          );
  }
}
