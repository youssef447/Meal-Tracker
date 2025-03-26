import 'package:get_storage/get_storage.dart';

abstract class AppCacheService {
  static final GetStorage _storage = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static dynamic getData({
    required String key,
  }) {
    return _storage.read(key);
  }

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    return await _storage.write(key, value);
  }

  static Future<void> removeData({
    required String key,
  }) async {
    return await _storage.remove(key);
  }
}
