class UserModel {
  String? id;
  String? userName;
  String? email;
  String? phoneNumber;
  dynamic imgUrl;
  int? age;

  UserModel(
      {this.userName,
      this.email,
      this.phoneNumber,
      this.imgUrl,
      this.age,
      this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        imgUrl: json['imgUrl'] as dynamic,
        age: json['age'] as int?,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'phoneNumber': phoneNumber,
        'imgUrl': imgUrl,
        'age': age,
        'id': id,
      };
}
