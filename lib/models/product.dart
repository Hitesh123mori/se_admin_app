class Product {
  Product({
    required this.name,
    required this.imagePath,
  });
  late String name;
  late String imagePath;

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    imagePath = json['imagePath'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['imagePath'] = imagePath;
    return data;
  }
}