import 'package:flutter/material.dart';
import 'package:project_shahin/features/auth/auth_services/auth_services.dart';
import 'package:project_shahin/features/category/category_services/category_services.dart';
import 'package:project_shahin/features/category/model/category_model.dart';

// class CategoryController extends ChangeNotifier {
//   final List<CategoryModel> _categories = [
//     CategoryModel(
//       iconPath: 'assets/icons/fitness_icon.svg',
//       title: 'Fitness',
//       subtitle: 'Conquer My Body',
//     ),
//     CategoryModel(
//       iconPath: 'assets/icons/career_icon.svg',
//       title: 'Career',
//       subtitle: 'Crash My Career',
//     ),
//     CategoryModel(
//       iconPath: 'assets/icons/bussiness_icon.svg',
//       title: 'Business',
//       subtitle: 'Build My Empire',
//     ),
//     CategoryModel(
//       iconPath: 'assets/icons/discipline_icon.svg',
//       title: 'Discipline',
//       subtitle: 'Master My Discipline',
//     ),
//     CategoryModel(
//       iconPath: 'assets/icons/mindset_icon.svg',
//       title: 'Mindset',
//       subtitle: 'Forge an Unbreakable Mindset',
//     ),
//   ];

//   List<CategoryModel> get categories => _categories;

//   void toggleSelection(int index) {
//     _categories[index].isSelected = !_categories[index].isSelected;
//     notifyListeners();
//   }

//   int get selectedCount =>_categories.where((category) => category.isSelected).length;
// }

class CategoryController extends ChangeNotifier {
  final CategoryService _categoryService = CategoryService();
  final List<CategoryModel> _categories = [];

  bool _isLoading = false;
  String? _errorMessage;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final accessToken = await AuthService().getToken();
      if (accessToken == null) {
        _errorMessage = "Access token not found";
        return;
      }

      final fetched = await _categoryService.getCategories(accessToken);
      _categories
        ..clear()
        ..addAll(fetched);
    } catch (e) {
      _errorMessage = e.toString();
      debugPrint("Load categories error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleSelection(int index) {
    _categories[index].isSelected = !_categories[index].isSelected;
    notifyListeners();
  }

  int get selectedCount =>  _categories.where((c) => c.isSelected).length;

  Future<void> postSelectedCategories() async {
    final selected = _categories.where((c) => c.isSelected).map((c) => c.title).toList();
    if (selected.isEmpty) return;
    try {
      await _categoryService.postSelectedCategories(selected);
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
