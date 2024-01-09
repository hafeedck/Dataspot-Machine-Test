import 'package:dataspot_machine_test/common_widgets/colors/colors.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final bool? isEnable;
  final FormFieldValidator? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? expands;
  final Function? onTap;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function? onChanged;
  final Function? suffixIconClick;
  final TextEditingController? textEditingController;
  final bool readonly;
  const CommonTextField(
      {super.key,
      this.hintText,
      this.isEnable,
      this.readonly = false,
      this.validator,
      this.prefixIcon,
      this.textInputType,
      this.obscureText = false,
      this.expands = false,
      this.suffixIconClick,
      this.textEditingController,
      this.suffixIcon,
      this.onTap,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      textAlign: TextAlign.start,
      validator: validator,
      obscureText: obscureText,
      controller: textEditingController,
      enabled: isEnable ?? true,
      style: const TextStyle(fontSize: 16),
      expands: expands!,
      maxLines: null,
      onTap: onTap == null
          ? null
          : () {
              FocusScope.of(context).requestFocus(FocusNode());
              onTap!();
            },
      onChanged: onChanged == null
          ? null
          : (String? value) {
              onChanged!(value);
            },
      // keyboardType: textInputType,
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.allow(RegExp(r'^[0-9][0-9]*')),
      //   LengthLimitingTextInputFormatter(10),
      // ],
      decoration: InputDecoration(
        fillColor: whiteColor,
        // contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontFamily: "Manrope",
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        isDense: true,

        border: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}
