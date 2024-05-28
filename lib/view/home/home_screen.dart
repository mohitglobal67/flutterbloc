import 'package:bloc_flutter/config/routes/routes_name.dart';
import 'package:bloc_flutter/services/storage/storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalStorage localStorage = LocalStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              localStorage.clearValue("token").then((value) {
                localStorage.clearValue("isLogin").then((value) {
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                });
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Column(
        children: [Center(child: Text(" home  page"))],
      ),
    );
  }
}
