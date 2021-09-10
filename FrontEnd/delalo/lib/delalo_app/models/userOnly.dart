class UserOnly {
  const UserOnly({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.email,
    required this.role,
    required this.phone,
    required this.image,
    required this.address,
  });
  final String id;
  final String firstname;
  final String lastname;
  final String password;
  final String email;
  final String role;
  final String phone;
  final String image;
  final String address;

  factory UserOnly.fromJson(Map<String, dynamic> json) {
    return UserOnly(
        id: json['_id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        role: json['role'],
        phone: json['phone'],
        address: json['address'],
        image: json['image'],
        password: json['password']);
  }
  @override
  String toString() =>
      'User { firstname: $firstname, lastname: $lastname, email: $email,  role: $role, phone: $phone, adderess: $address, image: $image,  password: $password,  }';
}
