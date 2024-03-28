import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final kycProvider = Provider.of<KYCProvider>(context);

    return PageTemplate(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        height: MediaQuery.of(context).size.height * 0.08,
        child: ElevatedButton(
          onPressed: () {
            kycProvider.setPageViewIndex(0);
            context.push('/kyc');
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colour.yellow)),
          child: Text(
            'Checkout',
            style: TextStyle(
                fontSize: 13, color: Colour.black, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/product_background.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.only(top: 30, left: 30, right: 50),
              child: Image.asset(
                'assets/images/product_scooter.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            backIcon(
                onTap: () {
                  kycProvider.setPageViewIndex(0);
                  context.pop();
                },
                title: 'Startron Mini X'),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productDetailContentWidget(
                    context,
                    false,
                    assetName: 'assets/icons/upfront_payment.png',
                    title: 'Upfront Payment',
                    description: 'RM1,000',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      productDetailContentWidget(
                        context,
                        true,
                        width: MediaQuery.of(context).size.width * 0.42,
                        height:
                            (MediaQuery.of(context).size.height * 0.18) + 10,
                        assetName: 'assets/icons/monthly_installment.png',
                        title: 'Monthly Installment',
                        description: 'RM520',
                      ),
                      Column(
                        children: [
                          productDetailContentWidget(
                            context,
                            true,
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.09,
                            assetName: 'assets/icons/tenure.png',
                            title: 'Tenure',
                            description: '12 Months',
                          ),
                          productDetailContentWidget(
                            context,
                            true,
                            width: MediaQuery.of(context).size.width * 0.42,
                            height: MediaQuery.of(context).size.height * 0.09,
                            assetName: 'assets/icons/loan_due.png',
                            title: 'Loan Due',
                            description: '26/10/2024',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
