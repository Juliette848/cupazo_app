import 'package:flutter/material.dart';
import '../../../../core/ui/theme/colors.dart';

/// Card verde de ahorro en grupo
class GroupDealCard extends StatelessWidget {
  final double groupPrice3;
  final double groupPrice6Plus;

  const GroupDealCard({
    super.key,
    required this.groupPrice3,
    required this.groupPrice6Plus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.statusSuccess.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.statusSuccess,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.group,
                size: 16,
                color: AppColors.statusSuccess,
              ),
              const SizedBox(width: 4),
              Text(
                '¡Ahorra en Grupo!',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.statusSuccess,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '3 personas: S/ ${groupPrice3.toStringAsFixed(2)} c/u',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 11,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Por Mayor (6+): S/ ${groupPrice6Plus.toStringAsFixed(2)} c/u',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 11,
              color: AppColors.ink,
            ),
          ),
        ],
      ),
    );
  }
}

