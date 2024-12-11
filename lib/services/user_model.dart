class UserModel {
  final String uid;
  final String email;
  final String password;

  UserModel({
    required this.uid,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
