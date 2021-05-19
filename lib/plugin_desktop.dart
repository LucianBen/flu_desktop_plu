import 'dart:async';

import 'package:flutter/services.dart';

class PluginDesktop {
  static const MethodChannel _channel =
      const MethodChannel('com.medeli.dev/plugin_desktop');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<dynamic> get selectImage async {
     var image = await _channel.invokeMethod('selectImage');
    return image;
  }

}
