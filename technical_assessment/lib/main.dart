import 'package:flutter/material.dart';
import 'package:technical_assessment/pages/main_display/main_tabs.dart';
import 'package:technical_assessment/pages/sign_in/sign_in.dart';
import 'package:technical_assessment/storage/stored_user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (await StoredUser().getStoredUser() == null) {
    runApp(const MyApp(chosenWidget: SignInPage()));
  } else {
    runApp(const MyApp(chosenWidget: MainTabsPage()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.chosenWidget});
  final Widget chosenWidget;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SafeArea(child: chosenWidget),
    );
  }
}

