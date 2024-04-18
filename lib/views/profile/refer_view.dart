import 'package:ebike_flutter/utils/colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReferFriendView extends StatelessWidget {
  const ReferFriendView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Refer Friends & Earn Up to ',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    TextSpan(
                      text: 'RM200 ',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.yellow,
                      ),
                    ),
                    TextSpan(
                      text: 'Rewards',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset('assets/images/hangout.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text('My Referral'),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colour.blackBottomNavBar,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('My Commision'),
                    const Text('RM800'),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colour.grey14,
                            border: Border.all(
                              color: Colors.yellow,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: const Text(
                            'Pay Installment',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colour.grey14,
                            border: Border.all(
                              color: Colors.yellow,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: const Text(
                            'Cash Out',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
