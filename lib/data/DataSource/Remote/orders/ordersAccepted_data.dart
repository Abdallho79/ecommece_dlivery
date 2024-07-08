import 'package:delivery/core/Class/CRUD_Class.dart';
import 'package:delivery/linkapi.dart';

class OrdersAppectedData {
  Crud crud;
  OrdersAppectedData(this.crud);
  getData(String deliveryid) async {
    var response = await crud.postData(AppLink.acceptevieworders, {"deliveryid" : deliveryid});
    return response.fold((l) => l, (r) => r);
  }
  doneOrder(String ordersid , String usersid) async {
    var response = await crud
        .postData(AppLink.doneorders, {"ordersid": ordersid , "usersid" : usersid});
    return response.fold((l) => l, (r) => r);
  }
}
