import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name = '';
  String _email = '';
  List<String> _selectedRoles = [];
  bool _notifyMe = false;

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
              decoration: BoxDecoration(
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
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Name"),
                          hintText: 'Enter your name',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Select Role(s):'),
                      CheckboxListTile(
                        title: Text('Author'),
                        value: _selectedRoles.contains('Author'),
                        onChanged: (value) {
                          _updateSelectedRoles('Author', value!);
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Reader'),
                        value: _selectedRoles.contains('Reader'),
                        onChanged: (value) {
                          _updateSelectedRoles('Reader', value!);
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Poemer'),
                        value: _selectedRoles.contains('Poemer'),
                        onChanged: (value) {
                          _updateSelectedRoles('Poemer', value!);
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Other'),
                        value: _selectedRoles.contains('Other'),
                        onChanged: (value) {
                          _updateSelectedRoles('Other', value!);
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text('Notify me:'),
                          Switch(
                            value: _notifyMe,
                            onChanged: (value) {
                              setState(() {
                                _notifyMe = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        child: Text('Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ClipRect(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Follow us on social media:'),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook),
                        onPressed: () {
                          // Add your Facebook link here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {
                          // Add your Email link here
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.link),
                        onPressed: () {
                          // Add your LinkedIn link here
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

  void _updateSelectedRoles(String role, bool selected) {
    setState(() {
      if (selected) {
        _selectedRoles.add(role);
      } else {
        _selectedRoles.remove(role);
      }
    });
  }

  void _submitForm() {
    // Add your logic to handle form submission
    print('Name: $_name');
    print('Email: $_email');
    print('Roles: $_selectedRoles');
    print('Notify Me: $_notifyMe');
  }
}
