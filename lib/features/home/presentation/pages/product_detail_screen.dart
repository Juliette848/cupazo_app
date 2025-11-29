import 'package:flutter/material.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../core/ui/widgets/wave_painter.dart';
import '../../domain/models/product.dart';
import '../widgets/discount_badge.dart';
import '../widgets/group_deal_card.dart';

/// Pantalla de detalle de producto
class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.product.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar with Wave
            Stack(
              children: [
                // Fondo negro con onda
                Container(
                  height: 80,
                  color: AppColors.deepBlack,
                  child: Stack(
                    children: [
                      // Onda decorativa en la parte inferior
                      Positioned(
                        bottom: -1,
                        left: 0,
                        right: 0,
                        child: CustomPaint(
                          size: Size(MediaQuery.of(context).size.width, 50),
                          painter: WavePainter(
                            color: Colors.white, // Color blanco para la onda
                            waveHeight: 30.0,
                            waveFrequency: 0.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Contenido de la barra
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.primaryYellow,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.deepBlack,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.primaryYellow,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              _isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: AppColors.deepBlack,
                            ),
                            onPressed: () {
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.primaryYellow,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: AppColors.deepBlack,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Product Image
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 80,
                              color: Colors.grey[600],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  DiscountBadge(
                    discountPercentage: widget.product.discountPercentage,
                  ),
                ],
              ),
            ),

            // Product Info
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Brand
                    Text(
                      widget.product.brand,
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14,
                        color: AppColors.inkSoft,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Product Name
                    Text(
                      widget.product.name,
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Prices
                    Row(
                      children: [
                        Text(
                          'S/ ${widget.product.originalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.inkSoft,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'S/ ${widget.product.currentPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFF8A00),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Group Deal Card
                    GroupDealCard(
                      groupPrice3: widget.product.groupPrice3,
                      groupPrice6Plus: widget.product.groupPrice6Plus,
                    ),
                    const SizedBox(height: 16),

                    // Interested Count
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceMuted,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 20,
                            color: AppColors.inkSoft,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${widget.product.interestedCount} personas interesadas',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 14,
                              color: AppColors.ink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Description Section
                    Text(
                      'Descripción',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Producto de alta calidad de la marca ${widget.product.brand}. '
                      'Perfecto para uso diario. Aprovecha nuestras ofertas especiales '
                      'y ahorra más comprando en grupo.',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 14,
                        color: AppColors.inkSoft,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Add to Cart Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Implementar agregar al carrito
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${widget.product.name} agregado al carrito',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryYellow,
                          foregroundColor: AppColors.deepBlack,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Agregar al Carrito',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
