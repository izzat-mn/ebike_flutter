import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class MyBikeProvider with ChangeNotifier {
  bool _isBatterySelected = false;
  bool _isTimeStart = false;
  bool _isRestart = false;

  List<TempSchedule> data = [
    TempSchedule(
      paymentDetail: 'paid',
      info: 'on 16 May 2024 by FPay',
      month: 'May',
      year: '2024',
    ),
    TempSchedule(
      paymentDetail: 'paid',
      info: 'on 16 May 2024 by FPay',
      month: 'May',
      year: '2024',
    ),
    TempSchedule(
      paymentDetail: 'paid',
      info: 'on 16 May 2024 by FPay',
      month: 'May',
      year: '2024',
    ),
    TempSchedule(
      paymentDetail: 'paid',
      info: 'on 16 May 2024 by FPay',
      month: 'May',
      year: '2024',
    ),
    TempSchedule(
      paymentDetail: 'paid',
      info: 'on 16 May 2024 by FPay',
      month: 'May',
      year: '2024',
    ),
    TempSchedule(
      paymentDetail: 'paid',
      info: 'on 16 May 2024 by FPay',
      month: 'May',
      year: '2024',
    ),
    TempSchedule(
      paymentDetail: 'paid',
      info: 'on 16 May 2024 by FPay',
      month: 'May',
      year: '2024',
    ),
    TempSchedule(
      paymentDetail: 'paid',
      info: 'on 16 May 2024 by FPay',
      month: 'May',
      year: '2024',
    ),
  ];

  final stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  ).setPresetHoursTime(5);

  void setBatterySelected(bool val) {
    _isBatterySelected = val;
    notifyListeners();
  }

  bool get batterySelected => _isBatterySelected;

  void setIsTimeStart(bool val) {
    _isTimeStart = val;
    notifyListeners();
  }

  bool get getIsTimeStart => _isTimeStart;

  void setIsRestart(bool val) {
    _isRestart = val;
    notifyListeners();
  }

  bool get getIsRestart => _isRestart;
}

class TempSchedule {
  String? month;
  String? year;
  String? paymentDetail;
  String? info;

  TempSchedule({this.month, this.year, this.paymentDetail, this.info});
}
