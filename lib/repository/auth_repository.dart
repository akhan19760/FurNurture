import 'package:flutter/material.dart';
import 'package:furniture_app/model/user_model.dart';
import 'package:furniture_app/network/auth_controller.dart';

class AuthRepository {
  static AuthNetwork authNetwork = AuthNetwork();

  static getUserProfile(uid, BuildContext context) async {
    var user = await authNetwork.getUserProfile(uid: uid);
    Map<String, dynamic> data = user.data();
    UserModel userModel = UserModel.fromJson(data);
    return userModel;
  }

  static updateUserProfile(
      UserModel userModel, uid, BuildContext context) async {
    var user = await authNetwork.updateUserProfile(user: userModel, uid: uid);
    Map<String, dynamic> data = user.data();
    UserModel u = UserModel.fromJson(data);
    return u;
  }

  static googleSignin() async {
    var user = await authNetwork.googleSignIn();
    Map<String, dynamic> data = user.data();
    UserModel userModel = UserModel.fromJson(data);
    return userModel;
  }
}
