import 'package:flutter/material.dart';

class PlusMembershipWidget extends StatefulWidget {
  const PlusMembershipWidget({super.key});

  @override
  State<PlusMembershipWidget> createState() => _PlusMembershipWidgetState();
}

class _PlusMembershipWidgetState extends State<PlusMembershipWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        ListTile(
          title: Text('Title 1',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          style: ListTileStyle.drawer,
          trailing: Icon(Icons.arrow_forward_outlined),
        ),
        ListTile(
          title: Text('Title 2',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          style: ListTileStyle.drawer,
        ),
        ListTile(
          title: Text('Title 3',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          style: ListTileStyle.drawer,
        ),
        ListTile(
          title: Text('Title 4',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          style: ListTileStyle.drawer,
        ),
        ListTile(
          title: Text('Title 5',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          style: ListTileStyle.drawer,
        ),
        ListTile(
          title: Text('Title 6',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          style: ListTileStyle.drawer,
        ),
      ],
    );
  }
}