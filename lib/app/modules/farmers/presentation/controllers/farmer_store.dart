import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:reatividadeflutter/app/core/snack_bar_manager/snack_bar_manager.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_all_farmers/get_all_farmers_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/mappers_dtos/farmer_dto.dart';

class FarmerStore extends NotifierStore<Failure, List<FarmerEntity>> {
  final IGetAllFarmers _iGetAllFarmers;
  final IGetFarmerWithPhone _getFarmerWithPhone;
  final ISaveFarmerUsecase _iSaveFarmerUsecase;

  List<FarmerEntity> _cachedList = [];
  List<FarmerEntity> filteredList = [];

  FarmerStore(
      this._getFarmerWithPhone, this._iSaveFarmerUsecase, this._iGetAllFarmers)
      : super([]) {
    getAllFarmers();
  }

  filterList({String filter = ''}) async {
    await getAllFarmers();
    if (filter.isNotEmpty) {
      setLoading(true);
      filteredList = _cachedList
          .where((farmer) =>
              farmer.name.toLowerCase().contains(filter.toLowerCase()) ||
              farmer.lastName.toLowerCase().contains(filter.toLowerCase()))
          .toList();

      update(filteredList);
      setLoading(false);
    } else {
      update(_cachedList);
    }
  }

  getAllFarmers() async {
    var result = _iGetAllFarmers.call();
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    result.fold(
      (failure) => setError(failure),
      (success) => {
        update(success),
        _cachedList = success,
        print(_cachedList.map((e) => print(e))),
      },
    );

    setLoading(false);
  }

  getFarmerWithPhone({required String phone}) async {
    var result = _getFarmerWithPhone.call(phone: phone);
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    result.fold(
      (failure) => setError(failure),
      (success) => null,
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
