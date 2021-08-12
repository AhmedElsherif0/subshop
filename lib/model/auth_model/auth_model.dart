import 'package:firstdesign/model/auth_model/user_data.dart';

class AuthModel {
  bool? _status;
  String? _message;
  UserData? _data;

  AuthModel(
      {required bool status, required String message, required UserData data}) {
    this._status = status;
    this._message = message;
    this._data = data;
  }

  AuthModel.fromJson(Map<String, dynamic>? json) {
    _status = json?['status'];
    _message = json?['message'];
    _data = json?['data'] != null ? UserData.fromJson(json?[['data']]) : null;
  }
  bool? get status => _status;
  String? get message => _message;
  UserData? get data => _data;
}
