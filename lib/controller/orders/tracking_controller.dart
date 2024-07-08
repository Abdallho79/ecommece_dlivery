import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/core/Class/StatusRequest_Class.dart';
import 'package:delivery/core/Constant/Routes_Const.dart';
import 'package:delivery/core/Functions/HandlingDataController_Functions.dart';
import 'package:delivery/core/Functions/getDecodePolyLine.dart';
import 'package:delivery/core/Services/Services.dart';
import 'package:delivery/data/DataSource/Remote/orders/ordersAccepted_data.dart';
import 'package:delivery/data/model/Orders_model.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrdersController extends GetxController {
  StreamSubscription<Position>? positionstrem;
  // Position position  ;
  GoogleMapController? gmc;
  CameraPosition? cameraPosition;
  List<Marker> marker = [];
  StatusRequest statusRequest = StatusRequest.success;
  MyServices myServices = Get.find();
  late OrdersModel ordersModel;
  Timer? timer;
  Set<Polyline> polylineSet = {};
  double? destlat;
  double? destlong;
  double? currenttlat;
  double? currenttlont;
  OrdersAppectedData bindingdata = OrdersAppectedData(Get.find());

  getCurrentLocation() {
    cameraPosition = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 12.4746);

    marker.add(Marker(
        markerId: const MarkerId("dest"),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));

    positionstrem = Geolocator.getPositionStream().listen((Position? position) {
      currenttlat = position!.latitude;
      currenttlont = position.longitude;

      if (gmc != null) {
        gmc!.animateCamera(CameraUpdate.newLatLng(
            LatLng(currenttlat!, currenttlont!))); //لتحديث موقع الكاميرا
      }

      marker.removeWhere((element) => element.markerId.value == "current");

      // initPolyLine(); // oninit(){} كان بيستدعيها في
      marker.add(Marker(
          markerId: const MarkerId("current"),
          position: LatLng(position.latitude, position.longitude)));
      update();
    });
  }

  initPolyLine() async {
    destlat = ordersModel.addressLat!;
    destlong = ordersModel.addressLong!;
    print("==========================================");
    print("currenttlat $currenttlat");
    print("currenttlont $currenttlont");
    print("destlat $destlat");
    print("destlong $destlong");
    print("==========================================");
    await Future.delayed(const Duration(seconds: 1));
    polylineSet =
        await getPolyLine(currenttlat!, currenttlont!, destlat!, destlong!);
    update();
  }

  reFrechLocation() async {
    await Future.delayed(Duration(seconds: 2));

    timer = Timer.periodic(Duration(seconds: 3), (timer) async {
     await FirebaseFirestore.instance
          .collection("delivery")
          .doc(ordersModel.ordersId)
          .set({
        "Lat": currenttlat,
        "Long": currenttlont,
        "deliveyid": myServices.sharedPreferences.getString("id"),
      });
    });
  }

  doneOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    print("==============010================");
    var response = await bindingdata.doneOrder(
        ordersModel.ordersId!, ordersModel.ordersUsersid!);
    print("================1================");
    Get.offAllNamed(AppRouts.home);
  }

  @override
  void onInit() {
    ordersModel = Get.arguments["ordersModel"];
    getCurrentLocation();
    initPolyLine();
    reFrechLocation();
    super.onInit();
  }

  @override
  void onClose() {
    positionstrem!.cancel();
    gmc!.dispose();
    timer!.cancel();
    super.onClose();
  }
}
