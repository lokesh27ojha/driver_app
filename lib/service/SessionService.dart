import 'package:shared_preferences/shared_preferences.dart';

class SessionService {

  static const String _isLoggedInKey="isLoggedIn";
  static const String _driverEmailKey="driverEmail";

  //save login
  Future<void> saveLogin(String email) async{
    final prefs= await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_driverEmailKey, email);
  }

  //check login
  Future<bool> isLoggedIn() async{
    final prefs= await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }  

  //get saved user
  Future<String?> getDriverEmail() async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getString(_driverEmailKey);
  } 

  //logout
  Future<void> logout() async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.clear();
  }


}