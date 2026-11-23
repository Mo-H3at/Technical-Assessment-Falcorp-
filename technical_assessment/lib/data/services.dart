import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:technical_assessment/data/data_classes.dart';
import 'package:technical_assessment/validations/validations.dart';

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

  Future<List<Membership>> getMembershipList() async{
    final membershipJsonList = await rootBundle.loadString(DataJson().membershipJsonPath);
    final listOfMemberships = getMembershipListJson(membershipJsonList);
    return listOfMemberships;
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
    await createUserFile(JsonEncoder.withIndent(' ').convert(userList.map((x) => x.toJson()).toList()));
    return userList;
  }

  Future<void> save(List<User> users)async{
    final filePath = await getApplicationDocumentsDirectory();
    final userFileList = File('${filePath.path}/${DataJson().savedUserPath}');
    await userFileList.writeAsString(JsonEncoder.withIndent(' ').convert(users.map((x) => x.toJson()).toList()));
  }

  Future<bool> signIn(String email) async{
    bool success = false;
    List<User>? userList = await getUserFileList();
    
    User? user = userList!.where((x) => x.email == email).firstOrNull;
    if(user != null){
      StoredUser().setStoredUser(user.id,user.membershipId);
      getUserFileList();
      success = true;
    }else{
      print(userList.map((x) => x.toJson()));
    }
    return success;
  }
  
 Future<bool> signUp(String name, String email, String membershipId) async{
    bool success = false;
    var userList = await getUserFileList();
    
    User user = User(id: 'usr_100${userList!.length+1}', name: name, email: email, membershipId: membershipId);
   
    if(userList != null){

      if(emailTaken(userList, email)){
        print("User Already Exists");
        return success;
      }

      addUser(user);
      success = true;
    }
    
    return success;
  }

  Future<void> addUser(User user)async{
    final file = await readFromUserFile();
    file!.add(user);
    await save(file);
  }

  Future<User> getUser(String id)async{
    final file = await readFromUserFile();
    return file!.where((x)=>x.id==id).first;
  }

  Future<bool> updateMembership(String? id, User member) async{
      final file = await readFromUserFile();
      final index = file!.indexWhere((x) => x.id == id);
      if(index == -1) return false;

      file[index] = member;
      await save(file);
      StoredUser().setStoredUser(member.id,member.membershipId);
      return true;
  }
  Future<bool> updateUser(String? id, User member) async{
      final file = await readFromUserFile();
      final index = file!.indexWhere((x) => x.id == id);
      
      if(emailTaken(file, member.email)){
        print("User Already Exists");
        return false;
      }
      
      file[index] = member;
      await save(file);
      StoredUser().setStoredUser(member.id,member.membershipId);
      return true;
  }

  Future<bool> deleteUser(String? id) async{
      final file = await readFromUserFile();
      final originalListLenght = file!.length;
      print(file.map((x)=> x.toJson()));
      file.removeWhere((x) => x.id == id);

      if(file.length == originalListLenght) return false;
      print('Deleted here:');
      print(file.map((x)=> x.toJson()));
      await save(file);
      return true;
  }

  Future<bool> updateProfileDetails(String? id, User member) async{
      final file = await readFromUserFile();
      final index = file!.indexWhere((x) => x.id == id);
      if(index == -1) return false;

      file[index] = member;
      await save(file);
      return true;
  }


}