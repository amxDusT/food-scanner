import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuka_clone/controllers/barcode_info_controller.dart';
import 'package:yuka_clone/resources/utils.dart';

class BarcodeInfo extends StatelessWidget {
  BarcodeInfo({super.key});
  final controller = Get.put(InfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Info')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (controller.product.value.imageUrl.isNotEmpty)
                Container(
                  color: Colors.grey[200],
                  width: Get.width * 0.8,
                  height: Get.height * 0.4,
                  child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    child: Image.network(controller.product.value.imageUrl),
                  ),
                ),
              Text(controller.product.value.name),
              Text(controller.product.value.brands),
              TextButton(
                  onPressed: () => controller.showNutriments(),
                  child: const Text('Informazioni Nutrizionali')),
              //Text(controller.product!.value.nutriments.toString()),
              const SizedBox(height: 12),
              CircleAvatar(
                radius: 30,
                backgroundColor:
                    Utils.gradeColor(controller.product.value.nutriscore.grade),
                child: Text(
                  controller.product.value.nutriscore.grade.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                      text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: controller.product.value.nutriscore.negativeScore
                            .toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                          text:
                              ' / ${controller.product.value.nutriscore.maxNegativeScore}'),
                    ],
                  )),
                  IconButton(
                    onPressed: () {
                      controller.showNegative();
                    },
                    icon: const Icon(Icons.info),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                      text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: controller.product.value.nutriscore.positiveScore
                            .toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.green,
                        ),
                      ),
                      TextSpan(
                          text:
                              ' / ${controller.product.value.nutriscore.maxPositiveScore}'),
                    ],
                  )),
                  IconButton(
                    onPressed: () {
                      controller.showPositive();
                    },
                    icon: const Icon(Icons.info),
                  ),
                ],
              ),
              //Text(controller.product!.value.labels),
            ],
          ),
        );
      }),
    );
  }
}
