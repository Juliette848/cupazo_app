import 'package:flutter/material.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../data/models/user_recommendation.dart';

class RecommendedUsersRow extends StatefulWidget {
  final bool? showBuyersOnly;

  const RecommendedUsersRow({super.key, this.showBuyersOnly});

  @override
  State<RecommendedUsersRow> createState() => _RecommendedUsersRowState();
}

class _RecommendedUsersRowState extends State<RecommendedUsersRow> {
  late Future<List<UserRecommendation>> _recommendationsFuture;
  // final RecommendationService _recommendationService = RecommendationService();

  @override
  void initState() {
    super.initState();
    _recommendationsFuture = _fetchRecommendationsWithMock();
  }

  Future<List<UserRecommendation>> _fetchRecommendationsWithMock() async {
    try {
      // Mock Data
      final mockUsers = [
        UserRecommendation(
          candidateUserId: 'mock_1',
          candidateName: 'Daniel',
          candidateRole: 'buyer',
          similarity: 0.50,
          distanceKm: 2.5,
          reliabilityScore: 4.8,
          rank: 1,
          city: 'Lima',
        ),
        UserRecommendation(
          candidateUserId: 'mock_2',
          candidateName: 'Sofía',
          candidateRole: 'buyer',
          similarity: 0.95,
          distanceKm: 1.2,
          reliabilityScore: 4.9,
          rank: 2,
          city: 'Miraflores',
        ),
        UserRecommendation(
          candidateUserId: 'mock_3',
          candidateName: 'Mateo',
          candidateRole: 'buyer',
          similarity: 0.88,
          distanceKm: 3.0,
          reliabilityScore: 4.7,
          rank: 3,
          city: 'San Isidro',
        ),
        UserRecommendation(
          candidateUserId: 'mock_4',
          candidateName: 'Valentina',
          candidateRole: 'buyer',
          similarity: 0.82,
          distanceKm: 4.5,
          reliabilityScore: 4.6,
          rank: 4,
          city: 'Surco',
        ),
      ];

      return mockUsers;
    } catch (e) {
      print('Error fetching recommendations: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Personas recomendadas',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.deepBlack,
                ),
              ),
              Text(
                'Ver todos',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryYellow,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220, // Increased height to prevent overflow
          child: FutureBuilder<List<UserRecommendation>>(
            future: _recommendationsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryYellow,
                  ),
                );
              }

              final recommendations = snapshot.data ?? [];

              if (recommendations.isEmpty) {
                return const Center(child: Text('No hay recomendaciones aún'));
              }

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: recommendations.length,
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final user = recommendations[index];
                  return _buildUserItem(context, user);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUserItem(BuildContext context, UserRecommendation user) {
    final initials = user.candidateName.isNotEmpty
        ? user.candidateName.substring(0, 2).toUpperCase()
        : '??';
    final roleLabel = user.candidateRole == 'buyer' ? 'Comprador' : 'Vendedor';
    final matchPercentage = (user.similarity * 100).toInt();

    return Container(
      width: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.line.withOpacity(0.5)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: matchPercentage > 80
                    ? AppColors.primaryYellow
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.primaryYellow.withOpacity(0.1),
              child: Text(
                initials,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  color: AppColors.deepBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            user.candidateName,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppColors.deepBlack,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            roleLabel,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 11,
              color: AppColors.inkLight,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$matchPercentage% match',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 10,
                color: AppColors.success,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
