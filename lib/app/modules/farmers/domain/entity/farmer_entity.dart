class FarmerEntity {
  final String name;
  final String lastName;
  final String birthDate;
  final String phone;
  final String email;
  final String address;
  final String latitude;
  final String longitude;

  FarmerEntity({
    required this.name,
    required this.lastName,
    required this.birthDate,
    required this.phone,
    required this.email,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  String get contacts {
    return phone + ' + ' + email;
  }

  @override
  String toString() {
    return 'FarmerEntity(name: $name, lastName: $lastName, birthDate: $birthDate, phone: $phone, email: $email, address: $address, latitude: $latitude, longitude: $longitude)';
  }
}
