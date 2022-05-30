import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/save_farmer_repository.dart';

class SaveFarmerRepositoryImpl implements ISaveFarmerRepository {
  @override
  Future<bool> call({required FarmerEntity farmerEntity}) async {
    return farmerEntity.name.isNotEmpty;
  }
}
