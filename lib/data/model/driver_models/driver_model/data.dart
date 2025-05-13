import 'location.dart';
import 'vehicle_info.dart';

class Data {
  String? userName;
  String? email;
  int? age;
  int? gender;
  String? nationalIdFrontPath;
  String? nationalIdBackPath;
  String? criminalStatusRecordPath;
  String? licenseFrontPath;
  String? licenseBackPath;
  String? selfieWithLicensePath;
  String? licenseNumber;
  String? licenseExpirationDate;
  int? status;
  bool? isBanned;
  bool? isDeleted;
  String? registrationDate;
  List<VehicleInfo>? vehicleInfo;
  List<Location>? locations;
  String? id;
  String? phoneNumber;
  int? userType;
  String? imgUrl;
  String? idNumber;

  Data({
    this.userName,
    this.email,
    this.age,
    this.gender,
    this.nationalIdFrontPath,
    this.nationalIdBackPath,
    this.criminalStatusRecordPath,
    this.licenseFrontPath,
    this.licenseBackPath,
    this.selfieWithLicensePath,
    this.licenseNumber,
    this.licenseExpirationDate,
    this.status,
    this.isBanned,
    this.isDeleted,
    this.registrationDate,
    this.vehicleInfo,
    this.locations,
    this.id,
    this.phoneNumber,
    this.userType,
    this.imgUrl,
    this.idNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        age: json['age'] as int?,
        gender: json['gender'] as int?,
        nationalIdFrontPath: json['nationalIdFrontPath'] as String?,
        nationalIdBackPath: json['nationalIdBackPath'] as String?,
        criminalStatusRecordPath: json['criminalStatusRecordPath'] as String?,
        licenseFrontPath: json['licenseFrontPath'] as String?,
        licenseBackPath: json['licenseBackPath'] as String?,
        selfieWithLicensePath: json['selfieWithLicensePath'] as String?,
        licenseNumber: json['licenseNumber'] as String?,
        licenseExpirationDate: json['licenseExpirationDate'] as String?,
        status: json['status'] as int?,
        isBanned: json['isBanned'] as bool?,
        isDeleted: json['isDeleted'] as bool?,
        registrationDate: json['registrationDate'] as String?,
        vehicleInfo: (json['vehicleInfo'] as List<dynamic>?)
            ?.map((e) => VehicleInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        locations: (json['locations'] as List<dynamic>?)
            ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        userType: json['userType'] as int?,
        imgUrl: json['imgUrl'] as String?,
        idNumber: json['idNumber'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'age': age,
        'gender': gender,
        'nationalIdFrontPath': nationalIdFrontPath,
        'nationalIdBackPath': nationalIdBackPath,
        'criminalStatusRecordPath': criminalStatusRecordPath,
        'licenseFrontPath': licenseFrontPath,
        'licenseBackPath': licenseBackPath,
        'selfieWithLicensePath': selfieWithLicensePath,
        'licenseNumber': licenseNumber,
        'licenseExpirationDate': licenseExpirationDate,
        'status': status,
        'isBanned': isBanned,
        'isDeleted': isDeleted,
        'registrationDate': registrationDate,
        'vehicleInfo': vehicleInfo?.map((e) => e.toJson()).toList(),
        'locations': locations?.map((e) => e.toJson()).toList(),
        'id': id,
        'phoneNumber': phoneNumber,
        'userType': userType,
        'imgUrl': imgUrl,
        'idNumber': idNumber,
      };
}
