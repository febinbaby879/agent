import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static void launchEmail(String email) async {
    try {
      await launchUrl(Uri.parse('mailto:$email'));
    } catch (e) {
      debugPrint('Cannot open email client');
      debugPrint(e.toString());
    }
  }

  static void launchPhone(String phone) async {
    try {
      await launchUrl(Uri.parse('tel:$phone'));
    } catch (e) {
      log('Cannot make phone call');
      log(e.toString());
    }
  }

  static void launch(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      log('Cannot launch url');
      log(e.toString());
    }
  }
}
