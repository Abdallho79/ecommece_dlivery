import 'package:delivery/core/Class/StatusRequest_Class.dart';
import 'package:delivery/core/Functions/HandlingDataController_Functions.dart';
import 'package:delivery/core/Services/Services.dart';

import 'package:delivery/data/DataSource/Remote/orders/orderspinding_data.dart';
import 'package:delivery/data/model/Orders_model.dart';
import 'package:get/get.dart';

class BindingController extends GetxController {
  List<OrdersModel> data = [];
  OrdersPindingData bindingdata = OrdersPindingData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bindingdata.orderBindig();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsebody = response["data"];
        data.addAll(responsebody.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  approveOrder(String ordersid, String usersid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bindingdata.approveOrder(
        ordersid, usersid, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        reFreshOrder();
        // Get.put(TrackingOrderController());
        // List responsebody = response["data"];
        // data.addAll(responsebody.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  reFreshOrder() {
    getData();
  }

  String printTypeOrder(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recicve";
    }
  }

  String printPaymantMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Paymant Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Appoval";
    } else if (val == "1") {
      return "The Order Is Beeing Prepared";
    } else if (val == "2") {
      return "The Order with delivery";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  @override
  void onInit() {
    // print(
    //     "======${myServices.sharedPreferences.getString("id")!.isEmpty}==");
    getData();
    super.onInit();
  }
}
