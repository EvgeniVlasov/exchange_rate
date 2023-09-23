import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputFieldCurrency extends StatelessWidget {
  final VoidCallback onPressShowCurrencies;
  final TextEditingController textEditingController;
  final Function(String? text) onChangeTextField;
  final RxString currency;
  final String hint;

  const InputFieldCurrency(
      {super.key,
      required this.onPressShowCurrencies,
      required this.textEditingController,
      required this.onChangeTextField,
      required this.currency,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z]')),
                ],
                keyboardType: TextInputType.number,
                controller: textEditingController,
                onChanged: onChangeTextField,
              ),
            ),
            Row(
              children: [
                Obx(() => Text(
                      currency.value,
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    )),
                IconButton(
                  onPressed: onPressShowCurrencies,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
