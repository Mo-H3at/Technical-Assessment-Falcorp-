import 'package:flutter/material.dart';

class UpgradeMembershipDialog extends StatefulWidget {
  const UpgradeMembershipDialog({super.key});

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
      title: const Text('Do you confirm to the following membership upgrade?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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