import 'package:flutter/material.dart';
import 'package:mvvm_application/api_service/ApiRepo.dart';
import 'package:mvvm_application/model/UserModel.dart';

class UserViewModel with ChangeNotifier {
  List<UserModel> _userModel = [];

  List<UserModel> get userList {
    return _userModel;
  }

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  bool _error = false;

  bool get error {
    return _error;
  }

  String _errorMessage = "";

  String get errorMessage {
    return _errorMessage;
  }

  Future<void> loadUsers() async {
    _isLoading = true;
      notifyListeners();
    try {
      _userModel = await ApiRepository().getUserPostFromServer();
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      _error = true;
      _errorMessage = e.toString();
      notifyListeners();
    }
    notifyListeners();
  }
}
