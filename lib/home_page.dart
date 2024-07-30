import 'package:dioexample/models/User.dart';
import 'package:dioexample/models/sevices.dart';
import 'package:dioexample/models/userInfo.dart';
import 'package:dioexample/models/usermodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioServices _dioServices = DioServices();
  Userinfo userinfo_ = Userinfo(
      name: "Shoaib",
      job: "dev",
      id: "12",
      createdAt: DateTime.now().month.toString(),
      updatedAt: DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _dioServices.getUser(id: '1'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              User? userInfo = snapshot.data;
              if (userInfo != null) {
                Userdata userData = userInfo.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Text(userData.first_name)),
                    Text(userData.last_name),
                    Text(userData.email),
                    CircleAvatar(
                      backgroundImage: NetworkImage(userData.avatar),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _dioServices.createUser(userInfo: userinfo_);
                        },
                        child: Center(
                          child: Text("CreateUser"),
                        )),
                  ],
                );
              }
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
