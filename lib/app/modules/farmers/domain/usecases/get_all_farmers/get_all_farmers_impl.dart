import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_all_farmers_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_all_farmers/get_all_farmers_interface.dart';

class GetAllFarmersImpl implements IGetAllFarmers {
  final IGetAllFarmersRepository _iGetAllFarmersRepository;

  GetAllFarmersImpl(this._iGetAllFarmersRepository);
  @override
  Either<Failure, List<FarmerEntity>> call() {
    return _iGetAllFarmersRepository.call();
  }
}
