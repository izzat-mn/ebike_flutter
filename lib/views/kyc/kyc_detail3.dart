import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KycDetail3 extends StatelessWidget {
  const KycDetail3({super.key});

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
            Text(
              'Emergency Contact 1',
              style: TextStyle(
                fontSize: 12,
                color: Colour.white,
              ),
            ),
            CustomTextFrom(
              label: 'Name',
              controller: provider.emergContOneNameController,
              hintText: 'Name',
            ),
            CustomPhoneForm(
              label: 'Phone Number',
              controller: provider.emergContOneMobileNumController,
              onChanged: (phone) {
                provider.emergContOneMobileNumController.text = phone.number;
              },
              onCountryChanged: (country) {
                provider.emergContOneCountryCodeController.text =
                    country.dialCode;
              },
            ),
            CustomTextFrom(
              label: 'Relationship',
              controller: provider.emergContOneRelationshipController,
              hintText: 'Relationship',
            ),
            const SizedBox(height: 20),
            Text(
              'Emergency Contact 2',
              style: TextStyle(
                fontSize: 12,
                color: Colour.white,
              ),
            ),
            CustomTextFrom(
              label: 'Name',
              controller: provider.emergContTwoNameController,
              hintText: 'Name',
            ),
            CustomPhoneForm(
              label: 'Phone Number',
              controller: provider.emergContTwoMobileNumController,
              onChanged: (phone) {
                provider.emergContTwoMobileNumController.text = phone.number;
              },
              onCountryChanged: (country) {
                provider.emergContTwoCountryCodeController.text =
                    country.dialCode;
              },
            ),
            CustomTextFrom(
              label: 'Relationship',
              controller: provider.emergContTwoRelationshipController,
              hintText: 'Relationship',
            ),
            const SizedBox(height: 20),
            Text(
              'Emergency Contact 3',
              style: TextStyle(
                fontSize: 12,
                color: Colour.white,
              ),
            ),
            CustomTextFrom(
              label: 'Name',
              controller: provider.emergContThreeNameController,
              hintText: 'Name',
            ),
            CustomPhoneForm(
              label: 'Phone Number',
              controller: provider.emergContThreeMobileNumController,
              onChanged: (phone) {
                provider.emergContThreeMobileNumController.text = phone.number;
              },
              onCountryChanged: (country) {
                provider.emergContThreeCountryCodeController.text =
                    country.dialCode;
              },
            ),
            CustomTextFrom(
              label: 'Relationship',
              controller: provider.emergContThreeRelationshipController,
              hintText: 'Relationship',
            ),
          ],
        ),
      ),
    );
  }
}
