import 'package:reatividadeflutter/app/modules/farmers/infra/datasources/get_farmer_with_phone_data_source_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/mappers_dtos/farmer_dto.dart';

class GetFarmerWithPhoneDataSourceLocalImpl
    implements IGetFarmerWithPhoneDatasource {
  @override
  FarmerEntityMapper call({required String phone}) {
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
      'email': 'email',
      'address': 'address',
      'latitude': 'latitude',
      'longitude': 'longitude',
    };

    if (phone.contains('45')) {
      return FarmerEntityMapper.fromMap(json0);
    }
    return FarmerEntityMapper.fromMap(json1);
  }
}
