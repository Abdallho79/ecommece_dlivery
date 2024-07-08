import 'package:delivery/core/Class/CRUD_Class.dart';
import 'package:delivery/linkapi.dart';

class OrdersPindingData {
  Crud crud;
  OrdersPindingData(this.crud);
  orderBindig() async {
    var response = await crud.postData(AppLink.pendingvieworders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String ordersid, String usersid, String deliveryid) async {
    var response = await crud.postData(AppLink.approveorders, {
      "ordersid": ordersid,
      "usersid": usersid,
      "deliveryid": deliveryid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
