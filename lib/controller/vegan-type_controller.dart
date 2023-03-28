import 'package:gogreen_client/repository/vegan-type/vegan-type_repository.dart';

import '../models/vegan_type.dart';

final VeganTypeRepository veganTypeRepository = VeganTypeRepository();

Future<List<VeganType>> getVeganTypes() async {
  return veganTypeRepository.getVeganTypes();
}
