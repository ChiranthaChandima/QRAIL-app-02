import 'package:flutter/material.dart';
import 'package:qrail_fp/screens/Booking/booking_history_list.dart';
import 'package:qrail_fp/screens/profile_section/profile_section.dart';
import 'package:qrail_fp/screens/widgets/profile_menu_widget.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1c50d0),
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Profile Image
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo1.jpg'),
                    radius: 50.0,
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Yudeesha',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                ),
                Text(
                  'yudeesha@gmail.com',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black54,
                      ),
                ),
                SizedBox(height: 20),

                // View Profile Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Profile(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1c50d0),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Divider(thickness: 1),
                SizedBox(height: 10),

                // Menu items
                ProfileMenuWidget(
                  title: "Travel History",
                  icon: Icons.train_outlined,
                  onPress: () {},
                ),
                ProfileMenuWidget(
                  title: "Booking History",
                  icon: Icons.book_online_outlined,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const BookingHistory(),
                      ),
                    );
                  },
                ),

                SizedBox(height: 30),
                Divider(thickness: 1),
                SizedBox(height: 10),

                // Logout Menu
                ProfileMenuWidget(
                  title: "Logout",
                  icon: Icons.logout_outlined,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
