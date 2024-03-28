import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KycDetail1 extends StatelessWidget {
  const KycDetail1({super.key});

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
              label: 'Email',
              controller: provider.emailController,
              hintText: 'Email',
            ),
            CustomTextFrom(
              label: 'Address',
              controller: provider.addressController,
              hintText: 'Address',
            ),
            CustomTextFrom(
              label: 'Postcode',
              controller: provider.postcodeController,
              hintText: 'Postcode',
            ),
            CustomTextFrom(
              label: 'City',
              controller: provider.cityController,
              hintText: 'City',
            ),
            CustomTextFrom(
              label: 'State',
              controller: provider.stateController,
              hintText: 'State',
            ),
          ],
        ),
      ),
    );
  }
}
