import 'package:dartz/dartz.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/mappers_dtos/farmer_dto.dart';

abstract class IGetFarmerWithPhoneDatasource {
  Either<Failure, FarmerEntityMapper> call({required String phone});
}
