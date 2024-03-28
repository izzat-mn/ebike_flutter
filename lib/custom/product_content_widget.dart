import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Container productContentWidget(
  BuildContext context,
  bool isColumn, {
  bool? isCenter,
  double? width,
  String? assetName,
  String? title,
  String? subTitle,
  double? fontSize,
}) {
  return Container(
    width: width,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colour.black11,
    ),
    child: isColumn
        ? Column(
            crossAxisAlignment: isCenter != null && isCenter
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colour.yellow07,
                maxRadius: 18,
                child: Image.asset(
                  assetName ?? 'assets/icons/back.png',
                  height: 15,
                ),
              ),
              if (isCenter == null) const SizedBox(height: 10),
              Text(
                title ?? '',
                maxLines: 2,
                textAlign: isCenter != null && isCenter
                    ? TextAlign.center
                    : TextAlign.start,
                style: TextStyle(
                    color: Colour.white,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize ?? 14),
              ),
              Text(
                subTitle ?? '',
                maxLines: 2,
                style: TextStyle(
                    color: Colour.white,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize ?? 14),
              ),
            ],
          )
        : Row(
            children: [
              CircleAvatar(
                backgroundColor: Colour.yellow07,
                maxRadius: 18,
                child: Image.asset(
                  assetName ?? 'assets/icons/back.png',
                  height: 15,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: TextStyle(
                          color: Colour.white, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      subTitle ?? '',
                      style: TextStyle(
                          color: Colour.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
  );
}

Container productDetailContentWidget(
  BuildContext context,
  bool isColumn, {
  double? width,
  double? height,
  String? assetName,
  String? title,
  String? description,
}) {
  return Container(
    width: width ?? double.infinity,
    height: height,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colour.black11,
    ),
    child: isColumn
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.31,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colour.yellow07,
                      maxRadius: 16,
                      child: Image.asset(
                        assetName ?? 'assets/icons/back.png',
                        height: 12,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title ?? '',
                        maxLines: 2,
                        style: TextStyle(color: Colour.grey11, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  description ?? '',
                  style: TextStyle(
                      color: Colour.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colour.yellow07,
                maxRadius: 16,
                child: Image.asset(
                  assetName ?? 'assets/icons/back.png',
                  height: 12,
                ),
              ),
              Text(
                title ?? '',
                style: TextStyle(color: Colour.grey11, fontSize: 10),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    description ?? '',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colour.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
  );
}
