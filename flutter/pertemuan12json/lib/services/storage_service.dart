import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class StorageService {
  static const _keyUser = 'pref_user';

  // Simpan object User (serialize ke JSON string)
  static Future<bool> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(user.toJson());
    return prefs.setString(_keyUser, json);
  }

  // Ambil user dari shared preferences
  static Future<User?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_keyUser);
    if (jsonStr == null) return null;
    try {
      final Map<String, dynamic> map = jsonDecode(jsonStr);
      return User.fromJson(map);
    } catch (e) {
      // error handling jika JSON corrupt
      return null;
    }
  }

  static Future<bool> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_keyUser);
  }
}
