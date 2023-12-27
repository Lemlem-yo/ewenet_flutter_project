import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'SecondPage.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String valueChoose = '';
  List<String> listItem = [
    'Author',
    'Podcast hoster',
    'Reader',
  ];
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _describRole = TextEditingController();
  TextEditingController _sex = TextEditingController();
  TextEditingController _age = TextEditingController();

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _email = TextEditingController();
    _phoneNumber = TextEditingController();
    _describRole = TextEditingController();
    _sex = TextEditingController();
    _age = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12A19A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SvgPicture.asset(
                  "assets/images/4kilo_title.svg",
                  height: 50,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _name,
                        onChanged: (value) {
                          setState(() {
                            _name.text = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            "Name",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'Enter your name',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _email,
                        onChanged: (value) {
                          setState(() {
                            _email.text = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneNumber,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          setState(() {
                            _phoneNumber.text = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            "Phone Number",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'Enter phone number',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _describRole,
                        onChanged: (value) {
                          setState(() {
                            _describRole.text = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Role here';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            "Describe Your Role:"
                                "\n(eg. author, podcast hoster,)",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'Enter Your Role',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _sex,
                        onChanged: (value) {
                          setState(() {
                            _sex.text = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Role here';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            "Sex/Gender:"
                                "\n(eg. Female or Male,)",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'Enter Your sex/Gender',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _age,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _age.text = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Role here';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text(
                            "Age",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: 'Enter Your Age',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF12A19A),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF12A19A), width: 1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          isExpanded: true,
                          underline: SizedBox(),
                          value: valueChoose.isNotEmpty ? valueChoose : null,
                          hint: const Text(
                            'Enter your role: ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          items: listItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              valueChoose = newValue.toString();
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _submitForm();
                          print("register");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => SecondPage()),
                          );
                        },
                        child: const Text(
                          'Notify Me',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF12A19A)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRect(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      'Follow us on social media:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          _launchURL('https://www.facebook.com/EwenetCommunicationPLC/');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {
                          _launchURL('mailto:ewenetnet@gmail.com');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.link),
                        onPressed: () {
                          //  LinkedIn link here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //
  void _launchURL(String url) async {
    try {
      await launch(url);
    } catch (e) {
      print('Error launching URL: $e');
    }
  }




  Future<void> _submitForm() async {
    String name = _name.text;
    String email = _email.text;
    String phoneNumber = _phoneNumber.text;
    String describeRole = _describRole.text;
    String sex = _sex.text;
    String age = _age.text;

    // Update the API URL with your actual server URL
    String apiUrl = 'http://192.168.100.183:3000/registration/register';

    // Construct the user data
    Map<String, dynamic> userData = {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'describeRole': describeRole,
      'sex': sex,
      'age': age,
    };

    // Convert the user data to JSON format
    String jsonData = jsonEncode(userData);

    try {
      // Make a POST request to the NestJS API
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print('Registration successful');
        _name.clear();
        _email.clear();
        _phoneNumber.clear();
        _describRole.clear();
        _sex.clear();
        _age.clear();
        setState(() {
          valueChoose = ''; // Reset dropdown value
        });
      } else {
        print('Error submitting form. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error submitting form: $error');
    }
  }
}
