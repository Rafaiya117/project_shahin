import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 


String _getRoleIconPath(String role) {
  final normalizedRole = role.toLowerCase();

  switch (normalizedRole) {
    case 'hunter':
      return 'assets/icons/hunter_icon.svg'; 
    case 'warrior':
      return 'assets/icons/warrior_icon.svg';
    case 'mage':
      return 'assets/icons/mage_icon.svg';
    default:
      return 'assets/icons/default_icon.svg'; 
  }
}

class UserCard extends StatelessWidget {
  final int rank;
  final String imageUrl;
  final String name;
  final String role;
  final int level;
  final int points;

  const UserCard({
    Key? key,
    required this.rank,
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.level,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconPath = _getRoleIconPath(role);

    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2C3240),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          // Rank
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF6B7280), 
              shape: BoxShape.circle,
            ),
            child: Text(
              '$rank',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          // User Image and Level
          Stack(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(imageUrl),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6B7280), // Gray background for level badge
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: Text(
                    '$level',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16.0),
          // User Details (Name, Role)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    // Dynamic SVG Icon based on role
                    SvgPicture.asset(
                      iconPath,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFA0AEC0), 
                        BlendMode.srcIn,
                      ),
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      role,
                      style: const TextStyle(
                        color: Color(0xFFA0AEC0), 
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Points
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$points',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              const Text(
                'Points',
                style: TextStyle(
                  color: Color(0xFFA0AEC0), 
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
