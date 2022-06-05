import 'package:reatividadeflutter/app/modules/farmers/infra/datasources/get_all_farmers_datasouce_interface.dart';

class GetAllFarmerDatasource implements IGetAllFarmersDatasource {
  final mockValues = [
    {
      'name': 'Alex',
      'lastName': 'Ernzen',
      'birthDate': 'birthDate',
      'phone': '45',
      'email': 'email',
      'address': 'address',
      'latitude': 'latitude',
      'longitude': 'longitude',
    },
    {
      'name': 'Roberto',
      'lastName': 'Ernzen',
      'birthDate': 'birthDate',
      'phone': '44',
      'email': 'roberto@ernzen.com',
      'address': 'address',
      'latitude': 'latitude',
      'longitude': 'longitude',
    },
  ];

  @override
  List<Map<String, dynamic>> call() {
    final response = mockValues;
    return response;
  }
}
