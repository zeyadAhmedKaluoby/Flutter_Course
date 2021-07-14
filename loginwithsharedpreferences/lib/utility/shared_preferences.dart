import 'package:loginwithsharedpreferences/domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{
  Future<bool> saveUser(User user) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('userId', user.userId!);
    sharedPreferences.setString('name', user.name!);
    sharedPreferences.setString('email', user.email!);
    sharedPreferences.setString('phone', user.phone!);
    sharedPreferences.setString('type', user.type!);
    sharedPreferences.setString('token', user.token!);
    sharedPreferences.setString('renewalToken', user.renewalToken!);



    return sharedPreferences.commit();

  }

  Future<User> getUser() async
  {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    int? userId=sharedPreferences.getInt('userId');
    String? name=sharedPreferences.getString('name');
    String? email=sharedPreferences.getString('email');
    String? phone=sharedPreferences.getString('phone');
    String? type=sharedPreferences.getString('type');
    String? token=sharedPreferences.getString('token');
    String? renewalToken=sharedPreferences.getString('renewalToken');

    return User(
  userId: userId!,
  name: name!,
  email: email!,
  phone: phone!,
  type: type!,
    token: token!,
    renewalToken: renewalToken!

);





  }
  void removeUser() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('userId');
    sharedPreferences.remove('name');
    sharedPreferences.remove('email');
    sharedPreferences.remove('phone');
    sharedPreferences.remove('type');
    sharedPreferences.remove('token');
    sharedPreferences.remove('renewalToken');
  }

  Future<String> getToken()async
  {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
String? token = sharedPreferences.getString('token');
return token!;
  }
}