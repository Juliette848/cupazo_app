/// Modelo de categoría
class Category {
  final String id;
  final String name;
  final String iconName;
  final int productCount;

  Category({
    required this.id,
    required this.name,
    required this.iconName,
    this.productCount = 0,
  });
}

