import 'package:image_picker/image_picker.dart';
import 'package:sealed_unions/generic/union_2_first.dart';
import 'package:sealed_unions/generic/union_2_second.dart';
import 'package:sealed_unions/implementations/union_2_impl.dart';

class PhotoInput extends Union2Impl<XFile, String> {
  PhotoInput.fromXFile(XFile first) : super(Union2First(first));

  PhotoInput.fromString(String second) : super(Union2Second(second));
}
