import 'package:dioexample/models/User.dart';
import 'package:dioexample/models/sevices.dart';
import 'package:dioexample/models/usermodel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioServices _dioServices = DioServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _dioServices.getUser(id: "4"),
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
                    )
                  ],
                );
              }
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
