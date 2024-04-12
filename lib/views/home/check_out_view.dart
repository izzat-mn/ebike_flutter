import 'package:ebike_flutter/providers/check_out_provider.dart';
import 'package:ebike_flutter/utils/colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late CheckOutProvider provider;

  @override
  void initState() {
    super.initState();
    Provider.of<CheckOutProvider>(context, listen: false).getAddress();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<CheckOutProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 70,
                            height: 70,
                            color: Colors.black,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text('Startron Mini X'),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colour.greyYelllow,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Scooter',
                                    style: TextStyle(
                                        color: Colors.yellow, fontSize: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text('Applications Details'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colour.blackBottomNavBar,
                        ),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Upfront Payment'),
                                  Text('RM1000'),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Tenure'),
                                  Text('12 Months'),
                                ],
                              ),
                            ),
                            Divider(),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Monthly Rental'),
                                  Text('RM1000'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text('Referral Code'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colour.blackBottomNavBar,
                        ),
                        child: TextField(
                          controller: provider.referralCodeController,
                          decoration: InputDecoration(
                            hintText: "Enter Referral Code",
                            hintStyle: TextStyle(color: Colour.lightGrey),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 20),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text('Collection Method'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text(
                          'Free delivery for KL & Selangor, out of this area will charge Rm180.00 for delivery fees.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colour.grey11,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                provider.setIsDeliverySelected(false);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: provider.isDeliverySelected
                                      ? Colour.grey13
                                      : Colour.grey14,
                                  border: Border.all(
                                    color: provider.isDeliverySelected
                                        ? Colors.transparent
                                        : Colors.yellow,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                child: const Text(
                                  'Delivery',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                provider.setIsDeliverySelected(true);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: provider.isDeliverySelected
                                      ? Colour.grey14
                                      : Colour.grey13,
                                  border: Border.all(
                                    color: provider.isDeliverySelected
                                        ? Colors.yellow
                                        : Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                child: const Text(
                                  'Pick Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20.0),
                        child: Column(
                          children: provider.isDeliverySelected
                              ? [
                                  CheckOutProvider.pickUpAddressList.isNotEmpty
                                      ? Column(
                                          children: CheckOutProvider
                                              .pickUpAddressList
                                              .map(
                                                (e) => Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colour
                                                        .blackBottomNavBar,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 8.0,
                                                        ),
                                                        child: Radio.adaptive(
                                                          value: e,
                                                          groupValue: provider
                                                              .radioButtonPickUpGroupValue,
                                                          onChanged: (value) {
                                                            provider
                                                                .setPickUpRadioButtonGroupValue(
                                                                    value!);
                                                          },
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          5.0),
                                                              child: Text(
                                                                  e.branch!),
                                                            ),
                                                            Text(
                                                              e.address!,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        )
                                      : Container()
                                ]
                              : [
                                  provider.getDeliveryAddressList.isNotEmpty
                                      ? Column(
                                          children: provider
                                              .getDeliveryAddressList
                                              .map(
                                                (e) => Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colour
                                                        .blackBottomNavBar,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          right: 8.0,
                                                        ),
                                                        child: Radio.adaptive(
                                                          value: e,
                                                          groupValue: provider
                                                              .radioButtonGroupValue,
                                                          onChanged: (value) {
                                                            provider
                                                                .setRadioButtonGroupValue(
                                                                    value!);
                                                          },
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          5.0),
                                                              child: Text(
                                                                  '${e.name} | ${e.contact}'),
                                                            ),
                                                            Text(
                                                              e.address,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        )
                                      : Container(),
                                  GestureDetector(
                                    onTap: () {
                                      context.push('/add_address');
                                    },
                                    child: const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Icon(
                                            Icons.add_circle_outline_outlined,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Text(
                                          'Add New Address',
                                          style:
                                              TextStyle(color: Colors.yellow),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
