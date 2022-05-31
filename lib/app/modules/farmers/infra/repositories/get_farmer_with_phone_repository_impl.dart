import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_farmer_with_phone_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/datasources/get_farmer_with_phone_data_source_interface.dart';

class GetFarmerWithPhoneRepositoryImpl
    implements IGetFarmerWithPhoneRepository {
  final IGetFarmerWithPhoneDatasource _iGetFarmerWithPhoneDatasource;

  GetFarmerWithPhoneRepositoryImpl(this._iGetFarmerWithPhoneDatasource);

  @override
  FarmerEntity call({required String phone}) {
    return _iGetFarmerWithPhoneDatasource.call(phone: phone);
  }
}
