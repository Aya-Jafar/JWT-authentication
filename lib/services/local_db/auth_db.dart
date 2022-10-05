import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalDb {
  static late SharedPreferences prefs;

  static late FlutterSecureStorage storage = const FlutterSecureStorage();
}
