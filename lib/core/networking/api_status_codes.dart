
class ApiStatusCodes {
  
  ApiStatusCodes._();

   // Standard HTTP status codes
  static const int badRequest = 400; // Invalid request; server cannot process it
  static const int unauthorized = 401; // Missing or invalid authentication credentials
  static const int forbidden = 403; // Access blocked by the server
  static const int timeout = 408; // Server did not receive complete request in time
  static const int tooManyRequests = 429; // Rate limit reached
  static const int internalServerError = 500; // Server encountered unexpected issue
  static const int serviceUnavailable = 503; // API service is currently unavailable

  // CDN / API specific codes
  static const int accessDenied = 1020; // CDN firewall rule violation
  static const int proApiLimited = 10005; // Endpoint limited to Pro subscribers
  static const int missingApiKey = 10002; // API Key missing
  static const int invalidProApiKey = 10010; // Invalid Pro API key
  static const int invalidDemoApiKey = 10011; // Invalid Demo API key
}