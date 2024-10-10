import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ListView(
      
      children: const [
         ListTile(
          title: 
          Text('Name'),
          leading: Icon(Icons.person_2_rounded),
        ),
         ListTile(
          title: 
          Text('Edit Profile'),
          leading: Icon(Icons.edit),
        ),
         ListTile(
          title: Text('Privacy Information'),
          leading: Icon(Icons.privacy_tip_outlined),
        ),
         ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.logout),
        ),
      ],
    );
  }
}