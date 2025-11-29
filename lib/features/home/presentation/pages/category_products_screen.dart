import 'package:flutter/material.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../data/mock_products.dart';
import '../../domain/models/product.dart';
import '../widgets/app_search_bar.dart';
import '../widgets/category_header.dart';
import '../widgets/filter_bar.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

/// Pantalla que muestra productos de una categoría específica
class CategoryProductsScreen extends StatefulWidget {
  final String categoryName;

  const CategoryProductsScreen({
    super.key,
    required this.categoryName,
  });

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  List<Product> _products = [];
  String _selectedSort = 'relevante';
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    setState(() {
      _products = MockProducts.getProductsByCategory(widget.categoryName);
      _applySort();
    });
  }

  void _applySort() {
    switch (_selectedSort) {
      case 'precio_asc':
        _products.sort((a, b) => a.currentPrice.compareTo(b.currentPrice));
        break;
      case 'precio_desc':
        _products.sort((a, b) => b.currentPrice.compareTo(a.currentPrice));
        break;
      default:
        // Mantener orden original (más relevante)
        break;
    }
  }

  void _onSortChanged(String sort) {
    setState(() {
      _selectedSort = sort;
      _applySort();
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
  }

  List<Product> get _filteredProducts {
    if (_searchQuery.isEmpty) {
      return _products;
    }
    return _products.where((product) {
      return product.name.toLowerCase().contains(_searchQuery) ||
          product.brand.toLowerCase().contains(_searchQuery);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      body: SafeArea(
        child: Column(
          children: [
            // Top Search Bar
            AppSearchBar(
              hintText: 'Buscar en esta categoría',
              onSearchChanged: _onSearchChanged,
            ),

            // Category Header
            CategoryHeader(
              categoryName: widget.categoryName,
              productCount: _filteredProducts.length,
            ),

            // Filter Bar
            FilterBar(
              selectedSort: _selectedSort,
              onSortChanged: _onSortChanged,
            ),

            // Products Grid
            Expanded(
              child: _filteredProducts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: AppColors.inkSoft,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No se encontraron productos',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 16,
                              color: AppColors.inkSoft,
                            ),
                          ),
                        ],
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = _filteredProducts[index];
                        return ProductCard(
                          product: product,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  product: product,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

