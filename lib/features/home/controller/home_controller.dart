
import 'package:flutter/material.dart';
import 'package:project_shahin/features/home/model/home_model.dart';
import 'package:share_plus/share_plus.dart';

class HomeController extends ChangeNotifier {
   final ValueNotifier<int> points = ValueNotifier<int>(1100);
  final HomeModel _model = HomeModel(
    quote:'"The only way to do great work is to love what you do. If you haven\'t found it yet, keep looking. Don\'t settle."',
    author: "- Steve Jobs",
  );

  HomeModel get model => _model;

  void shareQuote() {
    final content = '${_model.quote} ${_model.author}';
    // ignore: deprecated_member_use
    Share.share(content);
  }
}
