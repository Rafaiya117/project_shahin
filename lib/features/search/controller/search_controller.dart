import 'package:flutter/material.dart';
import 'package:project_shahin/features/search/model/search_model.dart';

class SuggestionController extends ChangeNotifier {
  final List<SuggestionModel> _allSuggestions = [
    SuggestionModel('Fitness'),
    SuggestionModel('Career'),
    SuggestionModel('Discipline'),
    SuggestionModel('Business'),
    SuggestionModel('General Motivation'),
  ];

  List<SuggestionModel> _filteredSuggestions = [];

  List<SuggestionModel> get suggestions =>
      _filteredSuggestions.isEmpty ? _allSuggestions : _filteredSuggestions;

  void search(String query) {
    if (query.length < 2) {
      _filteredSuggestions = [];
    } else {
      final lowerQuery = query.toLowerCase();
      _filteredSuggestions = _allSuggestions.where((item) {
        return item.title.toLowerCase().contains(lowerQuery);
      }).toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _filteredSuggestions = [];
    notifyListeners();
  }
}
