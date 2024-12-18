import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier{
  bool _isPasswordVisible = false ;
  bool _isConfirmPasswordVisible = false ;

  bool get isPasswordVisible => _isPasswordVisible ;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible ;

  void passwordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void confirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }
}