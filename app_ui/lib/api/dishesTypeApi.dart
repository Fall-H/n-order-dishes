import 'package:app_ui/utils/httpUtil.dart';

class DishesTypeApi {
  static DishesTypeApi? _instance;
  factory DishesTypeApi() => _instance ?? DishesTypeApi._internal();
  static DishesTypeApi? get instance => _instance ?? DishesTypeApi._internal();

  DishesTypeApi._internal() {
  }

  all(name, limit, offset) async {
    var result = await HttpUtil.get('/nod/dishes/type/all?name=$name&limit=$limit&offset=$offset',
        data: {"name": name, "limit": limit, "offset": offset});
    return result.data;
  }
}
