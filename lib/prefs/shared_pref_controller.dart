import 'package:scratchfood/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn, id, name, email, mobile, verified, token }

class SharedPrefController {
  SharedPrefController._();
  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;
  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // void save(User user){
  //    _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
  //    _sharedPreferences.setInt(PrefKeys.id.name, user.id);
  //    _sharedPreferences.setString(PrefKeys.city_id.name, user.cityId.toString());
  //    _sharedPreferences.setString(PrefKeys.name.name, user.name);
  //    _sharedPreferences.setString(PrefKeys.email.name, user.email?? '');
  //     _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
  //    _sharedPreferences.setString(PrefKeys.gender.name, user.gender);
  //    _sharedPreferences.setBool(PrefKeys.active.name, user.active);
  //    _sharedPreferences.setBool(PrefKeys.verified.name, user.verified);
  //    _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${user.token}');
  //
  // }
  void save(UserModel userModel) {
    _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    _sharedPreferences.setString(
        PrefKeys.email.name, userModel.user!.email ?? '');
    _sharedPreferences.setString(PrefKeys.name.name, userModel.user!.name!);
    _sharedPreferences.setString(
        PrefKeys.id.name, userModel.user!.id.toString());
    _sharedPreferences.setString(
        PrefKeys.verified.name, userModel.user!.emailVerifiedAt.toString());
    _sharedPreferences.setString(
        PrefKeys.token.name, 'Bearer ${userModel.token!}');
    _sharedPreferences.setString(
        PrefKeys.mobile.name, userModel.user!.phone ?? '');
  }

  T? getValueFor<T>(String key) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    }
    return null;
  }

  void clear() async {
    _sharedPreferences.clear();
  }
}
