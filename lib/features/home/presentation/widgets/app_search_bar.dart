import 'package:flutter/material.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../core/ui/widgets/wave_painter.dart';

/// Barra de búsqueda reutilizable para la parte superior
class AppSearchBar extends StatelessWidget {
  final String hintText;
  final VoidCallback? onBackPressed;
  final VoidCallback? onCartPressed;
  final VoidCallback? onProfilePressed;
  final ValueChanged<String>? onSearchChanged;

  const AppSearchBar({
    super.key,
    this.hintText = 'Buscar en esta categoría',
    this.onBackPressed,
    this.onCartPressed,
    this.onProfilePressed,
    this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo negro con onda
        Container(
          height: 100,
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
                    color: const Color(0xFFFFF8E1), // Color crema para la onda
                    waveHeight: 25.0,
                    waveFrequency: 0.5,
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Back Button
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primaryYellow,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.deepBlack),
                    onPressed:
                        onBackPressed ?? () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(width: 8),

                // Search Bar
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      onChanged: onSearchChanged,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Cart Icon
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
                    onPressed: onCartPressed,
                  ),
                ),
                const SizedBox(width: 8),

                // Profile Icon
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primaryYellow,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.person_outline,
                      color: AppColors.deepBlack,
                    ),
                    onPressed: onProfilePressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
