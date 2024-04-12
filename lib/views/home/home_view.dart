import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/providers/check_out_provider.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late AppLocalizations local;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    local = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      padding: const EdgeInsets.symmetric(vertical: 42.0, horizontal: 24),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colour.yellow07,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                context.go('/check_out');
              },
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundColor: Colour.yellow,
                        child: Icon(Icons.badge_outlined, color: Colour.black),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Please complete your KYC by upload your photo for verification',
                            style:
                                TextStyle(color: Colour.grey06, fontSize: 10),
                          ),
                          Text(
                            'Upload Now',
                            style:
                                TextStyle(color: Colour.yellow, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, Angela',
                  style: TextStyle(
                      color: Colour.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(color: Colour.grey11, fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Colour.yellow07,
                    child: Icon(Icons.add_alert_rounded, color: Colour.yellow),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colour.yellow07,
                  child:
                      Icon(Icons.support_agent_rounded, color: Colour.yellow),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        ImageSlideShow(
          height: 150,
          isLoop: true,
          children: List.generate(
            3,
            (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/bird.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          local.choose_your_type,
          style: TextStyle(
            color: Colour.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: List.generate(
            2,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: const EdgeInsets.only(bottom: 13),
                    decoration: index == 0
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(44),
                            border: Border.all(
                              color: Colour.yellow,
                              width: 1,
                            ),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(44),
                            color: Colour.grey13,
                          ),
                    child: Row(
                      children: [
                        Icon(Icons.electric_scooter_rounded,
                            color: index == 0 ? Colour.yellow : Colour.grey09),
                        const SizedBox(width: 3),
                        Text(
                          'Scooter',
                          style: TextStyle(
                            color: index == 0 ? Colour.yellow : Colour.grey09,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index == 1)
                    Positioned(
                      left: 20,
                      top: 30,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          color: Colour.yellow,
                        ),
                        child: const Text(
                          'Coming Soon',
                          style: TextStyle(fontSize: 7),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Featured',
          style: TextStyle(
            color: Colour.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colour.grey12,
                          width: 1,
                        ),
                      ),
                      child: SizedBox(
                        width: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/bird.png',
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Startron Mini X',
                              style:
                                  TextStyle(fontSize: 10, color: Colour.white),
                            ),
                            const SizedBox(height: 10),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: List.generate(
                            //     1,
                            //     (i) => Container(
                            //       width: MediaQuery.of(context).size.width *
                            //           (index.isOdd ? 0.31 : 0.15),
                            //       padding: const EdgeInsets.symmetric(
                            //           vertical: 6, horizontal: 11),
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(5),
                            //         color: Colour.black11,
                            //       ),
                            //       child: Column(
                            //         children: [
                            //           Text(
                            //             '12 Months',
                            //             style: TextStyle(
                            //                 fontSize: 6,
                            //                 color: Colour.grey08,
                            //                 height: 0.3),
                            //           ),
                            //           Text(
                            //             'RM520',
                            //             style: TextStyle(
                            //                 fontSize: 10,
                            //                 color: Colour.yellow,
                            //                 fontWeight: FontWeight.w600),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 35,
                      bottom: 5,
                      child: GestureDetector(
                        onTap: () {
                          context.go('/product');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colour.yellow,
                          ),
                          child: const Text(
                            'View Details',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
