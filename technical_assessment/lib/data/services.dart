import 'package:flutter/services.dart';
import 'package:technical_assessment/data/data_classes.dart';

import '../storage/stored_user.dart';

class DataJson{
  final String userJsonPath = "assets/data_files/users.json";
  final String membershipJsonPath = "assets/data_files/memberships.json";
}

class DataServices {

  Future<List<User>> getUsersList() async{
    final userJsonList = await rootBundle.loadString(DataJson().userJsonPath);
    final listOfUsers = getUsersListJson(userJsonList);
    return listOfUsers;
  }

  Future<List<Membership>> getMembershipList() async{
    final membershipJsonList = await rootBundle.loadString(DataJson().membershipJsonPath);
    final listOfMemberships = getMembershipListJson(membershipJsonList);
    return listOfMemberships;
  }
  

  Future<bool> signIn(String email) async{
    bool success = false;
    List<User> userList = await getUsersList();
    
    User? user = userList.where((x) => x.email == email).firstOrNull;
    if(user != null){
      StoredUser().setStoredUser(user.id,user.membershipId);
      success = true;
    }
    return success;
  }
  
 
  
  void setJsonUser(String id) async {
   var userList = await getUsersList();
    var user = userList.where((x) => x.id == id).firstOrNull;
      print(user);
      print(user!.name);
      List<Membership> membershipList = await getMembershipList();
      print(membershipList);
    }
}