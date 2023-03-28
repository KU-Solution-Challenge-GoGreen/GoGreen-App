import 'package:gogreen_client/models/input/photo_input.dart';

class StepInput {
  final String description;
  final PhotoInput? photo;

  StepInput({
    required this.description,
    this.photo,
  });
}
