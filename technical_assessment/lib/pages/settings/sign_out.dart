import 'package:flutter/material.dart';
import 'package:technical_assessment/storage/stored_user.dart';

import '../sign_in/sign_in.dart';

class SignOutWidget extends StatefulWidget {
  const SignOutWidget({super.key});

  @override
  State<SignOutWidget> createState() => _SignOutWidgetState();
}

class _SignOutWidgetState extends State<SignOutWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      icon: Icon(Icons.logout,),
      title: const Text('Sign Out?', style: TextStyle(fontSize: 14)),
      contentPadding: const EdgeInsets.all(20),
      actionsPadding: EdgeInsets.all(5),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No')),
        ElevatedButton(
          onPressed: () {
            StoredUser().removeStoredUser();
            Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) => SignInPage()),
              (route) => false);
          },
          child: const Text('Yes')),
      ],
    );
  }
}