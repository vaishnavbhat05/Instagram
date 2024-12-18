import 'package:flutter/material.dart';
import '../../../../services/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {

  List<String> _followingList = [];
  List<Map<String, String>> _allFollowers = [];
  Map<String, String>? _userDetails;

  final DatabaseHelper _dbHelper = DatabaseHelper();

  Map<String, String>? get userDetails => _userDetails;
  List<String> get followingList => _followingList;
  List<Map<String, String>> get allFollowers => _allFollowers;

  void _loadFollowingList(int userId) async {
    // Load user details
    _userDetails = await _dbHelper.getUserDetailsById(userId);
    _followingList = await _dbHelper.getFollowings(userId);
    notifyListeners();
  }

  void loadAllFollowers() async {
    _allFollowers = await _dbHelper.getFollowers();
    final prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId')!;
    _loadFollowingList(userId);
    notifyListeners();
  }

  void add(String name) async {
      final prefs = await SharedPreferences.getInstance();
      int userId = prefs.getInt('userId')!;
    await _dbHelper.addFollowing(userId, name);
    _loadFollowingList(userId); // Refresh following list
  }

  void remove(String name) async {
    final prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId')!;
    await _dbHelper.removeFollowing(userId, name);
    _loadFollowingList(userId); // Refresh following list
  }

}
