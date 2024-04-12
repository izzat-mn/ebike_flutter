import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneForm extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Function(PhoneNumber)? onChanged;
  final Function(Country)? onCountryChanged;

  const CustomPhoneForm(
      {super.key,
      this.label,
      this.controller,
      this.onChanged,
      this.onCountryChanged});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();

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
                    style: TextStyle(fontSize: 12, color: Colour.grey11),
                  ),
                )
              : Container(),
          SizedBox(
            height: 46,
            child: IntlPhoneField(
              flagsButtonPadding: const EdgeInsets.only(left: 10),
              focusNode: focusNode,
              initialCountryCode: 'MY',
              controller: controller,
              showCountryFlag: false,
              cursorColor: Colour.white,
              cursorHeight: 16,
              cursorRadius: const Radius.circular(5),
              dropdownIconPosition: IconPosition.trailing,
              dropdownIcon: Icon(
                Icons.arrow_drop_down_rounded,
                size: 25,
                color: Colour.grey11,
              ),
              dropdownTextStyle: TextStyle(
                fontSize: 12,
                color: Colour.white,
              ),
              style: TextStyle(fontSize: 12, color: Colour.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                hintText: 'Mobile Number',
                hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colour.grey11),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colour.black11)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colour.yellow)),
              ),
              languageCode: "en",
              disableLengthCheck: true,
              onChanged: onChanged,
              onCountryChanged: onCountryChanged,
              pickerDialogStyle: PickerDialogStyle(
                countryNameStyle: TextStyle(color: Colour.white),
                countryCodeStyle: TextStyle(color: Colour.white),
                searchFieldCursorColor: Colour.white,
                backgroundColor: Colour.blackBottomNavBar,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
