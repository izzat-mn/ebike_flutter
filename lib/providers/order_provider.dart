import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  int _isSelectedIndex = 0;
  int _selectedHistoryIndex = 0;

  List<String> orderSelection = [
    'Track Order',
    'Order History',
  ];

  set setIsSelectedIndex(int val) {
    _isSelectedIndex = val;
    notifyListeners();
  }

  int get getIsSelectedIndex => _isSelectedIndex;

  set setSelectedHistoryIndex(int val) {
    _selectedHistoryIndex = val;
    notifyListeners();
  }

  int? get getSelectedHistoryIndex => _selectedHistoryIndex;
}
