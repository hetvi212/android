import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Registration Form';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registration Form'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16), // Added padding to the container
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)
                ),
                icon: Icon(Icons.person),
                hintText: 'Username',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)
                ),
                icon: Icon(Icons.phone),
                hintText: 'Contact Number',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter a valid contact number';
                }
                RegExp mobilePattern = RegExp(r'^\d{10}$');
                if (!mobilePattern.hasMatch(value)) {
                  return 'Please enter a valid 10-digit mobile number';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)
                ),
                icon: Icon(Icons.email),
                hintText: 'Enter Email',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a valid email';
                } else {
                  final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                  if (!emailValid) {
                    return 'Please enter a valid email';
                  }
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink)
                ),
                icon: Icon(Icons.password),
                hintText: 'Password',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Handle button tap here
                if (_formKey.currentState!.validate()) {
                  print("Registration Form Validated and Submitted");
                }
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


