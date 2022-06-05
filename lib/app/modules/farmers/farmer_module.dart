import 'package:flutter_modular/flutter_modular.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_all_farmers_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/get_farmer_with_phone_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/repositories/save_farmer_repository.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_all_farmers/get_all_farmers_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_all_farmers/get_all_farmers_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/get_farmer_with_phone/get_farmer_with_phone_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/domain/usecases/save_farmer/save_farmer_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/external/local_storage/get_all_farmer_datasource_local_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/external/local_storage/get_farmer_with_phone_datasource_local_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/datasources/get_all_farmers_datasouce_interface.dart';

import 'package:reatividadeflutter/app/modules/farmers/infra/datasources/get_farmer_with_phone_datasource_interface.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/repositories/get_all_farmers_repository_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/repositories/get_farmer_with_phone_repository_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/infra/repositories/save_farmer_repository_impl.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/controllers/farmer_store.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/ui/pages/farmer_page.dart';
import 'package:reatividadeflutter/app/modules/farmers/presentation/ui/pages/farmer_page_add.dart';

class FarmerModule extends Module {
  @override
  final List<Bind> binds = [
    //Get Farmer With Phone;
    //datasource
    Bind.lazySingleton<IGetFarmerWithPhoneDatasource>(
        (i) => GetFarmerWithPhoneDataourceLocalImpl()),

    //repository
    Bind.lazySingleton<IGetFarmerWithPhoneRepository>(
        (i) => GetFarmerWithPhoneRepositoryImpl(i())),
    Bind.lazySingleton<ISaveFarmerRepository>(
        (i) => SaveFarmerRepositoryImpl()),

    //usecase
    Bind.lazySingleton<IGetFarmerWithPhone>((i) => GetFarmerWithPhoneImpl(i())),
    Bind.lazySingleton<ISaveFarmerUsecase>((i) => SaveFarmerUsecaseImpl(i())),

    //Get all farmers
    //datasource
    Bind.lazySingleton<IGetAllFarmersDatasource>(
        (i) => GetAllFarmerDatasource()),

    //repository
    Bind.lazySingleton<IGetAllFarmersRepository>(
        (i) => GetAllFarmersRepositoryImpl(i())),

//usecase
    Bind.lazySingleton<IGetAllFarmers>((i) => GetAllFarmersImpl(i())),

    //farmer controller
    Bind.factory<FarmerStore>((i) => FarmerStore(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: ((context, args) =>
            FarmerPage(farmerStore: Modular.get<FarmerStore>()))),
    ChildRoute('/farmerAdd',
        child: ((context, args) =>
            FarmerPageAdd(farmerStore: Modular.get<FarmerStore>()))),
  ];
}
