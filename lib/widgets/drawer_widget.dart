import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_buddy/constants/color_const.dart';
import 'package:event_buddy/view/login_page.dart';
import 'package:event_buddy/widgets/auth_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.deepPurple),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/236x/23/ac/1a/23ac1a907311c7f2bfe777f3d425beb2.jpg',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Devanand",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "deva@gmail.com",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        drawerCard(
          icon: Icons.settings,
          iconColor: ColorConsts.purple,
          label: 'Settings',
          onTap: () {},
        ),
        drawerCard(
          icon: Icons.dark_mode,
          iconColor: ColorConsts.purple,
          label: 'Theme',
          onTap: () {},
        ),
        drawerCard(
          icon: Icons.help,
          iconColor: ColorConsts.purple,
          label: 'Help & Support',
          onTap: () {},
        ),
        drawerCard(
          icon: Icons.info,
          iconColor: ColorConsts.purple,
          label: 'About',
          onTap: () {},
        ),
        SizedBox(height: 20),
        const Divider(),
        SizedBox(height: 20),
        drawerCard(
          icon: Icons.logout,
          iconColor: Colors.red,
          label: 'Log Out',
          textColor: Colors.red,
          onTap: () {
            FirebaseAuth.instance.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => LoginScreen()),
            );
          },
        ),
      ],
    ),
  );
}

Widget drawerCard({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
  Color iconColor = Colors.black,
  Color textColor = Colors.black,

}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color:iconColor,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
