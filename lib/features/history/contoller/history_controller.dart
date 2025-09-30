import 'package:flutter/material.dart';
import 'package:project_shahin/features/history/model/history_model.dart';
import 'package:share_plus/share_plus.dart';

class History_Controller extends ChangeNotifier {
   final List<HistoryModel> _quotes = [
    HistoryModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.-Steve Jobs",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
    HistoryModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.-Steve Jobs",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
    HistoryModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.-Steve Jobs",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
    HistoryModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.-Steve Jobs",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
    HistoryModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.-Steve Jobs",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
  ];

  List<HistoryModel> get quotes => _quotes;
  
  void shareQuote(String quote, String author) {
    final content = '"$quote" — $author';
    // ignore: deprecated_member_use
    Share.share(content);
  }
}