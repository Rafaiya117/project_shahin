import 'package:flutter/material.dart';
import 'package:project_shahin/features/alpha_circle/model/alpha_circle_model.dart';

class AlphaCircleController extends ChangeNotifier {
  final List<UserModel> _users = [
  UserModel(
    rank: 2,
    imageUrl: 'https://images.pexels.com/photos/9425183/pexels-photo-9425183.jpeg',
    name: 'David Lee',
    role: 'Hunter',
    level: 10,
    points: 800,
    iconPath: 'assets/images/hunter.png',
  ),
  UserModel(
    rank: 3,
    imageUrl: 'https://www.pexels.com/photo/a-man-in-a-polo-shirt-and-sunglasses-22776161/',
    name: 'Alice Smith',
    role: 'Pack',
    level: 8,
    points: 750,
    iconPath: 'assets/images/pack.png',
  ),
  UserModel(
    rank: 4,
    imageUrl: 'https://www.pexels.com/photo/photographer-with-camera-17800266/',
    name: 'Bob Jones',
    role: 'Stalker',
    level: 5,
    points: 400,
    iconPath: 'assets/images/stalker.png',
  ),
];

  List<UserModel> get users => _users;

  void selectUser(int index) {
    for (int i = 0; i < _users.length; i++) {
      _users[i].isSelected = i == index;
    }
    notifyListeners();
  }
}
