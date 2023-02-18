import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/model/user_model.dart';
import 'package:provider/provider.dart';

class UserProvider with ChangeNotifier {
  UserModel _user =
      UserModel(uid: '', name: '', email: '', address: '', phone: '');

  UserModel get user => _user;

  set user(UserModel userModel) {
    _user = UserModel(
        uid: userModel.uid,
        name: userModel.name,
        email: userModel.email,
        address: userModel.address,
        phone: userModel.phone);
    notifyListeners();
  }
}
