import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:todo/ui/theme.dart';

class MyInputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField(
      {Key? key,
      required this.label,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: titleStyle),
          const Gap(10),
          Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    readOnly: widget != null,
                    autofocus: false,
                    cursorColor:
                        Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                widget != null ? Container(child: widget) : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
