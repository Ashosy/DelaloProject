class User {
  const User(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.password,
      required this.email,
      required this.role,
      required this.phone,
      required this.image,
      required this.address,
      required this.description,
      required this.category,
      required this.jobs_done,
      required this.recommendation,
      required this.average_rating,
      required this.per_hour_wage});
  final String id;
  final double firstname;
  final String lastname;
  final int password;
  final int email;
  final int role;
  final int phone;
  final int image;
  final int address;
  final int description;
  final int category;
  final int jobs_done;
  final int per_hour_wage;
  final int recommendation;
  final int average_rating;
  @override
  List<Object> get props => [
        id,
        firstname,
        lastname,
        password,
        description,
        email,
        role,
        phone,
        image,
        address,
        description,
        category,
        jobs_done,
        per_hour_wage,
        recommendation,
        average_rating
      ];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        role: json['role'],
        phone: json['phone'],
        address: json['address'],
        description: json['description'],
        category: json['category'],
        jobs_done: json['lastname'],
        image: json['image'],
        per_hour_wage: json['per_hour_wage'],
        recommendation: json['recommendation'],
        average_rating: json['average_rating'],
        password: json['password']);
  }
  @override
  String toString() =>
      'User { firstname: $firstname, lastname: $lastname, email: $email,  role: $role, phone: $phone, adderess: $address, description: $description, category: $category, jobs_done: $jobs_done, image: $image, per_hour_wage: $per_hour_wage, recommendation: $recommendation, average_rating: $average_rating,  password: $password,  }';
}
