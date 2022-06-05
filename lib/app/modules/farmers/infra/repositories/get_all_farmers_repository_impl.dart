import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_all_farmers_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/datasources/get_all_farmers_datasouce_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/mappers_dtos/farmer_dto.dart';

class GetAllFarmersRepositoryImpl implements IGetAllFarmersRepository {
  final IGetAllFarmersDatasource _iGetAllFarmersDatasource;

  GetAllFarmersRepositoryImpl(this._iGetAllFarmersDatasource);
  @override
  Either<Failure, List<FarmerEntity>> call() {
    final response = _iGetAllFarmersDatasource.call();

    try {
      return Right(response.map(FarmerEntityMapper.fromMap).toList());
    } catch (failure) {
      return Left(
          RepositoryError(message: 'Repository Error > Get All Farmers!'));
    }
  }
}
