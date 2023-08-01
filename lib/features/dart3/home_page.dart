import 'package:flutter/material.dart';

class Dart3 {
  // records(positional arguments)
  (String, int, int) getPerson(Map<String, dynamic> data) {
    return (
      data['name'],
      data['age'],
      data['height'],
    );
  }

  // records(named arguments)
  ({String name, int age, int height}) getPerson1(Map<String, dynamic> data) {
    return (
      name: data['name'],
      age: data['age'],
      height: data['height'],
    );
  }
}

void main() {
  final data = {'name': 'taisei', 'age': 26, 'height': 160};
  final dart = Dart3();
  // final (name, age, height) = dart.getPerson(data);
  // print(name);
  // print(age);
  // print(height);

  final (:name, :age, :height) = dart.getPerson1(data);
  print(name);
  print(age);
  print(height);
}

enum Move {
  up,
  down,
  left,
  right;

  // Offset get offset {
  //   switch (this) {
  //     case up:
  //       return const Offset(0.0, 1.0);
  //     case down:
  //       return const Offset(0.0, -1.0);
  //     case left:
  //       return const Offset(-1.0, 0.0);
  //     case right:
  //       return const Offset(1.0, 0.0);
  //   }
  // }

  Offset get offset => switch (this) {
        up => const Offset(0.0, 1.0),
        down => const Offset(0.0, -1.0),
        left => const Offset(-1.0, 0.0),
        right => const Offset(1.0, 0.0),
      };

  double get xAxisMovement => switch (this) {
        up || down => 0.0,
        left => -1.0,
        right => 1.0,
      };
}

// sealed class
sealed class AuthException implements Exception {}

class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException(this.email);
  final String email;
}

class WeakPasswordException extends AuthException {}

class WrongPasswordException extends AuthException {}

class UserNotFoundException extends AuthException {}

String describe(AuthException exception) {
  return switch (exception) {
    EmailAlreadyInUseException(email: final email) =>
      'Email already in use $email',
    WeakPasswordException() => 'Password is too weak',
    WrongPasswordException() => 'Wrong Password',
    UserNotFoundException() => 'User not found',
  };
}

abstract class SuperClass {
  SuperClass(this.a);
  final String a;
  void test();
}

class SubClass extends SuperClass {
  SubClass(this.b) : super(b);
  final String b;
  @override
  void test() {
    print('SubClass: $b');
  }
}
