// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

  String groupValue = "Passenger";

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  bool _isNicEnabled = true; // To control the NIC text field enablement
  final bool _isPasswordVisible = true;
  final bool _isConfirmmPasswordVisible = true;

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the widget tree
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _nicController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text('Create Account'),
          backgroundColor: const Color(0xFF1c50d0),
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  _inputField(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _inputField(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: "Username *",
              prefixIcon: Icon(Icons.person_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "Password *",
              prefixIcon: Icon(Icons.lock_outlined),
              // suffixIcon: : IconButton(
              //   icon: Icon(Icons.visibility),
              // )
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            obscureText: true,
            controller: _confirmpasswordController,
            decoration: InputDecoration(
              labelText: "Confirm Password *",
              prefixIcon: Icon(Icons.lock_outlined),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
              labelText: "Full Name *",
              prefixIcon: Icon(Icons.person_outlined),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Email *",
              prefixIcon: Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _phoneNumberController,
            decoration: InputDecoration(
              labelText: "Phone number *",
              prefixIcon: Icon(Icons.phone_outlined),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2),
            child: Row(
              children: <Widget>[
                Radio(
                    value: "Passenger",
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                        _isNicEnabled = true; // Enable NIC field for Passenger
                      });
                    }),
                Text(
                  "Passenger",
                  style: TextStyle(fontSize: 16.0),
                ),
                Radio(
                    value: "Checking Guard",
                    groupValue: groupValue,
                    onChanged: (value) {
                      setState(() {
                        groupValue = value!;
                        _isNicEnabled =
                            false; // Disable NIC field for Checking Guard
                      });
                    }),
                Text(
                  "Checking Guard",
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: _nicController,
            enabled:
                _isNicEnabled, // Control enablement based on the radio button selection
            decoration: InputDecoration(
              labelText: "NIC *",
              prefixIcon: Icon(Icons.person_outlined),
            ),
            validator: (value) {
              if (_isNicEnabled && (value == null || value.isEmpty)) {
                return 'Please enter your NIC';
              }
              return null;
            },
          ),
          SizedBox(
            height: 30.0,
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1c50d0),
              padding: EdgeInsets.symmetric(vertical: 17.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 8,
              shadowColor: Colors.black.withOpacity(1),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
