import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:reatividadeflutter/app/core/snack_bar_manager/snack_bar_manager.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/mappers_dtos/farmer_dto.dart';

class FarmerStore extends NotifierStore<Failure, FarmerEntity> {
  final IGetFarmerWithPhone _getFarmerWithPhone;
  final ISaveFarmerUsecase _iSaveFarmerUsecase;

  FarmerStore(this._getFarmerWithPhone, this._iSaveFarmerUsecase)
      : super(FarmerEntity(
            name: '',
            lastName: '',
            birthDate: '',
            phone: '',
            email: '',
            address: '',
            latitude: '',
            longitude: '')) {
    getFarmerWithPhone(phone: '44');
  }

  getFarmerWithPhone({required String phone}) async {
    var result = _getFarmerWithPhone.call(phone: phone);
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    result.fold(
      (failure) => setError(failure),
      (success) => update(success),
    );

    setLoading(false);
  }

  saveFarmer({
    required String name,
    required String lastName,
    required String birthDate,
    required String phone,
    required String email,
    required String address,
    required String latitude,
    required String longitude,
  }) async {
    var result = await _iSaveFarmerUsecase.call(
        farmerEntity: FarmerEntityMapper(
      name: name,
      lastName: lastName,
      birthDate: birthDate,
      phone: phone,
      email: email,
      address: address,
      latitude: latitude,
      longitude: longitude,
    ));

    result.fold(
      (failure) {
        SnackBarManager().showError(message: failure.message);
      },
      (sucess) => {
        SnackBarManager()
            .showSuccess(message: 'Usuário Cadastrado com Sucesso!'),
        Modular.to.pushNamed('/farmer/'),
      },
    );
  }
}
