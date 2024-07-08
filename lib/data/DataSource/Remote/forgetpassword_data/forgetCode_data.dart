import 'package:delivery/core/Class/CRUD_Class.dart';
import 'package:delivery/linkapi.dart';

class VerfiyCodeForgetPassData {
  Crud crud;
  VerfiyCodeForgetPassData(this.crud);
  checkData(String email, String code) async {
    var response = await crud.postData(
        AppLink.verifycodeforgetpassword, {"email": email, "code": code});
    return response.fold((l) => l, (r) => r);
  }
}
