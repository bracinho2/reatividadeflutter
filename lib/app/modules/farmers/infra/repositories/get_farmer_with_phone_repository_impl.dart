import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_farmer_with_phone_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/mappers_dtos/farmer_dto.dart';

class GetFarmerWithPhoneRepositoryImpl
    implements IGetFarmerWithPhoneRepository {
  @override
  FarmerEntity call({required String phone}) {
    var json = {
      'name': 'name',
      'lastName': 'lastName',
      'birthDate': 'birthDate',
      'phone': 'phone',
      'email': 'email',
      'address': 'address',
      'latitude': 'latitude',
      'longitude': 'longitude',
    };

    return FarmerEntityMapper.fromMap(json);
  }
}
