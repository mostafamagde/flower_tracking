import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flower_tracking/core/app_colors/colors.dart';

class DropDownTextFiled extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final List<DropDownValueModel>? dropDownList;
  final Function(String)? onChanged;

  const DropDownTextFiled({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.dropDownList,
    this.onChanged,
  });

  @override
  State<DropDownTextFiled> createState() => _DropDownTextFiledState();
}

class _DropDownTextFiledState extends State<DropDownTextFiled> {
  final SingleValueDropDownController _controller =
      SingleValueDropDownController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      controller: _controller,
      clearOption: true,
      dropDownItemCount: widget.dropDownList?.length ?? 0,
      textFieldDecoration: InputDecoration(
        labelText: widget.labelText ?? "Select your country",
        hintText: widget.hintText ?? "Select your country",
        labelStyle: TextStyle(color: AppColors.darkgreyColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      listTextStyle: const TextStyle(color: Colors.black87),
      clearIconProperty: IconProperty(icon: Icons.clear, color: Colors.red),
      dropDownIconProperty: IconProperty(
        icon: Icons.keyboard_arrow_down_outlined,
        color: AppColors.darkgreyColor,
        size: 30,
      ),
      dropDownList: widget.dropDownList ?? const [],
      onChanged: (value) {
        if (widget.onChanged != null && value is DropDownValueModel) {
          widget.onChanged!(value.value);
        }
      },
    );
  }
}
