import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KYCProvider>(context);

    return PageTemplate(
      appBar: AppBar(
        backgroundColor: Colour.black,
        title: Text(
          'Privacy Policy',
          style: TextStyle(
              fontSize: 15, color: Colour.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: backIcon(
          isAppBar: true,
          onTap: () {
            context.pop();
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        height: MediaQuery.of(context).size.height * 0.08,
        child: ElevatedButton(
          onPressed: () {
            context.go('/product_approval');
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colour.yellow)),
          child: Text(
            'Confirm',
            style: TextStyle(
                fontSize: 13, color: Colour.black, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Text(
                  "Long text 1 Long text 12 Long text 13 Long text 14erere Long text 15 Long text 16 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colour.grey11, fontSize: 12)),
              const SizedBox(height: 20),
              Text(
                  "Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colour.grey11, fontSize: 12)),
              const SizedBox(height: 20),
              Text(
                  "Long text 1 Long text 12 Long text 13 Long text 14erere Long text 15 Long text 16 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colour.grey11, fontSize: 12)),
              const SizedBox(height: 20),
              Text(
                  "Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colour.grey11, fontSize: 12)),
              const SizedBox(height: 20),
              Text(
                  "Long text 1 Long text 12 Long text 13 Long text 14erere Long text 15 Long text 16 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colour.grey11, fontSize: 12)),
              const SizedBox(height: 20),
              Text(
                  "Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2, Long Text 2",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colour.grey11, fontSize: 12)),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 20),
          child: Row(
            children: [
              Checkbox(
                  checkColor: Colour.black,
                  activeColor: Colour.yellow,
                  side: BorderSide(color: Colour.grey11, width: 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  value: provider.getAgreePrivacyPolicy,
                  onChanged: (val) {
                    provider.agreePrivacyPolicy(val ?? false);
                  }),
              Expanded(
                child: GestureDetector(
                  child: RichText(
                    text: TextSpan(
                        text: 'I have read and agree to EbikeRTO\'s ',
                        style: TextStyle(color: Colour.grey11, fontSize: 12),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms of Use',
                              style: TextStyle(
                                color: Colour.yellow,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              )),
                          TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                  color: Colour.grey11, fontSize: 12)),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Colour.yellow,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ))
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
