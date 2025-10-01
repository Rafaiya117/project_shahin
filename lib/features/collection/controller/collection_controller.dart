import 'package:flutter/material.dart';
import 'package:project_shahin/features/collection/model/qoute_model.dart';
import 'package:share_plus/share_plus.dart';

class QuoteController extends ChangeNotifier {
  final List<QuoteModel> _quotes = [
    QuoteModel(
      quoteText: "The only way to do great work is to love what you do...",
      authorName: "Steve Jobs",
      createdAt: DateTime(2009, 9, 20),
    ),
    QuoteModel(
      quoteText: "The only way to do great work is to love what you do...",
      authorName: "Steve Jobs",
      createdAt: DateTime(2008, 10, 21),
    ),
    QuoteModel(
      quoteText: "The only way to do great work is to love what you do...",
      authorName: "Steve Jobs",
      createdAt: DateTime(2010, 11, 22),
    ),
    QuoteModel(
      quoteText: "The only way to do great work is to love what you do...",
      authorName: "Steve Jobs",
      createdAt: DateTime(2011, 12, 23),
    ),
    QuoteModel(
      quoteText: "The only way to do great work is to love what you do...",
      authorName: "Steve Jobs",
      createdAt: DateTime(2012, 6, 24),
    ),
  ];

  List<QuoteModel> get quotes => _quotes;

  void sortByRecent() {
    _quotes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    notifyListeners();
  }

  void shareQuote(String quote, String author) {
    final content = '"$quote" — $author';
    // ignore: deprecated_member_use
    Share.share(content);
  }

  void handleDelete() {
    print('Item deleted successfully!');
  }
}
