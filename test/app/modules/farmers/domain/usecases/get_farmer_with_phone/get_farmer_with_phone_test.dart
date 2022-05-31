import 'package:flutter_test/flutter_test.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_impl.dart';

import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/external/local_storage/get_farmer_with_phone_datasource_local_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/repositories/get_farmer_with_phone_repository_impl.dart';

main() {
  test('Should return an instance of the farmer', () {
    IGetFarmerWithPhone useCase = GetFarmerWithPhoneImpl(
        GetFarmerWithPhoneRepositoryImpl(
            GetFarmerWithPhoneDataSourceLocalImpl()));

    var result = useCase.call(phone: '45');
    result.fold(
      ((l) => null),
      ((r) => expect(r, isInstanceOf<FarmerEntity>())),
    );
  });

  test('Should return an instance of the Farmer with Phone Information 01', () {
    IGetFarmerWithPhone useCase = GetFarmerWithPhoneImpl(
        GetFarmerWithPhoneRepositoryImpl(
            GetFarmerWithPhoneDataSourceLocalImpl()));

    var result = useCase.call(phone: '45');
    result.fold(
      ((l) => null),
      ((r) => expect(r.name, 'Alex')),
    );
  });

  test('Should return an instance of the Farmer with Phone Information 02', () {
    IGetFarmerWithPhone useCase = GetFarmerWithPhoneImpl(
        GetFarmerWithPhoneRepositoryImpl(
            GetFarmerWithPhoneDataSourceLocalImpl()));

    var result = useCase.call(phone: '44');

    result.fold(
      ((l) => null),
      ((r) => expect(r.name, 'Roberto')),
    );
  });
}
