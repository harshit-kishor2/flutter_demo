import 'package:equatable/equatable.dart';

/// The base class for all event status classes.
///
/// This class is used to represent the status of a request or operation.
/// The status can be one of the following:
///
/// - [EventIdle]: The event is idle and has not been started.
/// - [EventPending]: The event is pending and is being processed.
/// - [EventSuccess]: The event has completed successfully.
/// - [EventFailed]: The event has failed and an error has occurred.
/// - [EventSuccessWithMessage]: The event has completed successfully and a
///    message is provided.
/// - [EventFailedWithMessage]: The event has failed and an error message is
///    provided.
///
/// The [EventState] class is an abstract class and cannot be instantiated
/// directly. Instead, you should use one of the concrete event status classes
/// listed above.
///

abstract class EventState extends Equatable {
  const EventState();
  @override
  List<Object> get props => [];
}

class EventIdle extends EventState {
  /// The event is idle and has not been started.
  const EventIdle();
}

/// The event is pending and is being processed.
class EventPending extends EventState {}

/// The event has completed successfully.
class EventSuccess extends EventState {}

/// The event has failed and an error has occurred.
class EventFailed extends EventState {}

/// The event has completed successfully and a message is provided.
///
/// The [message] parameter is the message associated with the event.
class EventSuccessWithMessage extends EventState {
  const EventSuccessWithMessage({required this.message});

  /// The message associated with the event.
  final String message;
  @override
  List<Object> get props => [message];
}

/// The event has failed and an error message is provided.
///
/// The [message] parameter is the error message associated with the event.
class EventFailedWithMessage extends EventState {
  const EventFailedWithMessage({required this.message});

  /// The error message associated with the event.
  final String message;
  @override
  List<Object> get props => [message];
}
