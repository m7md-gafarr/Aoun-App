import 'locations_json.dart';
import 'vehicle_info_json.dart';

class DriverAuthModel {
  String? fullName;
  String? email;
  String? password;
  String? confirmedPassword;
  int? userType;
  int? age;
  int? gender;
  String? phoneNumber;
  DateTime? registrationDate;
  String? imgUrlFile;
  String? drivingLicense;
  String? idNumber;
  String? licenseNumber;
  String? licenseExpiryDate;
  String? vehiclePicture0;
  String? vehicleRegistrationFront0;
  String? vehicleRegistrationBack0;
  String? licenseSelfie;
  String? licenseBack;
  String? licenseFront;
  String? criminalRecord;
  String? idBack;
  String? idFront;
  List<LocationsJson>? locationsJson;
  List<VehicleInfoJson>? vehicleInfoJson;

  DriverAuthModel({
    this.fullName,
    this.email,
    this.password,
    this.confirmedPassword,
    this.userType,
    this.age,
    this.gender,
    this.phoneNumber,
    this.registrationDate,
    this.imgUrlFile,
    this.drivingLicense,
    this.idNumber,
    this.licenseNumber,
    this.licenseExpiryDate,
    this.vehiclePicture0,
    this.vehicleRegistrationFront0,
    this.vehicleRegistrationBack0,
    this.licenseSelfie,
    this.licenseBack,
    this.licenseFront,
    this.criminalRecord,
    this.idBack,
    this.idFront,
    this.locationsJson,
    this.vehicleInfoJson,
  });

  factory DriverAuthModel.fromJson(Map<String, dynamic> json) {
    return DriverAuthModel(
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmedPassword: json['confirmedPassword'] as String?,
      userType: json['userType'] as int?,
      age: json['age'] as int?,
      gender: json['gender'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      registrationDate: json['registrationDate'] == null
          ? null
          : DateTime.parse(json['registrationDate'] as String),
      imgUrlFile: json['imgUrlFile'] as String?,
      drivingLicense: json['DrivingLicense'] as String?,
      idNumber: json['IdNumber'] as String?,
      licenseNumber: json['LicenseNumber'] as String?,
      licenseExpiryDate: json['LicenseExpiryDate'] as String?,
      vehiclePicture0: json['VehiclePicture_0'] as String?,
      vehicleRegistrationFront0: json['VehicleRegistrationFront_0'] as String?,
      vehicleRegistrationBack0: json['VehicleRegistrationBack_0'] as String?,
      licenseSelfie: json['LicenseSelfie'] as String?,
      licenseBack: json['LicenseBack'] as String?,
      licenseFront: json['LicenseFront'] as String?,
      criminalRecord: json['CriminalRecord'] as String?,
      idBack: json['IdBack'] as String?,
      idFront: json['IdFront'] as String?,
      locationsJson: (json['locationsJson'] as List<dynamic>?)
          ?.map((e) => LocationsJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicleInfoJson: (json['vehicleInfoJson'] as List<dynamic>?)
          ?.map((e) => VehicleInfoJson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'password': password,
        'confirmedPassword': confirmedPassword,
        'userType': userType,
        'age': age,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'registrationDate': registrationDate?.toIso8601String(),
        'imgUrlFile': imgUrlFile,
        'DrivingLicense': drivingLicense,
        'IdNumber': idNumber,
        'LicenseNumber': licenseNumber,
        'LicenseExpiryDate': licenseExpiryDate,
        'VehiclePicture_0': vehiclePicture0,
        'VehicleRegistrationFront_0': vehicleRegistrationFront0,
        'VehicleRegistrationBack_0': vehicleRegistrationBack0,
        'LicenseSelfie': licenseSelfie,
        'LicenseBack': licenseBack,
        'LicenseFront': licenseFront,
        'CriminalRecord': criminalRecord,
        'IdBack': idBack,
        'IdFront': idFront,
        'locationsJson': locationsJson?.map((e) => e.toJson()).toList(),
        'vehicleInfoJson': vehicleInfoJson?.map((e) => e.toJson()).toList(),
      };
}
