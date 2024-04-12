import 'package:ebike_flutter/providers/order_provider.dart';
import 'package:ebike_flutter/utils/colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    OrderProvider provider = Provider.of<OrderProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 24,
            right: 24,
            bottom: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/help2.png',
                    width: 35,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: provider.orderSelection.map((e) {
                    int index = provider.orderSelection.indexOf(e);

                    return Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          provider.setIsSelectedIndex = index;
                        },
                        child: Text(
                          e,
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                color: provider.getIsSelectedIndex == index
                                    ? Colors.yellow
                                    : Colors.grey,
                                offset: const Offset(0, -10),
                              ),
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                provider.getIsSelectedIndex == index
                                    ? Colors.yellow
                                    : Colors.transparent,
                            decorationThickness: 3,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              provider.getIsSelectedIndex == 0
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text('Startron Mini X'),
                          ),
                          const Text(
                            'order ID: EB103826',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                children: List.generate(3, (index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/icons/check.png'),
                                          Image.asset(
                                            'assets/icons/history.png',
                                            width: 50,
                                          ),
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Order Placed'),
                                              Text(
                                                'We have recieved your order.',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            '16 Mar 2024',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      if (index < 2)
                                        const Padding(
                                          padding: EdgeInsets.only(left: 3.0),
                                          child: SizedBox(
                                            height: 45,
                                            child: VerticalDivider(
                                              color: Colors.yellow,
                                            ),
                                          ),
                                        )
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Order Received',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            4,
                            (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height:
                                      provider.getSelectedHistoryIndex == index
                                          ? 400
                                          : 80,
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    color: Colour.blackBottomNavBar,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 15),
                                                  width: 50,
                                                  height: 50,
                                                  color: Colors.black,
                                                ),
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Startron Mini X'),
                                                    Text(
                                                      'Delivered on 21 Mar 2024',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Colour.greyYelllow,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Text(
                                                'Completed',
                                                style: TextStyle(
                                                    color: Colors.yellow),
                                              ),
                                            ),
                                          ],
                                        ),
                                        provider.getSelectedHistoryIndex ==
                                                index
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 20.0),
                                                    child: Text(
                                                        'Delivery Address'),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5.0),
                                                    child: Text(
                                                      'Angelababy Yong Yi | +6018 388 8888',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5.0),
                                                    child: Text(
                                                      '26, Jalan Hujan Rahmat 3, Taman Overseas Union, 58200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur.',
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colour.black12,
                                                    ),
                                                    child: const Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Order ID',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            Text(
                                                              'EB103826',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                            color: Colors.grey),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Payment Method',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            Text(
                                                              'FPay',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                            color: Colors.grey),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Order On',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            Text(
                                                              '16 Mar 2024',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                            color: Colors.grey),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Payment On',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            Text(
                                                              'EB103826',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                            color: Colors.grey),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Ship On',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            Text(
                                                              'EB103826',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                            color: Colors.grey),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Completed On',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                            Text(
                                                              'EB103826',
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.setSelectedHistoryIndex = index;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colour.darkGrey,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Show Details',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Icon(
                                          provider.getSelectedHistoryIndex ==
                                                  index
                                              ? Icons.keyboard_arrow_up_sharp
                                              : Icons.keyboard_arrow_down_sharp,
                                          color: Colors.yellow,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ).toList(),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
