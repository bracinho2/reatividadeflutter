import 'package:flutter_test/flutter_test.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_farmer_with_phone_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_impl.dart';

import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_interface.dart';

class GetFarmerWithPhoneRepositoryImpl
    implements IGetFarmerWithPhoneRepository {
  @override
  FarmerEntity call({required String phone}) {
    if (phone.contains('45')) {
      return FarmerEntity('Alex', 'Ernzen', '23/02/1984', '+5545999247838',
          'bracinho2@hotmail.com', 'Linha Bom Jesus - Sulina - PR', '', '');
    }
    return FarmerEntity('Roberto', 'Ernzen', '23/02/1984', '+5545999247838',
        'bracinho2@hotmail.com', 'Linha Bom Jesus - Sulina - PR', '', '');
  }
}

main() {
  test('Should return an instance of the farmer', () {
    IGetFarmerWithPhone useCase =
        GetFarmerWithPhoneImpl(GetFarmerWithPhoneRepositoryImpl());

    var result = useCase.call(phone: '45');

    expect(result, isInstanceOf<FarmerEntity>());
  });

  test('Should return an instance of the Farmer with Phone Information 01', () {
    IGetFarmerWithPhone useCase =
        GetFarmerWithPhoneImpl(GetFarmerWithPhoneRepositoryImpl());

    var result = useCase.call(phone: '45');

    expect(result.name, 'Alex');
  });

  test('Should return an instance of the Farmer with Phone Information 02', () {
    IGetFarmerWithPhone useCase = GetFarmerWithPhoneImpl(
      GetFarmerWithPhoneRepositoryImpl(),
    );

    var result = useCase.call(phone: '44');

    expect(result.name, 'Roberto');
  });
}
