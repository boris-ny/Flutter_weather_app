class UserModel {
  const UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  final String? id;
  final String username;
  final String email;
  final String password;

  toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
