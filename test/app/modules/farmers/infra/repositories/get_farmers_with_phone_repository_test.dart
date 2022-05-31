import 'package:flutter_test/flutter_test.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_farmer_with_phone_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/external/local_storage/get_farmer_with_phone_datasource_local_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/datasources/get_farmer_with_phone_data_source_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/repositories/get_farmer_with_phone_repository_impl.dart';

main() {
  IGetFarmerWithPhoneDatasource dataSource =
      GetFarmerWithPhoneDataSourceLocalImpl();

  IGetFarmerWithPhoneRepository repository =
      GetFarmerWithPhoneRepositoryImpl(dataSource);

  test('Return an Farmer Instance', () {
    var result = repository(phone: '45');

    expect(result, isNotNull);
  });
}
