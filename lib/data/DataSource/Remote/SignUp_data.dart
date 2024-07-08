import 'package:delivery/LinkAPI.dart';
import 'package:delivery/core/Class/CRUD_Class.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  insertData(String email, String phone, String name, String password) async {
    Map data = {
      "email": email,
      "phone": phone,
      "password": password,
      "username": name
    };
    var response = await crud.postData(AppLink.verifycodessignup, data);
    return response.fold((l) => l, (r) => r);
  }
}
