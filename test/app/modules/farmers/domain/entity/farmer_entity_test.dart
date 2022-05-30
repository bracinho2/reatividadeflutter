import 'package:flutter_test/flutter_test.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';

main() {
  test('Shouldn\'t be null', () {
    FarmerEntity farmerEntity = FarmerEntity(
        'Roberto',
        'Ernzen',
        '23/02/1984',
        '+5545999247838',
        'bracinho2@hotmail.com',
        'Linha Bom Jesus - Sulina - PR',
        '',
        '');

    expect(farmerEntity, isNotNull);
  });

  test('Get the contact\'s farmer', () {
    FarmerEntity farmerEntity = FarmerEntity(
        'Roberto',
        'Ernzen',
        '23/02/1984',
        '+5545999247838',
        'bracinho2@hotmail.com',
        'Linha Bom Jesus - Sulina - PR',
        '',
        '');

    var expectedResult = farmerEntity.phone + ' + ' + farmerEntity.email;

    expect(farmerEntity.contacts, expectedResult);
  });
}
