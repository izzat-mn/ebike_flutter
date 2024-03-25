import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 42.0, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colour.grey12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
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
                                  style: TextStyle(color: Colour.grey06, fontSize: 10),
                                ),
                                Text(
                                  'Upload Now',
                                  style: TextStyle(color: Colour.yellow, fontSize: 10),
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
                        style: TextStyle(color: Colour.white, fontSize: 16, fontWeight: FontWeight.bold),
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
                          backgroundColor: Colour.grey12,
                          child: Icon(Icons.add_alert_rounded, color: Colour.yellow),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colour.grey12,
                        child: Icon(Icons.support_agent_rounded, color: Colour.yellow),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
