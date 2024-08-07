import 'dart:async';

import 'package:delivery/core/Constant/Routes_Const.dart';
import 'package:delivery/core/Functions/HandlingDataController_Functions.dart';
import 'package:delivery/data/datasource/remote/orders/ordersdeatils_data.dart';
import 'package:delivery/data/model/Orders_model.dart';
import 'package:delivery/data/model/cartmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/Class/StatusRequest_Class.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData testData = OrdersDetailsData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  late OrdersModel ordersModel;

  CameraPosition? cameraPosition;
  Position? position;
  Completer<GoogleMapController>? completercontroller;
  List<Marker> marker = [];
  double? long;
  double? lat;

  @override
  void onInit() {
    completercontroller = Completer<GoogleMapController>();
    ordersModel = Get.arguments["ordersdetails"];
    getLocatoin();
    getData();
    super.onInit();
  }

  getLocatoin() async {
    ordersModel.addressLat = 31.023613;
    ordersModel.addressLong = 31.417852;
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
          target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
          zoom: 12);
      marker.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));
      update();
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(ordersModel.ordersId!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToTracking() {
    Get.toNamed(AppRouts.tracking, arguments: {
      "ordersModel": ordersModel,
    });
  }
}
