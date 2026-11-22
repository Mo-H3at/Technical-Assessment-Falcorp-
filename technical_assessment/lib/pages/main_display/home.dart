import 'package:flutter/material.dart';
import 'package:technical_assessment/pages/membership_levels/plus/plus_home.dart';
import 'package:technical_assessment/pages/membership_levels/premium/premium_home.dart';
import 'package:technical_assessment/pages/membership_levels/starter/starter_home.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,required this.membershipLevel});
  final String? membershipLevel;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     if (widget.membershipLevel == "plus") {
        return PlusHomeWidget();
     } 
     else if(widget.membershipLevel == "premium"){
       return PremiumHomeWidget();
     }
     else{
       return StarterHomeWidget();
     }
     
  }
}