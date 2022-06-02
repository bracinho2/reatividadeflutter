import 'package:dartz/dartz.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/save_farmer_repository.dart';

class SaveFarmerRepositoryImpl implements ISaveFarmerRepository {
  @override
  Future<Either<Failure, bool>> call(
      {required FarmerEntity farmerEntity}) async {
    try {
      print(farmerEntity.toString());
      return right(farmerEntity.name.isNotEmpty);
    } catch (e) {
      return Left(
        RepositoryError(message: 'Error Repository > Save Farmer!'),
      );
    }
  }
}
