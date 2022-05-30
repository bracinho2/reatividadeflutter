import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';

abstract class IGetFarmerWithPhoneRepository {
  FarmerEntity call({required String phone});
}
