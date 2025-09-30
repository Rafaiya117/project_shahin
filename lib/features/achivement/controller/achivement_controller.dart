import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AchivementController extends ChangeNotifier {

  void shareQuote(String quote, String author) {
    final content = '"$quote" — $author';
    // ignore: deprecated_member_use
    Share.share(content);
  }

}