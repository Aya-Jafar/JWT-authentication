import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_first_trial/wrapper.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // LocalDb.prefs = await SharedPreferences.getInstance();
  // LocalDb.storage =const FlutterSecureStorage();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uni-coding',
      theme: ThemeData(primaryColor: const Color(0xff08df78)),
      home: const Wrapper(),
    );
  }
}
