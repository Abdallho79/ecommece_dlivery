import 'package:delivery/core/Class/CRUD_Class.dart';
import 'package:delivery/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  CheckData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
