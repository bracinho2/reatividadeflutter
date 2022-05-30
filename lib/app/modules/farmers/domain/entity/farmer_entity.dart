class FarmerEntity {
  final String name;
  final String lastName;
  final String birthDate;
  final String phone;
  final String email;
  final String address;
  final String latitude;
  final String longitude;

  FarmerEntity(
    this.name,
    this.lastName,
    this.birthDate,
    this.phone,
    this.email,
    this.address,
    this.latitude,
    this.longitude,
  );

  String get contacts {
    return phone + ' + ' + email;
  }
}