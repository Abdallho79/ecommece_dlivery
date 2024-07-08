import 'package:delivery/core/Class/CRUD_Class.dart';
import 'package:delivery/linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);
  getData(String ordersid) async {
    var response = await crud.postData(AppLink.detailsorders, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
