import 'package:app_ui/utils/httpUtil.dart';

class UserApi {
  static UserApi? _instance;
  factory UserApi() => _instance ?? UserApi._internal();
  static UserApi? get instance => _instance ?? UserApi._internal();

  UserApi._internal() {
  }

  login(username, password) async {
    var result = await HttpUtil.post('/nod/login', data: {"username": username, "password": password});
    HttpUtil.authorization = result.data['token'];
    return result.data;
  }
}
