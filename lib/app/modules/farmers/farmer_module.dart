import 'package:flutter_modular/flutter_modular.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_farmer_with_phone_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/save_farmer_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/external/local_storage/get_farmer_with_phone_datasource_local_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/datasources/get_farmer_with_phone_data_source_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/repositories/get_farmer_with_phone_repository_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/repositories/save_farmer_repository_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/controllers/farmer_controller.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/ui/pages/farmer_page.dart';

class FarmerModule extends Module {
  @override
  final List<Bind> binds = [
    //Get Farmer With Phone;

    //datasource
    Bind.lazySingleton<IGetFarmerWithPhoneDatasource>(
        (i) => GetFarmerWithPhoneDataSourceLocalImpl()),

    //repository
    Bind.lazySingleton<IGetFarmerWithPhoneRepository>(
        (i) => GetFarmerWithPhoneRepositoryImpl(i())),
    Bind.lazySingleton<ISaveFarmerRepository>(
        (i) => SaveFarmerRepositoryImpl()),

    //usecase
    Bind.lazySingleton<IGetFarmerWithPhone>((i) => GetFarmerWithPhoneImpl(i())),
    Bind.lazySingleton<ISaveFarmerUsecase>((i) => SaveFarmerUsecaseImpl(i())),

    //farmer controller
    Bind.factory<FarmerController>((i) => FarmerController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: ((context, args) => FarmerPage())),
  ];
}
