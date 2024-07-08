import 'package:delivery/core/Class/CRUD_Class.dart';
import 'package:delivery/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  orderArchive(String deliveryid) async {
    var response =
        await crud.postData(AppLink.archivevieworders, {"deliveryid": deliveryid});
    return response.fold((l) => l, (r) => r);
  }
}
