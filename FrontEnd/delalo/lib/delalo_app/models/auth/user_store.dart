class UserStore {
  final String role;
  final String token;

  UserStore({required this.role, required this.token});


  factory UserStore.fromJson(Map<String, dynamic> json) {
    return UserStore(
        role: json['role'],
        token: json['token']);
  }
}
