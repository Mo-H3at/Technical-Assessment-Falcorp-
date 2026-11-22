import 'package:material_ui/material_ui.dart';

class UpgradeMembershipDialog extends StatefulWidget {
  const UpgradeMembershipDialog({super.key, required this.membershipId, required this.newMembership});

  final String? membershipId;
  final String? newMembership;
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
      title: Text('Do you confirm upgrading your membership to the ${widget.newMembership} tier?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No')),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Yes')),
      ],
    );
  }
}