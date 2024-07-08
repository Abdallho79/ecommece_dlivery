import 'package:delivery/controller/orders/pinding_controller.dart';
import 'package:delivery/core/Class/HandlingDataView_Class.dart';
import 'package:delivery/view/widget/orders/orderslistcardbinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BendingOrders extends StatelessWidget {
  const BendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
  BindingController controller =  Get.put(BindingController());

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Orders Bindings"),
      //   leading: IconButton(
      //     onPressed: () {
      //       controller.reFreshOrder();
      //     },
      //     icon: Icon(Icons.refresh_outlined),
      //   ),
      // ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<BindingController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CardOrderList(
                        model: controller.data[index],
                      );
                    },
                  )))),
    );
  }
}
