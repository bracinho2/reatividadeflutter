import 'package:dartz/dartz.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/errors/errors.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/datasources/get_farmer_with_phone_datasource_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/mappers_dtos/farmer_dto.dart';

class GetFarmerWithPhoneDataourceLocalImpl
    implements IGetFarmerWithPhoneDatasource {
  final json0 = {
    'name': 'Alex',
    'lastName': 'lastName',
    'birthDate': 'birthDate',
    'phone': '45',
    'email': 'email',
    'address': 'address',
    'latitude': 'latitude',
    'longitude': 'longitude',
  };

  final json1 = {
    'name': 'Roberto',
    'lastName': 'lastName',
    'birthDate': 'birthDate',
    'phone': '44',
    'email': 'roberto@ernzen.com',
    'address': 'address',
    'latitude': 'latitude',
    'longitude': 'longitude',
  };

  @override
  Either<Failure, FarmerEntityMapper> call({required String phone}) {
    try {
      if (phone.contains('45')) {
        return Right(FarmerEntityMapper.fromMap(json0));
      }
      return Right(FarmerEntityMapper.fromMap(json1));
    } catch (e) {
      return Left(DatasourceError(
          message: 'Error from Data Source > Get Farmer With Phone'));
    }
  }
}
