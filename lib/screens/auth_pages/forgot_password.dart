// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text(
            'Forgot Password',
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _header(context),
                  _inputField(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30.0),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/logo.jpg'),
          radius: 65.0,
        ),
        SizedBox(height: 60.0),
      ],
    );
  }

  _inputField(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Enter Your Email",
              fillColor: Theme.of(context).primaryColor.withOpacity(0.8),
              prefixIcon: Icon(Icons.email),
            ),
            validator: (value) {
              //email validation
              if (value == null || value.isEmpty || !value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '* We will send you an email to set or reset your password',
            style: GoogleFonts.roboto(
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
