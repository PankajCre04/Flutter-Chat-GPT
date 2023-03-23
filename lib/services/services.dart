import 'package:chat_gpt/constants/constants.dart';
import 'package:chat_gpt/widgets/model_dropdown.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class Services {
  static Future<void> showBottomModal({required BuildContext context}) async {
    return await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        backgroundColor: scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                    child: TextWidget(
                  label: "Chosen Model:",
                )),
                Flexible(
                  //   flex: 2,
                  child: ModelDropDownWidget(),
                ),
              ],
            ),
          );
        });
  }
}
