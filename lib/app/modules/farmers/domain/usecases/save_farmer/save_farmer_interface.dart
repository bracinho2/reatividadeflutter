import 'package:dartz/dartz.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';

abstract class ISaveFarmerUsecase {
  Future<Either<Failure, bool>> call({required FarmerEntity farmerEntity});
}
