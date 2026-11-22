import 'package:flutter/material.dart';
import 'package:technical_assessment/data/services.dart';
import 'package:technical_assessment/pages/main_display/home.dart';
import 'package:technical_assessment/pages/main_display/membership.dart';
import 'package:technical_assessment/pages/main_display/upgrade_membership.dart';
import 'package:technical_assessment/pages/settings/settings.dart';
import 'package:technical_assessment/storage/stored_user.dart';

class MainTabsPage extends StatefulWidget {
  const MainTabsPage({super.key, required});

  @override
  State<MainTabsPage> createState() => _MainTabsPageState();
}

class _MainTabsPageState extends State<MainTabsPage> {

int selectedIndex = 0;
String title = 'Welcome';
var user;
var membershipLevel;

void setUserFunction()async{
  user = await StoredUser().getStoredUser();
  membershipLevel = await StoredUser().getStoredMembership();
  DataServices().setJsonUser(user);
}

@override
  void initState() {
    setUserFunction();
    super.initState();
  }

  List<Widget> _mainOptions(){
     final List<Widget> widgetOptions = <Widget>[
      HomePage(membershipLevel: membershipLevel),
      MembershipPage(membershipLevel: membershipLevel,),
      UpgradeMembershipPage(membershipLevel: membershipLevel,),
    ];
    return widgetOptions;
  }

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
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 63, 63, 63),
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
          }, icon: Icon(Icons.settings_outlined))
        ],
      ),
      body: Center(
        child: Container(
          child: _mainOptions().elementAt(selectedIndex)
          ),
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