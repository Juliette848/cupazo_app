/// Match group model representing the `match_groups` table
class MatchGroupModel {
  final String id;
  final String dealId;
  final int maxGroupSize;
  final String status;
  final DateTime createdAt;

  MatchGroupModel({
    required this.id,
    required this.dealId,
    required this.maxGroupSize,
    required this.status,
    required this.createdAt,
  });

  factory MatchGroupModel.fromJson(Map<String, dynamic> json) {
    return MatchGroupModel(
      id: json['id'] as String? ?? '',
      dealId: json['deal_id'] as String? ?? '',
      maxGroupSize: (json['max_group_size'] as num?)?.toInt() ?? 2,
      status: json['status'] as String? ?? 'unknown',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deal_id': dealId,
      'max_group_size': maxGroupSize,
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
