import 'package:delivery/controller/orders/details_controller.dart';
import 'package:delivery/core/Class/CoustomButtonLimited_Class.dart';
import 'package:delivery/core/Constant/Color_Const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<OrdersDetailsController>(builder: (controller) {
          return ListView(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Table(
                    children: [
                      const TableRow(children: [
                        Text(
                          "Product",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "QTY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Price",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      ...List.generate(
                          controller.data.length,
                          (index) => TableRow(children: [
                                Text(
                                  "${controller.data[index].itemsName}",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controller.data[index].countitems}",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controller.data[index].itemsPrice}",
                                  textAlign: TextAlign.center,
                                ),
                              ]))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  child: Center(
                    child: Text(
                      "Total Price : ${controller.ordersModel.ordersPrice}",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              if (controller.ordersModel.ordersType == "0")
                Card(
                  child: ListTile(
                    title: const Text(
                      "Shipping Address",
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              if (controller.ordersModel.ordersType == "0")
                Card(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: 300,
                    width: double.infinity,
                    child: GoogleMap(
                      markers: controller.marker.toSet(),
                      mapType: MapType.normal,
                      initialCameraPosition: controller.cameraPosition!,
                      onMapCreated: (GoogleMapController controllermap) {
                        controller.completer_controller!
                            .complete(controllermap);
                      },
                    ),
                  ),
                ),
              SizedBox(
                height: 30,
              ),
              if (controller.ordersModel.ordersStatus == "3")
                CoustomButton(
                  text: "Tracking",
                  paddinglenth: 30,
                  width: 100,
                  onPressed: () {
                    controller.goToTracking();
                  },
                )
            ],
          );
        }),
      ),
    );
  }
}