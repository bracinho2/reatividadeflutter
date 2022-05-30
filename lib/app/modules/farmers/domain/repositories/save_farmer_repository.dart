import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';

abstract class ISaveFarmerRepository {
  Future<bool> call({required FarmerEntity farmerEntity});
}
