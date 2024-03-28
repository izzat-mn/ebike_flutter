import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';

class CustomTextFrom extends StatelessWidget {
  final String? label;
  final Color? labelColor;
  final String? prefixLabel;
  final String? suffixLabel;
  final double? width;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLength;
  final bool? filled;
  final void Function()? onTap;
  final void Function(String)? onChange;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;

  const CustomTextFrom({
    super.key,
    this.label,
    this.labelColor,
    this.prefixLabel,
    this.suffixLabel,
    this.width,
    this.hintText,
    this.textInputType,
    this.maxLength,
    this.filled,
    this.onTap,
    this.onChange,
    this.onTapOutside,
    this.onEditingComplete,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    label!,
                    style: TextStyle(
                        fontSize: 12, color: labelColor ?? Colour.grey11),
                  ),
                )
              : Container(),
          SizedBox(
            height: 46,
            width: width,
            child: TextFormField(
              controller: controller,
              autocorrect: false,
              enableSuggestions: false,
              style: TextStyle(fontSize: 12, color: Colour.white),
              cursorHeight: 16,
              keyboardType: textInputType ?? TextInputType.text,
              cursorColor: Colour.white,
              cursorRadius: const Radius.circular(5),
              onTap: onTap,
              onChanged: onChange,
              onTapOutside: onTapOutside,
              onEditingComplete: onEditingComplete,
              maxLength: maxLength,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                filled: filled ?? false,
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colour.grey11),
                prefixIcon: prefixLabel != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 15, top: 13),
                        child: Text(
                          prefixLabel!,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colour.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : null,
                suffixIcon: suffixLabel != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 15, top: 13),
                        child: Text(
                          suffixLabel!,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colour.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colour.black11)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colour.yellow)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
