import 'dart:developer';
import 'package:agent_dashboard/domain/model/token/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferecesStorage {
  static const String locationKey = 'location';
  static const String accessKey = 'access_key';
  static const String isLogged = 'is_loggedIn';
  static const String isOnBoarVisted = 'is_onboar_visted';
  static const String isProfileCreated = 'is_profile_visited';
  static const String phoneKey = 'phone';
  static const String notificationTokenKey = 'notificationToken';
  static const String notificationCountKey = 'notificationCount';
  static const String imageSplash = 'splash_image';
  static const String nameKey = 'name';
  static const String userId = 'user_id';

  static Future<void> setCurrentFullAddressLocation(
      {required String fulllAddress,
      String country = '',
      String countryCode = ''}) async {
    log('set Location =>()');
    final prefs = await SharedPreferences.getInstance();
    await prefs
        .setStringList(locationKey, [fulllAddress, country, countryCode]);
  }

  static Future<List<String>?> getCurrentFullAddressLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final location = prefs.getStringList(locationKey);
    return location;
  }

  static Future<void> saveToken({required TokenModel tokenModel}) async {
    log('save token =>() ${tokenModel.token}');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessKey, tokenModel.token);
  }

  static Future<TokenModel> getToken() async {
    log('get token =>()');
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString(accessKey);
    return TokenModel(token: accessToken ?? '');
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

  static Future<void> setNotificationCount({required int length}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(notificationCountKey, length);
  }

  static Future<int> getNotificationCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(notificationCountKey) ?? 0;
  }

  static Future<void> saveNotificatonToken({required String token}) async {
    log('save noti token =>() $token');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(notificationTokenKey, token);
  }

  static Future<String> getNotificationToken() async {
    log('get noti token =>()');
    final prefs = await SharedPreferences.getInstance();
    final notiToken = prefs.getString(notificationTokenKey);
    return notiToken ?? '';
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

  static Future<void> setOnBoard() async {
    log('set Onboard =>()');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isOnBoarVisted, true);
  }

  static Future<bool> getOnBoard() async {
    log('get Onboard =>()');
    final prefs = await SharedPreferences.getInstance();
    final setOnboard = prefs.getBool(isOnBoarVisted) ?? false;
    log('get setOnboard =>() $setOnboard');
    return setOnboard;
  }

  static Future<void> setPhone({required String phone}) async {
    log('set phone =>() $phone');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(phoneKey, phone);
  }

  static Future<String?> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString(phoneKey);
    return phone;
  }

  static Future<void> setSplash({required String image}) async {
    log('set splash image =>()');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(imageSplash, image);
  }

  static Future<String?> getSplash() async {
    final prefs = await SharedPreferences.getInstance();
    final image = prefs.getString(imageSplash);
    return image;
  }
}
