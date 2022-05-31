import 'package:dartz/dartz.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';

abstract class IGetFarmerWithPhone {
  Either<Failure, FarmerEntity> call({required String phone});
}
