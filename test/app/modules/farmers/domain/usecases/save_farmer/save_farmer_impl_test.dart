import 'package:flutter_test/flutter_test.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/repositories/save_farmer_repository_impl.dart';

main() {
  test('Should save an Farmer if name is not empty', () async {
    ISaveFarmerUsecase useCase =
        SaveFarmerUsecaseImpl(SaveFarmerRepositoryImpl());

    FarmerEntity farmerEntity = FarmerEntity(
        name: 'Roberto',
        lastName: 'Ernzen',
        birthDate: '23/02/1984',
        phone: '+5545999247838',
        email: 'bracinho2@hotmail.com',
        address: 'Linha Bom Jesus - Sulina - PR',
        latitude: '',
        longitude: '');

    var result = await useCase.call(farmerEntity: farmerEntity);
    result.fold(
      ((l) => null),
      ((r) => expect(r, true)),
    );
  });
}
