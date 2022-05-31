import 'package:reatividadeflutter/app/modules/farmers/infra/mappers_dtos/farmer_dto.dart';

abstract class IGetFarmerWithPhoneDatasource {
  FarmerEntityMapper call({required String phone});
}
