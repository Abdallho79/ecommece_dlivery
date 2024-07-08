// ignore: file_names
import 'package:delivery/core/Class/CRUD_Class.dart';
import 'package:delivery/linkapi.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  checkData(String email, String code) async {
    var response = await crud
        .postData(AppLink.verifycodessignup, {"email": email, "code": code});
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {'email': email});
    return response.fold((l) => l, (r) => r);
  }
}
