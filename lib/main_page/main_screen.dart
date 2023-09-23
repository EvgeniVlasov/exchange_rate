import 'package:exchange_rates/main_page/main_controller.dart';
import 'package:exchange_rates/main_page/widgets/app_progress_indicator.dart';
import 'package:exchange_rates/main_page/widgets/input_field_currency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency converter'),
        centerTitle: false,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
          child: Obx(() => controller.isLoadingPage.isTrue
              ? const AppProgressIndicator()
              : Column(
                  children: [
                    InputFieldCurrency(
                      hint: 'You send',
                      onPressShowCurrencies: () =>
                          controller.showCurrenciesList(true),
                      textEditingController:
                          controller.userInputFieldController,
                      onChangeTextField: controller.onChangeInputUserField,
                      currency: controller.userCurrency,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                      child: Icon(
                        Icons.currency_exchange_sharp,
                        size: 40,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    InputFieldCurrency(
                      hint: 'They get',
                      onPressShowCurrencies: () =>
                          controller.showCurrenciesList(false),
                      textEditingController:
                          controller.convectorInputFieldController,
                      onChangeTextField: controller.onChangeInputConvectorField,
                      currency: controller.convectorCurrency,
                    ),
                  ],
                ))),
    );
  }
}
