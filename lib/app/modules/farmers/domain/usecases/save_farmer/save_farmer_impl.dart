import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/save_farmer_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';

class SaveFarmerUsecaseImpl implements ISaveFarmerUsecase {
  final ISaveFarmerRepository _iSaveFarmerRepository;

  SaveFarmerUsecaseImpl(this._iSaveFarmerRepository);
  @override
  Future<bool> call({required FarmerEntity farmerEntity}) async {
    return _iSaveFarmerRepository(farmerEntity: farmerEntity);
  }
}
