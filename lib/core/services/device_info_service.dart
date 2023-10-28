import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

abstract class DeviceInfoService {
  Future<String> getVersion();
}

class DeviceInfoServiceImpl implements DeviceInfoService {
  @override
  Future<String> getVersion() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        final release = androidInfo.version.release;
        final sdkInt = androidInfo.version.sdkInt;
        return 'Android $release (SDK $sdkInt)';
      } else if (Platform.isIOS) {
        final iosInfo = await DeviceInfoPlugin().iosInfo;
        final systemName = iosInfo.systemName;
        final version = iosInfo.systemVersion;
        return '$systemName $version';
      } else {
        return '-';
      }
    } catch (_) {
      return '-';
    }
  }
}
