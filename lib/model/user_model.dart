class UserModel {
  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.address,
      required this.phone});

  final String uid;
  final String name;
  final String email;
  final String address;
  final String phone;

  static fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        address: json['address'],
        phone: json['phone']);
  }

  toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}
