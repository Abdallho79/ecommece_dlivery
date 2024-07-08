import 'package:delivery/controller/orders/tracking_controller.dart';
import 'package:delivery/core/Class/CoustomButtonLimited_Class.dart';
import 'package:delivery/core/Class/HandlingDataView_Class.dart';
import 'package:delivery/core/Functions/getDecodePolyLine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingOrders extends StatelessWidget {
  const TrackingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TrackingOrdersController());
    return Scaffold(
      appBar: AppBar(title: const Text("Tracking Orders")),
      body: GetBuilder<TrackingOrdersController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                if (controller.ordersModel.ordersType == "0" &&
                    controller.ordersModel.ordersStatus == "3")
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: GoogleMap(
                        polylines: controller.polylineSet,
                        markers: controller.marker.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.gmc = controllermap;
                        },
                      ),
                    ),
                  ),
                CoustomButton(
                  text: "Done",
                  paddinglenth: 0,
                  width: 300,
                  onPressed: () {
                    controller.doneOrders();
                  },
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ));
      }),
    );
  }
}
