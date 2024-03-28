import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:ebike_flutter/views/kyc/kyc_detail1.dart';
import 'package:ebike_flutter/views/kyc/kyc_detail2.dart';
import 'package:ebike_flutter/views/kyc/kyc_detail3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class KYC extends StatelessWidget {
  const KYC({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KYCProvider>(context);

    return PageTemplate(
      appBar: AppBar(
        backgroundColor: Colour.black,
        title: Text(
          provider.getPageViewIndex == 0
              ? 'Personal Informations'
              : provider.getPageViewIndex == 1
                  ? 'Company Information'
                  : 'Emergency Contact',
          style: TextStyle(
              fontSize: 15, color: Colour.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: backIcon(
          isAppBar: true,
          onTap: () {
            provider.setPageViewIndex(0);
            context.pop();
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Row(
                children: [
                  Container(
                    height: 5,
                    width: 30,
                    margin: EdgeInsets.only(right: index < 2 ? 7 : 0),
                    decoration: BoxDecoration(
                      color: provider.getPageViewIndex == index
                          ? Colour.yellow
                          : Colour.black11,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: provider.setPageViewIndex,
              controller: provider.pageController,
              children: const [
                KycDetail1(),
                KycDetail2(),
                KycDetail3(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
        height: MediaQuery.of(context).size.height * 0.10,
        decoration: BoxDecoration(
          color: Colour.black,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (provider.getPageViewIndex != 0)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    provider.pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colour.black11)),
                  child: Text(
                    'Previous',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colour.grey11,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  (provider.getPageViewIndex != 0 ? 0.4 : 0.8),
              child: ElevatedButton(
                onPressed: () {
                  if (provider.getPageViewIndex == 2) {
                    context.push('/kyc_verification');
                  } else {
                    provider.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colour.yellow)),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colour.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
