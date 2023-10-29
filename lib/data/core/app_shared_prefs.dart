import 'package:dog_app/core/exceptions/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppShared {
  AppShared() {
    init();
  }
  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> cacheStringList({
    required String key,
    required List<String> value,
    required Duration duration,
  }) async {
    final expiry = DateTime.now().add(duration);
    await prefs.setString('${key}_expiry', expiry.toIso8601String());
    return prefs.setStringList(key, value);
  }

  List<String> getCacheStringList({required String key}) {
    final expiry = prefs.getString('${key}_expiry');
    if (expiry == null) {
      throw CacheException();
    }
    final expiryDate = DateTime.parse(expiry);
    if (expiryDate.isBefore(DateTime.now())) {
      throw CacheException();
    }
    final value = prefs.getStringList(key);
    if (value == null) {
      throw CacheException();
    }
    print(value);
    return value;
  }
}
