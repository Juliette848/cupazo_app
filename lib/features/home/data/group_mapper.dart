import '../domain/models/group_purchase.dart';

class GroupMapper {
  static GroupPurchase fromSupabase(
    Map<String, dynamic> json,
    double groupPrice, {
    String? currentUserId,
    String? currentUserAvatarUrl,
  }) {
    final members = json['match_group_members'] as List? ?? [];

    String creatorName = 'Usuario';
    String creatorInitials = 'U';
    String creatorAvatarUrl = '';
    bool isCurrentUserMember = false;

    if (members.isNotEmpty) {
      // Ordenar miembros por fecha de unión para encontrar al primero (creador)
      members.sort((a, b) {
        final dateA = a['joined_at'] != null
            ? DateTime.parse(a['joined_at'])
            : DateTime.now();
        final dateB = b['joined_at'] != null
            ? DateTime.parse(b['joined_at'])
            : DateTime.now();
        return dateA.compareTo(dateB);
      });

      final creatorMember = members.first;
      final user = creatorMember['users'];

      if (user != null) {
        creatorName = user['name'] ?? 'Usuario';

        // Obtener iniciales
        final nameParts = creatorName.split(' ');
        if (nameParts.isNotEmpty) {
          creatorInitials = nameParts[0][0].toUpperCase();
          if (nameParts.length > 1) {
            creatorInitials += nameParts[1][0].toUpperCase();
          }
        }

        // Avatar (si existiera campo avatar_url en users, aquí usaremos un placeholder si no)
        if (user['avatar_url'] != null) {
          creatorAvatarUrl = user['avatar_url'];
        }
      }

      // Fallback para el avatar si el creador es el usuario actual y no tiene avatar en la tabla pública
      if (currentUserId != null &&
          creatorMember['user_id'] == currentUserId &&
          creatorAvatarUrl.isEmpty) {
        creatorAvatarUrl = currentUserAvatarUrl ?? '';
        creatorName = 'Tú'; // Opcional: Mostrar 'Tú' si es el usuario actual
        creatorInitials = 'TÚ';
      }

      // Verificar si el usuario actual es miembro
      if (currentUserId != null) {
        isCurrentUserMember = members.any((m) => m['user_id'] == currentUserId);
      }
    }

    return GroupPurchase(
      id: json['id'],
      creatorName: creatorName,
      creatorInitials: creatorInitials,
      creatorAvatarUrl: creatorAvatarUrl,
      currentMembers: members.length,
      requiredMembers: json['max_group_size'] ?? 2,
      groupPrice: groupPrice,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      isCurrentUserMember: isCurrentUserMember,
    );
  }

  static List<GroupPurchase> fromSupabaseList(
    List<Map<String, dynamic>> list,
    double groupPrice, {
    String? currentUserId,
    String? currentUserAvatarUrl,
  }) {
    return list
        .map(
          (json) => fromSupabase(
            json,
            groupPrice,
            currentUserId: currentUserId,
            currentUserAvatarUrl: currentUserAvatarUrl,
          ),
        )
        .toList();
  }
}
