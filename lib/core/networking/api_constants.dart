/// ApiConstants contains all the Supabase Edge Function endpoints for CoinGecko API calls,
/// along with common query parameters and example usage.
/// 
/// This class is **static only** and cannot be instantiated.
class ApiConstants {

  // Private constructor to prevent instantiation.
  ApiConstants._();

  // -----------------------------
  // Base URL
  // -----------------------------
  /// Base URL for all Supabase Edge Functions
  static const String baseUrl = "https://naazzlzuvrjbfizjjckb.supabase.co/functions/v1/";

  // -----------------------------
  // API Endpoints
  // -----------------------------
  /// Returns global cryptocurrency data
  static const String global = 'global'; 
  /// Returns trending coins
  static const String trending = 'search-trending';
  /// Returns market data for coins
  static const String markets = 'coins-markets';
  /// Search endpoint
  static const String search = 'search';
  /// Returns coin details (requires `id` parameter)
  static const String coins = 'coins';
  static const String coinDetails = 'coin_details';
  /// Returns market chart data for a coin (requires `id` and optional `subpath`)
  static const String marketChart = 'market_chart';
  /// Returns simple price data
  static const String simplePrice = 'simple-price';

  // -----------------------------
  // Example API Calls
  // -----------------------------

  /// Global endpoint
  /// Example: ${baseUrl}/global
  ///
  /// Trending endpoint
  /// Example: ${baseUrl}/search-trending
  ///
  /// Coins markets endpoint with query parameters
  /// Example: ${baseUrl}/coins-markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1
  ///
  /// Simple price endpoint
  /// Example: ${baseUrl}/simple-price?vs_currencies=usd&ids=bitcoin&names=Bitcoin&symbols=btc
  ///
  /// Search endpoint
  /// Example: ${baseUrl}/search?query=usd
  ///
  /// Coin details endpoint (id as query parameter)
  /// Example: ${baseUrl}/coins?id=bitcoin
  ///
  /// Coin market chart endpoint
  /// Example: ${baseUrl}/coins?id=bitcoin&subpath=market_chart&vs_currency=usd&days=1
  ///

  // -----------------------------
  // Special Query Parameters for /coins endpoint
  // -----------------------------

  /// Coin ID (used as path equivalent in Supabase function)
  /// Example: id=bitcoin → ${baseUrl}coins?id=bitcoin
  static const String id = 'id=bitcoin';

  /// Optional subpath under /coins/{id}, e.g., market_chart or market_chart/range
  /// Example: subpath=market_chart → ${baseUrl}coins?id=bitcoin&subpath=market_chart
  static const String subpath = 'subpath=market_chart';

  // -----------------------------
  // Common Query Parameters
  // -----------------------------
  static const String vsCurrencyUsd = 'vs_currency=usd';
  static const String vsCurrenciesUsd = 'vs_currencies=usd';
  static const String orderMarketCapDesc = 'order=market_cap_desc';

  // -----------------------------
  // Home Screen
  // -----------------------------
  static const String topGainersParams = 'vs_currency=usd&order=market_cap_desc';

  // -----------------------------
  // Market Screen (Paginated)
  // -----------------------------
  /// Usage: append page number at the end
  static const String paginatedParams =
      'vs_currency=usd&order=market_cap_desc&per_page=50&';

  // -----------------------------
  // Search Endpoint
  // -----------------------------
  /// Usage: append search keyword at the end
  static const String searchQuery = 'query=';

  // -----------------------------
  // Coin Details
  // -----------------------------
  /// Market chart days parameter
  /// Usage: append day range
  static const String marketChartDays = 'vs_currency=usd&days=';

  // -----------------------------
  // Portfolio
  // -----------------------------
  /// Usage: append comma-separated IDs
  static const String portfolioParams =
      'vs_currencies=usd&include_24hr_change=true&ids=';

}