import 'package:flutter/material.dart';
import 'package:project_shahin/features/category/model/category_model.dart';

class CategoryController extends ChangeNotifier {
  final List<CategoryModel> _categories = [
    CategoryModel(
      iconPath: 'assets/icons/fitness_icon.svg',
      title: 'Fitness',
      subtitle: 'Conquer My Body',
    ),
    CategoryModel(
      iconPath: 'assets/icons/career_icon.svg',
      title: 'Career',
      subtitle: 'Crash My Career',
    ),
    CategoryModel(
      iconPath: 'assets/icons/bussiness_icon.svg',
      title: 'Business',
      subtitle: 'Build My Empire',
    ),
    CategoryModel(
      iconPath: 'assets/icons/discipline_icon.svg',
      title: 'Discipline',
      subtitle: 'Master My Discipline',
    ),
    CategoryModel(
      iconPath: 'assets/icons/mindset_icon.svg',
      title: 'Mindset',
      subtitle: 'Forge an Unbreakable Mindset',
    ),
  ];

  List<CategoryModel> get categories => _categories;

  void toggleSelection(int index) {
    _categories[index].isSelected = !_categories[index].isSelected;
    notifyListeners();
  }

  int get selectedCount =>_categories.where((category) => category.isSelected).length;
}
