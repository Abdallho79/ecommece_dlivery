import 'package:delivery/core/Class/CRUD_Class.dart';
import 'package:delivery/linkapi.dart';

class ChangePasswordData {
  Crud crud;
  ChangePasswordData(this.crud);
  updateData(String email, String password) async {
    var response = await crud.postData(
        AppLink.resetPassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
