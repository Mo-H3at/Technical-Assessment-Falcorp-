import 'package:flutter/material.dart';
import 'package:technical_assessment/pages/settings/delete_profile.dart';
import 'package:technical_assessment/pages/settings/sign_out.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings'),
      ),
      body: Center(
        child: ListView(
          children: [
            InkWell(
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Row(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,),
                      Text('User Details',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              onTap: () {
                 
              },
            ),
            InkWell(
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Row(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout,),
                      Text('Sign Out', 
                        style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              onTap: () => showDialog(context: context, builder: (context) => SignOutWidget()),
            ),
            InkWell(
              child: Container(
                height: 60,
                color: const Color.fromARGB(255, 14, 8, 8),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Row(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_remove_alt_1_sharp, color: const Color.fromARGB(255, 255, 17, 0),),
                      Text('Delete Profile', 
                        style: TextStyle(color: const Color.fromARGB(255, 255, 17, 0), fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              onTap: () => showDialog(context: context, builder: (context) => DeletProfileWidget()),
            ),
          ],
        ),
      ),
    );
  }
}