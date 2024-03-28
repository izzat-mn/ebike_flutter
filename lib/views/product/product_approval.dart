import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductApproval extends StatelessWidget {
  const ProductApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      appBar: AppBar(
        backgroundColor: Colour.black,
        leading: Container(),
        actions: [
          CircleAvatar(
            maxRadius: 18,
            backgroundColor: Colour.yellow07,
            child: Image.asset('assets/icons/help.png', width: 20),
          ),
          const SizedBox(width: 20),
        ],
      ),
      children: [
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset('assets/images/container_one.png'),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colour.yellow)),
                      child: Text(
                        'Close',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colour.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 45,
                        backgroundColor: Colour.black05,
                        child: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colour.yellow05,
                          child: Image.asset('assets/icons/approval.png',
                              height: 30),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Pending For Approval',
                        style: TextStyle(
                          color: Colour.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                            textAlign: TextAlign.center,
                            "Your RTO application for Startron Mini X pending for approval. We will notify once we verified.",
                            style:
                                TextStyle(color: Colour.grey11, fontSize: 12)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.298),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    20,
                    (index) => Row(
                      children: [
                        Container(
                          height: 2,
                          width: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: Colour.black11,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.33,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        textAlign: TextAlign.center,
                        "Request Application For",
                        style: TextStyle(color: Colour.grey11, fontSize: 12)),
                    const SizedBox(height: 10),
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colour.black,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colour.blackBottomNavBar,
                            ),
                            child: Image.asset(
                                'assets/images/product_scooter.png'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Startron Mini X',
                                style: TextStyle(
                                  color: Colour.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                  textAlign: TextAlign.center,
                                  "12 Months, RM520",
                                  style: TextStyle(
                                      color: Colour.grey11, fontSize: 12)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
