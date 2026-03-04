
import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._(); // Prevent instantiation

  static const String unknownErrorTitle = 'Something Went Wrong';
  static const String unknownErrorMessage =
      "We couldn't complete your request. Please try again.";
  static const IconData unknownErrorIcon = Icons.error_outline;

  // -----------------------------
  // Network Errors
  // -----------------------------
  static const String connectionErrorTitle = 'No Internet Connection';
  static const String connectionErrorMessage =
      'Please check your internet connection and try again.';
  static const IconData connectionErrorIcon = Icons.wifi_off;

  static const String timeoutErrorTitle = 'Taking Too Long';
  static const String timeoutErrorMessage =
      'The request is taking longer than expected. Please try again.';
  static const IconData timeoutErrorIcon = Icons.hourglass_empty;

  static const String receiveTimeoutTitle = 'Server Not Responding';
  static const String receiveTimeoutMessage =
      "We're having trouble reaching the server. Try again in a moment.";
  static const IconData receiveTimeoutIcon = Icons.cloud_queue;

  static const String sendTimeoutTitle = 'Unable to Send Request';
  static const String sendTimeoutMessage =
      'Your request didn’t go through. Please try again.';
  static const IconData sendTimeoutIcon = Icons.send_time_extension;

  static const String cancelledRequestTitle = 'Request Cancelled';
  static const String cancelledRequestMessage =
      'Your request was cancelled before it could finish.';
  static const IconData cancelledRequestIcon = Icons.cancel_outlined;

  // -----------------------------
  // Security / Certificate Issues
  // -----------------------------
  static const String certificateErrorTitle = 'Secure Connection Failed';
  static const String certificateErrorMessage =
      'We could not establish a secure connection. Please try again.';
  static const IconData certificateErrorIcon = Icons.security;

  // -----------------------------
  // Server / API Errors
  // -----------------------------
  static const String badResponseTitle = 'Server Error';
  static const String badResponseMessage =
      'The server returned an unexpected response. Please try again later.';
  static const IconData badResponseIcon = Icons.cloud_off;

  static const String marketOverview = "Market Overview";
  static const String trendingNow = "Trending Now";
  static const String topGainers = "Top Gainers";
  static const String home = "Home";
  static const String market = "Market";
  static const String profile = "Profile";
  static const String settings = "Settings";
  static const String viewAll = "View all";
  static const String marketCap = "Market Cap";
  static const String twentyFourVolume = "24h Volume";
  static const String btcDominance = "BTC Dominance";
  static const String activeCoins = "Active Coins";
  static const String general = "General";
  static const String myAccount = "My Account";
  static const String billingAndPayment = "Billing/Payment";
  static const String faqAndSupport = "FAQ & Support";
  static const String language = "Language";
  static const String darkMode = "Dark Mode";
  static const String recentTransactions = "Recent Transactions";
  static const String myHoldings = "My Holdings";
  static const String totalValue = "Total Value";
  static const String cryptoMarket = "Crypto Market";
  static const String search = "Search";
  static const String coinDetails = "Coin Details";
  static const String buyCrypto = "Buy Crypto";
  static const String paymentMethod = "Payment method";
}
