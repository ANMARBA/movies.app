import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class Utils {
  static Future<bool> hasNetwork({
    String host = 'google.com',
    Duration timeout = const Duration(seconds: 2),
  }) async {
    try {
      final result = await InternetAddress.lookup(host).timeout(
        timeout,
      );
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on PlatformException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
