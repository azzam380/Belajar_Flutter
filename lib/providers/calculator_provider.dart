// lib/providers/calculator_provider.dart

import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String _result = '';

  String get result => _result;

  void calculate(String num1Str, String num2Str, String operation) {
    // ... (Kode logika kalkulator lengkap ada di sini) ...
    // Anda bisa salin dari jawaban saya sebelumnya.
    final double? num1 = double.tryParse(num1Str);
    final double? num2 = double.tryParse(num2Str);

    if (num1 == null || num2 == null) {
      _result = 'Input tidak valid!';
      notifyListeners();
      return;
    }
    double tempResult;
    switch (operation) {
      case '+':
        tempResult = num1 + num2;
        break;
      case '-':
        tempResult = num1 - num2;
        break;
      case 'x':
        tempResult = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          _result = 'Tidak bisa dibagi nol!';
          notifyListeners();
          return;
        }
        tempResult = num1 / num2;
        break;
      default:
        tempResult = 0;
    }
    _result = tempResult.toString();
    notifyListeners();
  }
}
