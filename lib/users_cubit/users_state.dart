import 'package:flutter/foundation.dart';

abstract class UsersState {
  const UsersState();
}

class UsersInitial extends UsersState {
  const UsersInitial();
}

class UsersLoading extends UsersState {
  const UsersLoading();
}

class UsersComplete extends UsersState {
  final List<String> response;
  const UsersComplete(this.response);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UsersComplete && listEquals(other.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class UsersError extends UsersState {
  final errMessage;
  const UsersError(this.errMessage);
}
