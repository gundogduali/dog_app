import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

abstract class AppCacheManager {
  Future<void> cacheSingleImage(String imageUrl);
  Future<FileInfo?> getSingleImage(String imageUrl);
  Future<void> removeSingleImage(String imageUrl);
  Future<void> clearCache();
  Future<void> cacheMultipleImages(List<String> imageUrls);
}

class AppCacheManagerImpl implements AppCacheManager {
  AppCacheManagerImpl() {
    _cacheManager = DefaultCacheManager();
  }
  late final CacheManager _cacheManager;

  @override
  Future<void> cacheSingleImage(String imageUrl) async {
    try {
      await _cacheManager.downloadFile(imageUrl);
    } catch (_) {
      debugPrint('Error caching image: $imageUrl');
    }
  }

  @override
  Future<FileInfo?> getSingleImage(String imageUrl) {
    return _cacheManager.getFileFromCache(imageUrl);
  }

  @override
  Future<void> removeSingleImage(String imageUrl) {
    return _cacheManager.removeFile(imageUrl);
  }

  @override
  Future<void> clearCache() {
    return _cacheManager.emptyCache();
  }

  @override
  Future<void> cacheMultipleImages(List<String> imageUrls) async {
    for (final imageUrl in imageUrls) {
      await cacheSingleImage(imageUrl);
    }
  }
}
