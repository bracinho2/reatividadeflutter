import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';

class FarmerController {
  final IGetFarmerWithPhone _getFarmerWithPhone;
  final ISaveFarmerUsecase _iSaveFarmerUsecase;

  FarmerController(this._getFarmerWithPhone, this._iSaveFarmerUsecase) {
    getFarmerWithPhone(phone: '44');
  }

  late FarmerEntity farmerEntity;

  getFarmerWithPhone({required String phone}) {
    var result = _getFarmerWithPhone.call(phone: phone);

    result.fold(
      (failure) => print(failure.toString()),
      (farmerEntity) => farmerEntity = farmerEntity,
    );
  }

  saveFarmer({required FarmerEntity farmerEntity}) async {
    var result = await _iSaveFarmerUsecase.call(farmerEntity: farmerEntity);

    result.fold(
      (failure) => print(failure.toString()),
      (r) => null,
    );
  }
}
