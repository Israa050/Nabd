
import 'dart:async';

/// A reusable Debouncer class
/// Usage: 
///   final _debouncer = Debouncer(milliseconds: 400);
///   _debouncer.run(() => print("Debounced action"));
class Debouncer {
  /// How long to wait after the last call before executing
  final int milliseconds;

  /// Internal timer
  Timer? _timer;

  Debouncer({required this.milliseconds});

  /// Run the debounced function
  void run(void Function() action) {
    // Cancel any existing timer
    _timer?.cancel();

    // Start a new timer
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  /// Cancel any pending action
  void cancel() {
    _timer?.cancel();
  }

  /// Dispose the debouncer
  void dispose() {
    cancel();
  }
}