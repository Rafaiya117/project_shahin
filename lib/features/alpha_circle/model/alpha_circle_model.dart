class UserModel {
  final int rank;
  final String imageUrl;
  final String name;
  final String role;
  final int level;
  final int points;
  final String iconPath;
  bool isSelected;

  UserModel({
    required this.rank,
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.level,
    required this.points,
    required this.iconPath, 
    this.isSelected = false,
  });
}
