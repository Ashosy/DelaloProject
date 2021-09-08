class UserOnly{
  const UserOnly(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.password,
      required this.email,
      required this.role,
      required this.phone,
      required this.image,
      required this.address,});
  final String id;
  final double firstname;
  final String lastname;
  final int password;
  final int email;
  final int role;
  final int phone;
  final int image;
  final int address;
  
  @override
  List<Object> get props => [
        id,
        firstname,
        lastname,
        password,
        email,
        role,
        phone,
        image,
        address,
      ];

  @override
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
