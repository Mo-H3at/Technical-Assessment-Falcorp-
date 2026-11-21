import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String membershipId;

  User({required this.id, required this.name, required this.email, required this.membershipId});

  factory User.fromJson(Map<String,dynamic> json){
    return User(id: json['id'], name: json['name'], email: json['email'], membershipId: json['membershipId']);
  }

  Map<String,dynamic> toJson(){
    return {
    "id": id,
    "name": name,
    "email": email,
    "membershipId": membershipId
  };}
}

List<User> getUsersListJson(String item) => 
    List<User>.from(json.decode(item).map((x) => User.fromJson(x)));

class Membership{
  final String id;
  final String name;
  final List<dynamic> features;

  Membership({required this.id, required this.name, required this.features});

  factory Membership.fromJson(Map<String,dynamic> json){
    return Membership(id: json['id'], name: json['name'],features: json['features']);
  }
}

List<Membership> getMembershipListJson(String item) => 
    List<Membership>.from(json.decode(item).map((x) => Membership.fromJson(x)));

class Features{
  final String id;
  final String name;

  Features({required this.id, required this.name});

  factory Features.fromJson(Map<String,dynamic> json){
    return Features(id: json['id'], name: json['name']);
  }
}
List<Features> getFeaturesListJson(String item) => 
    List<Features>.from(json.decode(item).map((x) => Features.fromJson(x)));