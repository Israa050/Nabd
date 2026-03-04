import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../api_status_codes.dart';

class CacheInterceptor {
  static Interceptor build() {
    return DioCacheInterceptor(
      options: CacheOptions(
        store: MemCacheStore(), // In-memory cache storage
        hitCacheOnNetworkFailure: true, // Use cached data on network failure
        policy: CachePolicy.request, // Fetch from network first
        maxStale: const Duration(hours: 1), // Accept cache up to 1 hour old

        hitCacheOnErrorCodes: [
          ApiStatusCodes.missingApiKey,      // Use cache if API key is missing
          ApiStatusCodes.invalidDemoApiKey,  // Use cache if demo key is invalid
        ],
      ),
    );
  }
}