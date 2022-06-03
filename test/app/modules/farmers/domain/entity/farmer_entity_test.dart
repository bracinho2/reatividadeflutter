import 'package:flutter_test/flutter_test.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';

main() {
  test('Shouldn\'t be null', () {
    FarmerEntity farmerEntity = FarmerEntity(
        name: 'Alex',
        lastName: 'Ernzen',
        birthDate: '23/02/1984',
        phone: '+5545999247838',
        email: 'bracinho2@hotmail.com',
        address: 'Linha Bom Jesus - Sulina - PR',
        latitude: '',
        longitude: '');

    expect(farmerEntity, isNotNull);
  });

  test('Get the contact\'s farmer', () {
    FarmerEntity farmerEntity = FarmerEntity(
        name: 'Roberto',
        lastName: 'Ernzen',
        birthDate: '23/02/1984',
        phone: '+5545999247838',
        email: 'bracinho2@hotmail.com',
        address: 'Linha Bom Jesus - Sulina - PR',
        latitude: '',
        longitude: '');

    var expectedResult = farmerEntity.phone + ' + ' + farmerEntity.email;

    expect(farmerEntity.contacts, expectedResult);
  });
}
