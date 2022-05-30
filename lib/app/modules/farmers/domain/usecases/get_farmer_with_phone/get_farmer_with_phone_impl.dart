import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_farmer_with_phone_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_interface.dart';

class GetFarmerWithPhoneImpl implements IGetFarmerWithPhone {
  final IGetFarmerWithPhoneRepository _iGetFarmerWithPhoneRepository;

  GetFarmerWithPhoneImpl(this._iGetFarmerWithPhoneRepository);
  @override
  FarmerEntity call({required String phone}) {
    return _iGetFarmerWithPhoneRepository(phone: phone);
  }
}
