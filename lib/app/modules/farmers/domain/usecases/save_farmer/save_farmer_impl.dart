import 'package:dartz/dartz.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/save_farmer_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';

class SaveFarmerUsecaseImpl implements ISaveFarmerUsecase {
  final ISaveFarmerRepository _iSaveFarmerRepository;

  SaveFarmerUsecaseImpl(this._iSaveFarmerRepository);
  @override
  Future<Either<Failure, bool>> call(
      {required FarmerEntity farmerEntity}) async {
    if (farmerEntity.name.isEmpty) {
      return Left(FieldEmpty(message: 'name'));
    }
    if (farmerEntity.lastName.isEmpty) {
      return Left(FieldEmpty(message: 'lastName'));
    }
    if (farmerEntity.birthDate.isEmpty) {
      return Left(FieldEmpty(message: 'birth'));
    }
    if (farmerEntity.phone.isEmpty) {
      return Left(FieldEmpty(message: 'phone'));
    }
    if (farmerEntity.email.isEmpty) {
      return Left(FieldEmpty(message: 'email'));
    }
    if (farmerEntity.address.isEmpty) {
      return Left(FieldEmpty(message: 'address'));
    }
    // if (farmerEntity.latitude.isEmpty) {
    //   return Left(FieldEmpty(message: 'latitude'));
    // }
    // if (farmerEntity.longitude.isEmpty) {
    //   return Left(FieldEmpty(message: 'longitude'));
    // }

    return await _iSaveFarmerRepository(farmerEntity: farmerEntity);
  }
}
