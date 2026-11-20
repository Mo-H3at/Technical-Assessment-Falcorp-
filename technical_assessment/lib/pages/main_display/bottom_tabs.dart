import 'package:flutter/material.dart';
import 'package:technical_assessment/pages/main_display/home.dart';
import 'package:technical_assessment/pages/main_display/membership.dart';
import 'package:technical_assessment/pages/main_display/upgrade_membership.dart';
import 'package:technical_assessment/pages/settings/settings.dart';

class BottomTabsWidget extends StatefulWidget {
  const BottomTabsWidget({super.key});

  @override
  State<BottomTabsWidget> createState() => _BottomTabsWidgetState();
}

class _BottomTabsWidgetState extends State<BottomTabsWidget> {

int selectedIndex = 0;

static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const MembershipPage(),
    const UpgradeMembershipPage(),
  ];

void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Title"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
          }, icon: Icon(Icons.settings_outlined))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          selectedItemColor: Color.fromARGB(255, 4, 136, 251),
          unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              activeIcon: Icon(Icons.home, color: Color.fromARGB(255, 4, 136, 251)),
            ),
    
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              label: 'Membership',
              activeIcon: Icon(Icons.grid_view_outlined, color: Color.fromARGB(255, 4, 136, 251)),
            ),
    
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: 'Upgrade',
              activeIcon: Icon(Icons.post_add, color: Color.fromARGB(255, 4, 136, 251)),
              
            ),
        ]
      ),
    );
  }
}