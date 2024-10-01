import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: const Color(0xFF1c50d0), 
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_profileState(context)],
          ),
        ),
      ),
    );
  }

  Widget _profileState(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo1.jpg'),
            radius: 50.0, 
            backgroundColor: Colors.grey, 
          ),
        ),
        Divider(
          height: 60.0,
          thickness: 1.5, 
          color: Colors.grey, 
        ),
        Text(
          "Name",
          style: TextStyle(
            letterSpacing: 2.0,
            color: Colors.black54, 
            fontWeight: FontWeight.w600, 
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Yudeesha',
          style: TextStyle(
            fontSize: 22.0, 
            color: Color(0xFF1c50d0), 
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          "Phone",
          style: TextStyle(
            letterSpacing: 2.0,
            color: Colors.black54, 
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          '0777940210',
          style: TextStyle(
            fontSize: 22.0,
            color: Color(0xFF1c50d0), 
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
