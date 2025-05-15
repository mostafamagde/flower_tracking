import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flutter/material.dart';

class ImageUploadTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function()? onPickImage;

  const ImageUploadTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.onPickImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasImage = controller?.text.isNotEmpty ?? false;
    final fileName = hasImage ? controller!.text.split('/').last : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onPickImage,
          child: IgnorePointer(
            child: TextFormField(
              controller: controller,
              validator: validator,
              keyboardType: keyboardType,
              obscureText: obscureText,
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                labelStyle:  TextStyle(color: AppColors.darkgreyColor),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: Icon(
                  hasImage ? Icons.check_circle : Icons.file_upload_outlined,
                  color: hasImage ? Colors.green : null,
                ),
              ),
            ),
          ),
        ),
        if (hasImage)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'تم اختيار: $fileName',
              style: const TextStyle(color: Colors.green, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
