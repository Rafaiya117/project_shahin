import 'package:flutter/material.dart';
import 'package:project_shahin/features/favourite/model/favourite_model.dart';
import 'package:share_plus/share_plus.dart';

class FavouriteController extends ChangeNotifier {
   final List<FavouriteQuoteModel> _quotes = [
    FavouriteQuoteModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
    FavouriteQuoteModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
    FavouriteQuoteModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
    FavouriteQuoteModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
    FavouriteQuoteModel(
      quoteText: "The only way to do great work is to love what you do. If you haven't found it yet, keep looking. Don't settle.",
      authorName: "Steve Jobs",
      dateText: "Sat, 20 September 2008",
    ),
  ];

  List<FavouriteQuoteModel> get quotes => _quotes;
  
  void shareQuote(String quote, String author) {
    final content = '"$quote" — $author';
    // ignore: deprecated_member_use
    Share.share(content);
  }
}
