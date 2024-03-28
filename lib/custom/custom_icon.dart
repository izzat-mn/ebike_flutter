import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';

GestureDetector backIcon({Function()? onTap, String? title, bool? isAppBar}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: isAppBar == true
          ? const EdgeInsets.only(left: 10)
          : const EdgeInsets.all(10),
      padding:
          EdgeInsets.only(top: isAppBar == true ? 0 : 10, left: 10, right: 10),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/back.png',
            height: 15,
          ),
          if (title != null)
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    title,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colour.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
