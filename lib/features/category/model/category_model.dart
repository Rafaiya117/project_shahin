// ignore_for_file: curly_braces_in_flow_control_structures

class CategoryModel {
  final int? id;
  final String? image; 
  final String iconPath; 
  final String title;
  final String subtitle;
  bool isSelected;

  CategoryModel({
    this.id,
    this.image,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.isSelected = false,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
  return CategoryModel(
    id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? ''),
    image: json['image']?.toString(),
    iconPath: json['image']?.toString() ?? 'assets/icons/default_icon.svg',
    title: json['name']?.toString() ?? '',
    subtitle: json['description']?.toString() ?? '',
  );
}

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': title,
      'description': subtitle,
      'image': image,
      'is_selected': isSelected,
    };
  }
}
