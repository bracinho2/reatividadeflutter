import 'package:flutter_triple/flutter_triple.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';

class FarmerController extends NotifierStore<Failure, FarmerEntity> {
  final IGetFarmerWithPhone _getFarmerWithPhone;
  final ISaveFarmerUsecase _iSaveFarmerUsecase;

  FarmerController(this._getFarmerWithPhone, this._iSaveFarmerUsecase)
      : super(FarmerEntity('', '', '', '', '', '', '', '')) {
    getFarmerWithPhone(phone: '44');
  }

  getFarmerWithPhone({required String phone}) async {
    var result = _getFarmerWithPhone.call(phone: phone);
    setLoading(true);
    await Future.delayed(Duration(seconds: 1));
    result.fold(
      (failure) => setError(failure),
      (success) => update(success),
    );

    setLoading(false);
  }

  saveFarmer({required FarmerEntity farmerEntity}) async {
    var result = await _iSaveFarmerUsecase.call(farmerEntity: farmerEntity);

    result.fold(
      (failure) => print(failure.toString()),
      (sucess) => print(sucess),
    );
  }
}
