import 'package:flutter/material.dart';
import 'package:technical_assessment/pages/membership_levels/plus/plus_upgrade.dart';
import 'package:technical_assessment/pages/membership_levels/premium/premium_upgrade.dart';
import 'package:technical_assessment/pages/membership_levels/starter/starter_upgrade.dart';

class UpgradeMembershipPage extends StatefulWidget {
  const UpgradeMembershipPage({super.key,required this.membershipLevel});
  final String? membershipLevel;

  @override
  State<UpgradeMembershipPage> createState() => _UpgradeMembershipPageState();
}

class _UpgradeMembershipPageState extends State<UpgradeMembershipPage> {

  @override
  Widget build(BuildContext context) {
    if (widget.membershipLevel == "plus") {
        return PlusUpgradeWidget();
     } 
     else if(widget.membershipLevel == "premium"){
       return PremiumUpgradeWidget();
     }
     else{
       return StarterUpgradeWidget();
     }
  }
}