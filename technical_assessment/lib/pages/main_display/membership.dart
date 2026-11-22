import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/pages/membership_levels/plus/plus_membership.dart';
import 'package:technical_assessment/pages/membership_levels/premium/premium_membership.dart';
import 'package:technical_assessment/pages/membership_levels/starter/starter_membership.dart';


class MembershipPage extends StatefulWidget {
  const MembershipPage({super.key,required this.membershipLevel});
  final String? membershipLevel;
  
  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  
  @override
  Widget build(BuildContext context) {
    if (widget.membershipLevel == "plus") {
        return PlusMembershipWidget(membership: widget.membershipLevel);
     } 
     else if(widget.membershipLevel == "premium"){
       return PremiumMembershipWidget(membership: widget.membershipLevel);
     }
     else{
       return StarterMembershipWidget(membership: widget.membershipLevel);
     }
  }
}