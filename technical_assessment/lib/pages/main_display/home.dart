import 'package:material_ui/material_ui.dart';
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
        return PlusHomeWidget(membership: widget.membershipLevel);
     } 
     else if(widget.membershipLevel == "premium"){
       return PremiumHomeWidget(membership: widget.membershipLevel);
     }
     else{
       return StarterHomeWidget(membership: widget.membershipLevel);
     }
     
  }
}