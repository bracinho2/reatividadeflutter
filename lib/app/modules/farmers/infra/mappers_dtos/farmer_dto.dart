import 'package:reatividadeflutter/app/modules/farmers/domain/entity/farmer_entity.dart';

//conhecido também como Data Transfer Object vindo do TDD;
class FarmerEntityMapper extends FarmerEntity {
  FarmerEntityMapper({
    required String name,
    required String lastName,
    required String birthDate,
    required String phone,
    required String email,
    required String address,
    required String latitude,
    required String longitude,
  }) : super(
          name,
          lastName,
          birthDate,
          phone,
          email,
          address,
          latitude,
          longitude,
        );

  static Map<String, dynamic> toMap(FarmerEntity farmerEntity) {
    return {
      'name': farmerEntity.name,
      'lastName': farmerEntity.lastName,
      'birthDate': farmerEntity.birthDate,
      'phone': farmerEntity.phone,
      'email': farmerEntity.email,
      'address': farmerEntity.address,
      'latitude': farmerEntity.latitude,
      'longitude': farmerEntity.longitude,
    };
  }

  factory FarmerEntityMapper.fromMap(Map<String, dynamic> map) {
    return FarmerEntityMapper(
      name: map['name'],
      lastName: map['lastName'],
      birthDate: map['birthDate'],
      phone: map['phone'],
      email: map['email'],
      address: map['address'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }
}
