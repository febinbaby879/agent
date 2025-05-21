import 'dart:developer';
import 'package:agent_dashboard/domain/model/commen/token/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferecesStorage {
  static const String accessKey = 'access_key';
  static const String isLogged = 'is_loggedIn';
  static const String isOnBoardingDone = 'is_onboard_done';
  static const String nameKey = 'name';
  static const String userId = 'user_id';

  static Future<void> saveToken({required TokenModel tokenModel}) async {
    log('save token =>() ${tokenModel.token}');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessKey, tokenModel.token);
  }

  static Future<String?> getAccessToken() async {
    log('get token =>()');
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessKey);
  }

  static Future<void> saveUserId({required String userId}) async {
    //log('save User id =>() ${tokenModel.token}');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userId, userId);
  }

  static Future<String> getUserId() async {
    //log('get token =>()');
    final prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString(userId);
    return userID ?? '';
  }

  static Future<void> saveName({required String name}) async {
    log('save saveName =>() $name');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, name);
  }

  static Future<String> getName() async {
    log('get getName =>()');
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(nameKey);
    return name ?? '';
  }

  static Future<void> setLogin() async {
    log('set login =>()');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLogged, true);
  }

  static Future<void> clearLogin() async {
    log('delete all SharedPreferences =>()');
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<bool> getLogin() async {
    log('get login =>()');
    final prefs = await SharedPreferences.getInstance();
    final login = prefs.getBool(isLogged) ?? false;
    log('get login =>() $login');
    return login;
  }

  static Future<void> setOnBoard(bool value) async {
    log('set Onboard =>()');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isOnBoardingDone, value);
  }

  static Future<bool> getOnBoard() async {
    log('get Onboard =>()');
    final prefs = await SharedPreferences.getInstance();
    final onboard = prefs.getBool(isOnBoardingDone) ?? false;
    log('get Onboard =>() $onboard');
    return onboard;
  }
}
