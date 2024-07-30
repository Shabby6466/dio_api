import 'package:dioexample/models/usermodel.dart';

class User{
  final Userdata data;
  User({required this.data});
  
  factory User.fromJson(Map<String, dynamic>json)=>
    User(data: Userdata.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {
  "data" : data.toJson(),
  };
}