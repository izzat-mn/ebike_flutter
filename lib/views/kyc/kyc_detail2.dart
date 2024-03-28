import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KycDetail2 extends StatelessWidget {
  const KycDetail2({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KYCProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            CustomTextFrom(
              label: 'Occupation',
              controller: provider.occupationController,
              hintText: 'Occupation',
            ),
            CustomTextFrom(
              label: 'Company Name',
              controller: provider.compNameController,
              hintText: 'Company Name',
            ),
            CustomPhoneForm(
              label: 'Phone Number',
              controller: provider.compMobileNumController,
              onChanged: (phone) {
                provider.compMobileNumController.text = phone.number;
              },
              onCountryChanged: (country) {
                provider.compCountryCodeController.text = country.dialCode;
              },
            ),
            CustomTextFrom(
              label: 'Company Address',
              controller: provider.compAddressController,
              hintText: 'Company Address',
            ),
            CustomTextFrom(
              label: 'Postcode',
              controller: provider.compPostcodeController,
              hintText: 'Postcode',
            ),
            CustomTextFrom(
              label: 'City',
              controller: provider.compCityController,
              hintText: 'City',
            ),
            CustomTextFrom(
              label: 'State',
              controller: provider.compStateController,
              hintText: 'State',
            ),
          ],
        ),
      ),
    );
  }
}
