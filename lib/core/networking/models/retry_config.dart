
class RetryConfig {
  final int maxRetries;
  /// base delay in milliseconds (used as base for exponential backoff)
  final int baseDelayInMilliseconds;
  /// cap on single delay (milliseconds)
  final int maxDelayInMilliseconds;
  /// default list of HTTP status codes considered retryable globally
  final List<int> defaultRetryableStatusCodes;
  /// allowed HTTP methods to retry (idempotent methods)
  final List<String> allowedMethods;
  const RetryConfig({
    this.maxRetries = 3,
    this.baseDelayInMilliseconds = 300, // 300ms
    this.maxDelayInMilliseconds = 30000, // 30s cap
    this.defaultRetryableStatusCodes = const [429, 502, 503, 504],
    this.allowedMethods = const ['GET'],
  });

  static const defaultConfig = RetryConfig();
}
