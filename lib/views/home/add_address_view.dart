import 'dart:developer';

import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/providers/check_out_provider.dart';
import 'package:ebike_flutter/utils/colour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CheckOutProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const Text('personal Informations'),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('Name'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colour.blackBottomNavBar,
            ),
            child: TextField(
              controller: provider.nameController,
              decoration: InputDecoration(
                hintText: "Enter Name",
                hintStyle: TextStyle(color: Colour.lightGrey),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomPhoneForm(
              label: 'Phone Number',
              controller: provider.phoneNumberController,
              onChanged: (phone) {
                provider.phoneNumberController.text = phone.number;
                provider.setCountryCode(phone.countryCode);
              },
              onCountryChanged: (country) {
                provider.setCountryCode('+${country.dialCode}');
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('Address Informations'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('Address'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colour.blackBottomNavBar,
            ),
            child: TextField(
              controller: provider.addressController,
              decoration: InputDecoration(
                hintText: "Enter Address",
                hintStyle: TextStyle(color: Colour.lightGrey),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 20),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('Postcode'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colour.blackBottomNavBar,
            ),
            child: TextField(
              controller: provider.postcodeController,
              decoration: InputDecoration(
                hintText: "Enter Postcode",
                hintStyle: TextStyle(color: Colour.lightGrey),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 20),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('City'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colour.blackBottomNavBar,
            ),
            child: TextField(
              controller: provider.cityController,
              decoration: InputDecoration(
                hintText: "Enter City",
                hintStyle: TextStyle(color: Colour.lightGrey),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 20),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('State'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colour.blackBottomNavBar,
            ),
            child: TextField(
              controller: provider.stateController,
              decoration: InputDecoration(
                hintText: "Enter State",
                hintStyle: TextStyle(color: Colour.lightGrey),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 20),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              // log('try print number : ${provider.phoneNumberController.text}');
              // log('country code ${provider.getCountryCode}');
              await provider.addAddress(
                name: provider.nameController.text,
                number: provider.phoneNumberController.text,
                address: provider.addressController.text,
                postcode: provider.postcodeController.text,
                city: provider.cityController.text,
                state: provider.stateController.text,
              );
              provider.getAddress().then((value) => context.pop());
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.yellow,
              ),
              child: const Center(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
