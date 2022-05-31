import 'package:flutter_test/flutter_test.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_farmer_with_phone_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/external/local_storage/get_farmer_with_phone_datasource_local_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/repositories/get_farmer_with_phone_repository_impl.dart';

main() {
  IGetFarmerWithPhoneRepository repository =
      GetFarmerWithPhoneRepositoryImpl(GetFarmerWithPhoneDataSourceLocalImpl());

  test('Return an Farmer Instance', () {
    var result = repository(phone: '45');

    expect(result, isNotNull);
  });
}
