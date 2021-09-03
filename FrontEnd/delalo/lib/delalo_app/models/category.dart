//category model
class Category {
  const Category(
      {required this.id,
      required this.image,
      required this.numOfProviders,
      required this.description});
  final int id;
  final String image;
  final int numOfProviders;
  final String description;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        image: json['image'],
        numOfProviders: json['numOfProviders'],
        description: json['description']);
  }
}
