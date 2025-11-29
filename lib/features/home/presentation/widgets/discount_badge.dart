import 'package:flutter/material.dart';

/// Badge de descuento para productos
class DiscountBadge extends StatelessWidget {
  final int discountPercentage;

  const DiscountBadge({
    super.key,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: discountPercentage >= 30 ? Colors.red : Colors.grey[600],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          '-$discountPercentage%',
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

