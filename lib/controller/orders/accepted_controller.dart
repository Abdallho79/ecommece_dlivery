import 'package:delivery/core/Class/StatusRequest_Class.dart';
import 'package:delivery/core/Functions/HandlingDataController_Functions.dart';
import 'package:delivery/core/Services/Services.dart';
import 'package:delivery/data/DataSource/Remote/orders/ordersAccepted_data.dart';
// import 'package:delivery/data/DataSource/Remote/orders/orderspinding_data.dart';
import 'package:delivery/data/model/Orders_model.dart';
import 'package:get/get.dart';

class AcceptedController extends GetxController {
  List<OrdersModel> data = [];
  OrdersAppectedData bindingdata = OrdersAppectedData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bindingdata
        .getData(myServices.sharedPreferences.getString("id")!);
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

  doneOrders(String usersid, String ordersid) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await bindingdata.doneOrder(ordersid, usersid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getData();
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
    getData();
    super.onInit();
  }
}
