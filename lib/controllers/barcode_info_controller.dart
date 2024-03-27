import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuka_clone/controllers/home_controller.dart';
import 'package:yuka_clone/models/product.dart';
import 'package:yuka_clone/resources/api.dart';
import 'package:yuka_clone/resources/database.dart';
import 'package:yuka_clone/resources/utils.dart';

class InfoController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rx<Product> product = Product.empty().obs;
  final String barcode = Get.arguments['barcode'];
  @override
  void onInit() async {
    isLoading.value = true;
    try {
      product.value = await Api.getData(barcode);

      final matches = Get.find<HomeController>()
          .storedProducts
          .where((element) => element.barcode == barcode);
      if (matches.isNotEmpty) {
        DatabaseCommands().updateProduct(matches.first);
      } else {
        DatabaseCommands().addProduct(product.value);
      }
    } catch (e) {
      Get.back(closeOverlays: true);

      if (e is ApiException) {
        Utils.showSnackBar(e.message);
      } else if (e is ProductNotFoundException) {
        Utils.showSnackBar('Prodotto non trovato');
      } else {
        print('errore: ${e.toString()}');
      }
    } finally {
      isLoading.value = false;
    }
    super.onInit();
  }

  void showNegative() {
    String toFixed(double val, [int fixed = 0]) {
      return val.toStringAsFixed(fixed);
    }

    Get.defaultDialog(
      title: 'Punti negativi',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.value.nutriscore.canShowEnergy)
            Text(
                'Energia: ${product.value.nutriscore.energyPoints} / ${product.value.nutriscore.energyPointsMax} (${toFixed(product.value.nutriments.energyKcal)} ${product.value.nutriments.energyKcalUnit})'),
          if (product.value.nutriscore.canShowSaturatedFat)
            Text(
                'Grassi saturi: ${product.value.nutriscore.saturatedFatPoints} / ${product.value.nutriscore.saturatedFatPointsMax} (${toFixed(product.value.nutriments.saturatedFat)} ${product.value.nutriments.saturatedFatUnit})'),
          if (product.value.nutriscore.canShowSugars)
            Text(
                'Zuccheri: ${product.value.nutriscore.sugarsPoints} / ${product.value.nutriscore.sugarsPointsMax} (${toFixed(product.value.nutriments.sugars)} ${product.value.nutriments.sugarsUnit})'),
          if (product.value.nutriscore.canShowSalt)
            Text(
                'Sale: ${product.value.nutriscore.saltPoints} / ${product.value.nutriscore.saltPointsMax} (${toFixed(product.value.nutriments.salt, 2)} ${product.value.nutriments.saltUnit})'),
          if (product.value.nutriscore.canShowSodium)
            Text(
                'Sodio: ${product.value.nutriscore.sodiumPoints} / ${product.value.nutriscore.sodiumPointsMax}'),
        ],
      ),
      textCancel: 'Chiudi',
    );
  }

  void showPositive() {
    String toFixed(double val, [int fixed = 0]) {
      return val.toStringAsFixed(fixed);
    }

    Get.defaultDialog(
      title: 'Punti positivi',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (product.value.nutriscore.canShowFiber)
            Text(
                'Fibre: ${product.value.nutriscore.fiberPoints} / ${product.value.nutriscore.fiberPointsMax}'),
          if (product
              .value.nutriscore.canShowFruitsVegetablesNutsColzaWalnutOliveOils)
            Text(
                'Frutta, verdura, legumi: ${product.value.nutriscore.fruitsVegetablesNutsColzaWalnutOliveOilsPoints} / ${product.value.nutriscore.fruitsVegetablesNutsColzaWalnutOliveOilsPointsMax}'),
          if (product.value.nutriscore.canShowProteins)
            Text(
                'Proteine: ${product.value.nutriscore.proteinsPoints} / ${product.value.nutriscore.proteinsPointsMax}'),
        ],
      ),
      textCancel: 'Chiudi',
    );
  }

  void showNutriments() {
    String toFixed(double val, [int fixed = 0]) {
      return val.toStringAsFixed(fixed);
    }

    Get.defaultDialog(
      title: 'Informazioni Nutrizionali per 100g',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Energia: ${toFixed(product.value.nutriments.energyKcal)} ${product.value.nutriments.energyKcalUnit}'),
          Text(
              'Proteine: ${toFixed(product.value.nutriments.proteins)} ${product.value.nutriments.proteinsUnit}'),
          Text(
              'Carboidrati: ${toFixed(product.value.nutriments.carbohydrates)} ${product.value.nutriments.carbohydratesUnit}'),
          Text(
              'Grassi: ${toFixed(product.value.nutriments.fat)} ${product.value.nutriments.fatUnit}'),
          Text(
              'Acidi grassi saturi: ${toFixed(product.value.nutriments.saturatedFat)} ${product.value.nutriments.saturatedFatUnit}'),
          Text(
              'Zuccheri: ${toFixed(product.value.nutriments.sugars)} ${product.value.nutriments.sugarsUnit}'),
          Text(
              'Sale: ${toFixed(product.value.nutriments.salt, 2)} ${product.value.nutriments.saltUnit}'),
        ],
      ),
      textCancel: 'Chiudi',
    );
  }
}
