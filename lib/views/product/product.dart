import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 15),
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
          color: Colour.black11,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RM1,000',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colour.yellow,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Upfront Setup Fee',
                    style: TextStyle(fontSize: 12, color: Colour.grey08),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                context.push('/product_detail');
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colour.yellow)),
              child: Text(
                'Rent Now',
                style: TextStyle(
                    fontSize: 13,
                    color: Colour.black,
                    fontWeight: FontWeight.w700),
              ),
            )),
          ],
        ),
      ),
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/product_background.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/images/product_name.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/images/product_item.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            backIcon(onTap: () {
              context.pop();
            }),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          productContentWidget(
                            context,
                            true,
                            width: MediaQuery.of(context).size.width * 0.42,
                            assetName: 'assets/icons/top_speed.png',
                            title: '25 km/h',
                            subTitle: 'Top Speed',
                          ),
                          productContentWidget(
                            context,
                            false,
                            width: MediaQuery.of(context).size.width * 0.42,
                            assetName: 'assets/icons/max_load.png',
                            title: '120 kg',
                            subTitle: 'Max Load',
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          productContentWidget(
                            context,
                            false,
                            width: MediaQuery.of(context).size.width * 0.42,
                            assetName: 'assets/icons/range.png',
                            title: '25 km/h',
                            subTitle: 'Top Speed',
                          ),
                          productContentWidget(
                            context,
                            true,
                            width: MediaQuery.of(context).size.width * 0.42,
                            assetName: 'assets/icons/hours_charging.png',
                            title: '120 kg',
                            subTitle: 'Max Load',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      productContentWidget(
                        context,
                        true,
                        isCenter: true,
                        width: MediaQuery.of(context).size.width * 0.27,
                        assetName:
                            'assets/icons/honeycomb_punctureless_tyre.png',
                        title: 'Honeycomb Punctureless Tyre',
                        subTitle: '',
                        fontSize: 8,
                      ),
                      productContentWidget(
                        context,
                        true,
                        isCenter: true,
                        width: MediaQuery.of(context).size.width * 0.27,
                        assetName: 'assets/icons/front_fork_suspension.png',
                        title: 'Front Fork Suspension',
                        fontSize: 8,
                      ),
                      productContentWidget(
                        context,
                        true,
                        isCenter: true,
                        width: MediaQuery.of(context).size.width * 0.27,
                        assetName: 'assets/icons/bluetooth_application.png',
                        title: 'Bluethooth Application',
                        fontSize: 8,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Startron Mini X',
                    style: TextStyle(
                      color: Colour.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Installment Plan',
                    style: TextStyle(color: Colour.grey11, fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      2,
                      (i) => Container(
                        width: MediaQuery.of(context).size.width * 0.41,
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 11),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44),
                          color: i == 0 ? Colour.yellow07 : Colour.black11,
                          border: Border.all(
                            color: i == 0 ? Colour.yellow : Colour.black11,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'RM520',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colour.yellow,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '12 Months',
                              style:
                                  TextStyle(fontSize: 10, color: Colour.grey08),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
