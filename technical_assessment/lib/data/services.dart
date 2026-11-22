import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:technical_assessment/data/data_classes.dart';

import '../storage/stored_user.dart';

class DataJson{
  final String userJsonPath = "assets/data_files/users.json";
  final String membershipJsonPath = "assets/data_files/memberships.json";

  var savedUserPath = 'users.json';
}

class DataServices {

  Future<List<User>> getUsersList() async{
    final userJsonList = await rootBundle.loadString(DataJson().userJsonPath);
    final listOfUsers = getUsersListJson(userJsonList);
    return listOfUsers;
  }

  Future<void> createUserFile(String users) async{
    final filePath = await getApplicationDocumentsDirectory();
    final userJsonList = File('${filePath.path}/${DataJson().savedUserPath}');
    await userJsonList.writeAsString(users);
  }

  Future<List<User>?> readFromUserFile() async{
    final filePath = await getApplicationDocumentsDirectory();
    final userFileList = File('${filePath.path}/${DataJson().savedUserPath}');
    if(await userFileList.exists()){
      final userList = await userFileList.readAsString();
      return getUsersListJson(userList);
    }
    return null;
  }

  Future<List<User>?> getUserFileList()async {
    final local = await readFromUserFile();
    if(local != null) return local;
    final userList = await getUsersList();
    await createUserFile(userList.toString());
    print(userList);
    return userList;
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
      getUserFileList();
      success = true;
    }
    else{
      print(user);
      print(userList);
    }
    return success;
  }
  
 
  
}