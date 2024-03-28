import 'dart:io';

import 'package:ebike_flutter/custom/custom.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class KycVerification extends StatelessWidget {
  const KycVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KYCProvider>(context);

    return PageTemplate(
      appBar: AppBar(
        backgroundColor: Colour.black,
        title: Text(
          'KYC Verification',
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
            context.push('/privacy_policy');
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colour.yellow)),
          child: Text(
            'Submit',
            style: TextStyle(
                fontSize: 13, color: Colour.black, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      children: [
        SizedBox(
          width: double.infinity,
          height: 42.0,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colour.yellow07),
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Image.asset('assets/images/shield_icon.png'),
                ),
                Expanded(
                  child: Text(
                    'Your data and privacy are protected by us.',
                    style: TextStyle(color: Colour.grey06, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'ID Photo',
                    style: TextStyle(
                        color: Colour.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                                color: Colour.black,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        'KYC Sample',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colour.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      'Make sure your photo is not blurry, cut off, or covered by the light',
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colour.grey11, fontSize: 13),
                                    ),
                                    Column(
                                      children: List.generate(
                                        provider.kycSample.length,
                                        (index) => Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Text(
                                                provider.kycSample[index]
                                                        ['name'] ??
                                                    '',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colour.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const SizedBox(height: 10),
                                              Image.asset(
                                                provider.kycSample[index]
                                                        ['image'] ??
                                                    'assets/images/bird.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colour.yellow),
                                        minimumSize:
                                            MaterialStateProperty.all<Size>(
                                          const Size(double.infinity, 40),
                                        ),
                                      ),
                                      child: Text(
                                        'Got It',
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colour.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.info_outline_rounded,
                      color: Colour.grey11,
                      size: 18,
                    ),
                  )
                ],
              ),
              Text(
                'Make sure your photo is not blurry, cut off, or covered by the light',
                maxLines: 2,
                style: TextStyle(color: Colour.grey11, fontSize: 12),
              ),
              Column(
                children: List.generate(
                  provider.imageNeeded.length,
                  (index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              provider.imageNeeded[index]['name'] ?? '',
                              style:
                                  TextStyle(fontSize: 13, color: Colour.white),
                            ),
                          ),
                          if (provider.imageNeeded[index]['description'] != "")
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                provider.imageNeeded[index]['description']!,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colour.grey11, fontSize: 11),
                              ),
                            ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              if ((provider.getFrontIDFile == null &&
                                      index == 0) ||
                                  (provider.getBackIDFile == null &&
                                      index == 1) ||
                                  (provider.getSelfieIDFile == null &&
                                      index == 2) ||
                                  (provider.getAddressFile == null &&
                                      index == 3)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Camera(
                                        isImage: true,
                                        imageCondition:
                                            provider.imageNeeded[index]
                                                    ['condition'] ??
                                                ''),
                                  ),
                                );
                              }
                            },
                            child: (index ==
                                        int.parse(provider.imageNeeded[index]
                                            ['index']!) &&
                                    ((provider.getFrontIDFile != null &&
                                            index == 0) ||
                                        (provider.getBackIDFile != null &&
                                            index == 1) ||
                                        (provider.getSelfieIDFile != null &&
                                            index == 2) ||
                                        (provider.getAddressFile != null &&
                                            index == 3)))
                                ? Stack(
                                    children: [
                                      Image.asset(
                                          'assets/images/capture_image_box.png'),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.21,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 1, vertical: 10),
                                        child: Center(
                                          child: Image.file(index == 0
                                              ? provider.getFrontIDFile!
                                              : index == 1
                                                  ? provider.getBackIDFile!
                                                  : index == 2
                                                      ? provider
                                                          .getSelfieIDFile!
                                                      : provider
                                                          .getAddressFile!),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          height: 40,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.895,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                              bottom: Radius.circular(20),
                                            ),
                                            color:
                                                Colour.black.withOpacity(0.5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    File image = index == 0
                                                        ? provider
                                                            .getFrontIDFile!
                                                        : index == 1
                                                            ? provider
                                                                .getBackIDFile!
                                                            : index == 2
                                                                ? provider
                                                                    .getSelfieIDFile!
                                                                : provider
                                                                    .getAddressFile!;
                                                    await provider
                                                        .deleteImageFile(
                                                            image.path,
                                                            provider.imageNeeded[
                                                                    index]
                                                                ['condition']!);
                                                    if (context.mounted) {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => Camera(
                                                              isImage: true,
                                                              imageCondition:
                                                                  provider.imageNeeded[
                                                                              index]
                                                                          [
                                                                          'condition'] ??
                                                                      ''),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.replay_rounded,
                                                        color: Colour.white,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        'Re-upload',
                                                        style: TextStyle(
                                                            color: Colour.white,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    File image = index == 0
                                                        ? provider
                                                            .getFrontIDFile!
                                                        : index == 1
                                                            ? provider
                                                                .getBackIDFile!
                                                            : index == 2
                                                                ? provider
                                                                    .getSelfieIDFile!
                                                                : provider
                                                                    .getAddressFile!;
                                                    provider.deleteImageFile(
                                                        image.path,
                                                        provider.imageNeeded[
                                                                index]
                                                            ['condition']!);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.delete_rounded,
                                                        color: Colour.red,
                                                        size: 20,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        'Delete',
                                                        style: TextStyle(
                                                            color: Colour.red,
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Image.asset(
                                    'assets/images/capture_image_with_icon_box.png'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
