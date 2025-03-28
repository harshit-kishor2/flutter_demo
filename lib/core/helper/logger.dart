import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

/// Prints a log message with the [Logger.level] set to [Level.debug].
/// If [record] is true, the log message is also recorded to the server.
void printLog(String message, {bool record = false}) {
  if (kDebugMode) {
    _logger.d(message); // Print the message with the debug level
  }
  if (record) {
    _recordLog(message, logType: 'debug'); // Record the log message to the server
  }
}

/// Prints an error message with the [Logger.level] set to [Level.error].
/// If [record] is true, the log message is also recorded to the server.
void printError(String message, {bool record = true}) {
  if (kDebugMode) {
    _logger.e(message); // Print the message with the error level
  }
  if (record) {
    _recordLog(message, logType: 'error'); // Record the log message to the server
  }
}

/// Prints a warning message with the [Logger.level] set to [Level.warning].
/// If [record] is true, the log message is also recorded to the server.
void printWarning(String message, {bool record = true}) {
  if (kDebugMode) {
    _logger.w(message); // Print the message with the warning level
  }
  if (record) {
    _recordLog(message, logType: 'warning'); // Record the log message to the server
  }
}

/// Records a log message to the server.
///
/// The [logType] parameter is the type of the log message, which can be
/// 'debug', 'error', or 'warning'.
///
/// If an error occurs during the log recording, the error message is
/// printed with the [Logger.level] set to [Level.error].
Future<void> _recordLog(String message, {required String logType}) async {
  try {
    // await ServerLogger.log(message: message, logType: logType);
  } on Object catch (e) {
    if (kDebugMode) {
      _logger.e('Log recording failed: $e'); // Print an error message
    }
  }
}
