import 'dart:core';

import 'package:gogreen_client/models/input/photo_input.dart';

class UserInput {
  final String name;
  final PhotoInput? photo;

  UserInput({required this.name, required this.photo});
}
