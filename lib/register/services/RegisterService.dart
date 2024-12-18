import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/database_helper.dart';
import '../../../model/user_data.dart';

class RegisterService {

  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<void> registerUser(
      BuildContext context,
      String firstName,
      String lastName,
      String email,
      String phoneNo,
      String password) async {

    final isEmailUnique = await _dbHelper.isEmailUnique(email);
    final isPhoneUnique = await _dbHelper.isPhoneUnique(phoneNo);

    if (!isEmailUnique) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email is already registered")),
      );
      return;
    }

    if (!isPhoneUnique) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone number is already registered")),
      );
      return;
    }

    // Create a User object
    User newUser = User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phoneNo,
      password: password,
    );

    // Save user data to SQLite
    await _dbHelper.insertUser(newUser);

    User? user = await _dbHelper.getUserByEmailAndPassword(
      email,
      password,
    );
    if (user != null) {
      // Save registration status in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('userId', user.id!); // Save userId of newly registered user
      prefs.setBool('isLoggedIn', true);
      prefs.setBool('isRegistered', true);

      // Navigate to the HomeScreen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Handle the case where user could not be retrieved
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error retrieving user")),
      );
    }
  }
}
