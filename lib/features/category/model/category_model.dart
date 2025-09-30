class CategoryModel {
  final String iconPath;
  final String title;
  final String subtitle;
  bool isSelected;

  CategoryModel({
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
  });
}
