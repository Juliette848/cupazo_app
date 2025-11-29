import '../domain/models/product.dart';

/// Datos de ejemplo de productos
class MockProducts {
  static List<Product> getProductsByCategory(String category) {
    final allProducts = getAllProducts();
    return allProducts.where((p) => p.category == category).toList();
  }

  static List<Product> getAllProducts() {
    return [
      Product(
        id: '1',
        brand: 'Nike',
        name: 'Zapatillas Deportivas Air Max',
        originalPrice: 299.90,
        currentPrice: 199.90,
        discountPercentage: 33,
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        groupPrice3: 169.90,
        groupPrice6Plus: 149.90,
        interestedCount: 2,
        category: 'Zapatillas',
      ),
      Product(
        id: '2',
        brand: 'Zara',
        name: 'Blusa Elegante de Seda',
        originalPrice: 159.90,
        currentPrice: 119.90,
        discountPercentage: 25,
        imageUrl: 'https://images.unsplash.com/photo-1594633312681-425c7b97ccd1?w=400',
        groupPrice3: 99.90,
        groupPrice6Plus: 89.90,
        interestedCount: 1,
        category: 'Ropa',
      ),
      Product(
        id: '3',
        brand: 'Levi\'s',
        name: 'Pantalón Jeans Negro',
        originalPrice: 129.90,
        currentPrice: 102.90,
        discountPercentage: 21,
        imageUrl: 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=400',
        groupPrice3: 89.90,
        groupPrice6Plus: 79.90,
        interestedCount: 4,
        category: 'Ropa',
      ),
      Product(
        id: '4',
        brand: 'H&M',
        name: 'Vestido Rojo',
        originalPrice: 189.90,
        currentPrice: 131.90,
        discountPercentage: 31,
        imageUrl: 'https://images.unsplash.com/photo-1595777457583-95e059d581b8?w=400',
        groupPrice3: 109.90,
        groupPrice6Plus: 95.90,
        interestedCount: 3,
        category: 'Ropa',
      ),
      // Productos adicionales para otras categorías
      Product(
        id: '5',
        brand: 'Nike',
        name: 'Zapatillas Running',
        originalPrice: 249.90,
        currentPrice: 174.90,
        discountPercentage: 30,
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        groupPrice3: 149.90,
        groupPrice6Plus: 129.90,
        interestedCount: 5,
        category: 'Zapatillas',
      ),
      Product(
        id: '6',
        brand: 'Adidas',
        name: 'Zapatillas Deportivas',
        originalPrice: 279.90,
        currentPrice: 195.90,
        discountPercentage: 30,
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
        groupPrice3: 169.90,
        groupPrice6Plus: 149.90,
        interestedCount: 3,
        category: 'Zapatillas',
      ),
    ];
  }

  static Product? getProductById(String id) {
    return getAllProducts().firstWhere(
      (p) => p.id == id,
      orElse: () => getAllProducts().first,
    );
  }
}

