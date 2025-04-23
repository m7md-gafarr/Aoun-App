class UserModel {
  String? userName;
  String? email;
  String? phoneNumber;
  dynamic imgUrl;
  int? age;

  UserModel({
    this.userName,
    this.email,
    this.phoneNumber,
    this.imgUrl,
    this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        imgUrl: json['imgUrl'] as dynamic,
        age: json['age'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'phoneNumber': phoneNumber,
        'imgUrl': imgUrl,
        'age': age,
      };
}
