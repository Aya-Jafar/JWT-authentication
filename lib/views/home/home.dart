import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/account.dart';
import '../../services/auth_http.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left:20),
              child: Text(
                'Welcome ${account.userName}',
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 22),
              ),
            ),
            GestureDetector(
              child: const Icon(Icons.logout),
              onTap: () {
                AuthService.logOut();
              },
            )
          ],
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xff040a22),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              Text('HOME SCREEN!',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 22))
            ],
          ),
        ),
      ),
    );
  }
}
