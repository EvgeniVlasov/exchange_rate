import 'package:exchange_rates/main_page/widgets/dialog_currensies.dart';
import 'package:exchange_rates/servises/main_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final class MainController extends GetxController {
  final MainService _mainService;
  final TextEditingController userInputFieldController =
      TextEditingController();
  final TextEditingController convectorInputFieldController =
      TextEditingController();
  final RxBool isLoadingPage = false.obs;
  final RxString userCurrency = ''.obs;
  final RxString convectorCurrency = ''.obs;
  final RxString bufferCurrency = ''.obs;
  List<String>? _currencies;

  MainController({required MainService mainService})
      : _mainService = mainService;

  @override
  void onReady() async {
    super.onReady();
    await _getExchangesRates();
  }

  Future _getExchangesRates() async {
    isLoadingPage.value = true;
    _currencies = await _mainService.getExchangeRates();
    isLoadingPage.value = false;
  }

  void onChangeInputUserField(String? text) {
    if (userCurrency.isNotEmpty &&
        convectorCurrency.isNotEmpty &&
        text != null) {
      convectorInputFieldController.text = _mainService.makeACalculation(
          input: text,
          dividendKey: userCurrency.value,
          divisorKey: convectorCurrency.value);
    }
  }

  void onChangeInputConvectorField(String? text) {
    if (userCurrency.isNotEmpty &&
        convectorCurrency.isNotEmpty &&
        text != null) {
      userInputFieldController.text = _mainService.makeACalculation(
          input: text,
          dividendKey: convectorCurrency.value,
          divisorKey: userCurrency.value);
    }
  }

  void showCurrenciesList(bool isUserField) {
    bufferCurrency.value =
        isUserField ? userCurrency.value : convectorCurrency.value;
    if (_currencies != null) {
      Get.dialog(DialogCurrencies(
        currencies: _currencies!,
        isUserField: isUserField,
      ));
    }
  }

  void onPressCancelDialog(bool isUserField) {
    bufferCurrency.value = '';
    Get.back();
  }

  void onPressOKDialog(bool isUserField) {
    if (isUserField) {
      userCurrency.value = bufferCurrency.value;
      if (convectorCurrency.isNotEmpty) {
        if (convectorInputFieldController.text.isNotEmpty) {
          userInputFieldController.text = _mainService.makeACalculation(
              input: convectorInputFieldController.text,
              dividendKey: convectorCurrency.value,
              divisorKey: userCurrency.value);
        }
        if (userInputFieldController.text.isNotEmpty) {
          convectorInputFieldController.text = _mainService.makeACalculation(
              input: userInputFieldController.text,
              dividendKey: userCurrency.value,
              divisorKey: convectorCurrency.value);
        }
      }
    } else {
      convectorCurrency.value = bufferCurrency.value;
      if (userCurrency.isNotEmpty) {
        if (convectorInputFieldController.text.isNotEmpty) {
          userInputFieldController.text = _mainService.makeACalculation(
              input: convectorInputFieldController.text,
              dividendKey: convectorCurrency.value,
              divisorKey: userCurrency.value);
        }
        if (userInputFieldController.text.isNotEmpty) {
          convectorInputFieldController.text = _mainService.makeACalculation(
              input: userInputFieldController.text,
              dividendKey: userCurrency.value,
              divisorKey: convectorCurrency.value);
        }
      }
    }
    Get.back();
  }
}
