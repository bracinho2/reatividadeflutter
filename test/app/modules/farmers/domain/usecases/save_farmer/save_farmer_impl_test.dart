import 'package:flutter_test/flutter_test.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/save_farmer_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';

class SaveFarmerRepositoryImpl implements ISaveFarmerRepository {
  @override
  Future<bool> call({required FarmerEntity farmerEntity}) async {
    return farmerEntity.name.isNotEmpty;
  }
}

main() {
  test('Should save an Farmer if name is not empty', () async {
    ISaveFarmerUsecase useCase =
        SaveFarmerUsecaseImpl(SaveFarmerRepositoryImpl());

    FarmerEntity farmerEntity = FarmerEntity(
        'Roberto',
        'Ernzen',
        '23/02/1984',
        '+5545999247838',
        'bracinho2@hotmail.com',
        'Linha Bom Jesus - Sulina - PR',
        '',
        '');

    var result = await useCase.call(farmerEntity: farmerEntity);

    expect(result, true);
  });
}
