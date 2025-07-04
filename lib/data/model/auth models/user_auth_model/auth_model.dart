import 'location.dart';
import 'vehicleinfo.dart';

class UserAuthModel {
  String? fullName;
  String? email;
  String? password;
  String? confirmedPassword;
  String? address;
  String? imgUrlFile;
  String? ssn;
  int? userType;
  int? age;
  int? gender;
  String? phoneNumber;
  DateTime? registrationDate;
  String? drivingLicense;
  List<VehicleinfoModel>? vehicleinfo;
  List<LocationModel>? locations;

  UserAuthModel({
    this.fullName,
    this.email,
    this.password,
    this.confirmedPassword,
    this.address,
    this.imgUrlFile,
    this.ssn,
    this.userType,
    this.age,
    this.gender,
    this.phoneNumber,
    this.registrationDate,
    this.drivingLicense,
    this.vehicleinfo,
    this.locations,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) => UserAuthModel(
        fullName: json['userName'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        confirmedPassword: json['confirmedPassword'] as String?,
        address: json['address'] as String?,
        imgUrlFile: json['imgUrlFile'] as String?,
        ssn: json['ssn'] as String?,
        userType: json['userType'] as int?,
        age: json['age'] as int?,
        gender: json['gender'] as int?,
        phoneNumber: json['phoneNumber'] as String?,
        registrationDate: json['registrationDate'] == null
            ? null
            : DateTime.parse(json['registrationDate'] as String),
        drivingLicense: json['drivingLicense'] as String?,
        vehicleinfo: (json['vehicleinfo'] as List<dynamic>?)
            ?.map((e) => VehicleinfoModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        locations: (json['locations'] as List<dynamic>?)
            ?.map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'userName': fullName,
        'email': email,
        'password': password,
        'confirmedPassword': confirmedPassword,
        'address': address,
        'imgUrlFile': imgUrlFile,
        'ssn': ssn,
        'userType': userType,
        'age': age,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'registrationDate': registrationDate?.toIso8601String(),
        'drivingLicense': drivingLicense,
        'vehicleinfo': vehicleinfo?.map((e) => e.toJson()).toList(),
        'locations': locations?.map((e) => e.toJson()).toList(),
      };
}
