import 'package:material_ui/material_ui.dart';
import 'package:technical_assessment/data/services.dart';
import 'package:technical_assessment/pages/main_display/main_tabs.dart';

import '../data/data_classes.dart';

class UpgradeMembershipDialog extends StatefulWidget {
  const UpgradeMembershipDialog({super.key, required this.Id,required this.membershipId, 
    required this.newMembership,required this.newMembershipName});

  final String? Id;
  final String membershipId;
  final String? newMembershipName;
  final User newMembership;
  
  @override
  State<UpgradeMembershipDialog> createState() => _UpgradeMembershipDialogState();
}

class _UpgradeMembershipDialogState extends State<UpgradeMembershipDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      contentPadding: const EdgeInsets.all(20),
      actionsPadding: EdgeInsets.all(5),
      title: Text('Do you confirm upgrading your membership to the ${widget.newMembershipName} tier?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No')),
        ElevatedButton(
          onPressed: () {
            upgradedMembership();
          },
          child: const Text('Yes')),
      ],
    );
  }

  void upgradedMembership()async{
    User user = User(id: widget.newMembership.id, name: widget.newMembership.name,
     email: widget.newMembership.email, membershipId: widget.membershipId);

    if(await DataServices().updateMembership(widget.Id, user)){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => MainTabsPage()), (route) => false);
    }
    else{
      showDialog(context: context, builder: (context) =>
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          icon: Icon(Icons.warning_amber_rounded,),
          title: const Text('Failed to Upgrade Membership tier', style: TextStyle(fontSize: 14)),
          actionsPadding: EdgeInsets.all(5),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay')),
          ],
        )
      );
    }
  }
}