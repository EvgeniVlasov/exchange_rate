import 'package:exchange_rates/main_page/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogCurrencies extends GetView<MainController> {
  final List<String> currencies;
  final bool isUserField;

  const DialogCurrencies({
    super.key,
    required this.currencies,
    required this.isUserField,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('choose a currency'),
      content: SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: currencies
                .map((e) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Checkbox(
                            value: controller.bufferCurrency.value == e,
                            onChanged: (value) {
                              if (value == true) {
                                controller.bufferCurrency.value = e;
                              }
                            })),
                        Text(e)
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => controller.onPressOKDialog(isUserField),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => controller.onPressOKDialog(isUserField),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
