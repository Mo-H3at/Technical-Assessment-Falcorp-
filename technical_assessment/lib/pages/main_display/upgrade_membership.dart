import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/pages/membership_levels/plus/plus_upgrade.dart';
import 'package:technical_assessment/pages/membership_levels/premium/premium_upgrade.dart';
import 'package:technical_assessment/pages/membership_levels/starter/starter_upgrade.dart';

class UpgradeMembershipPage extends StatefulWidget {
  const UpgradeMembershipPage({super.key,required this.membershipId});
  final String? membershipId;

  @override
  State<UpgradeMembershipPage> createState() => _UpgradeMembershipPageState();
}

class _UpgradeMembershipPageState extends State<UpgradeMembershipPage> {

  @override
  Widget build(BuildContext context) {
    if (widget.membershipId == "plus") {
        return PlusUpgradeWidget(membershipId: widget.membershipId);
     } 
     else if(widget.membershipId == "premium"){
       return PremiumUpgradeWidget();
     }
     else{
       return StarterUpgradeWidget(membershipId: widget.membershipId);
     }
  }
}