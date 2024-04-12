import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:ebike_flutter/utils/colour.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HistoryProvider with ChangeNotifier {
  bool _isTransactionTypeSelected = false;
  List<DateTime?> _dates = [];

  List<TempHistory> data = [
    TempHistory(
      title: 'Payment for Jan 24',
      smallTitle: 'FPay',
      price: 'RM520.00',
      date: '23 Jan 2024',
    ),
    TempHistory(
      title: 'Payment for Jan 24',
      smallTitle: 'FPay',
      price: 'RM520.00',
      date: '23 Jan 2024',
    ),
    TempHistory(
      title: 'Payment for Jan 24',
      smallTitle: 'FPay',
      price: 'RM520.00',
      date: '23 Jan 2024',
    ),
    TempHistory(
      title: 'Payment for Jan 24',
      smallTitle: 'FPay',
      price: 'RM520.00',
      date: '23 Jan 2024',
    ),
    TempHistory(
      title: 'Payment for Jan 24',
      smallTitle: 'FPay',
      price: 'RM520.00',
      date: '23 Jan 2024',
    ),
    TempHistory(
      title: 'Payment for Jan 24',
      smallTitle: 'FPay',
      price: 'RM520.00',
      date: '23 Jan 2024',
    ),
    TempHistory(
      title: 'Payment for Jan 24',
      smallTitle: 'FPay',
      price: 'RM520.00',
      date: '23 Jan 2024',
    ),
    TempHistory(
      title: 'Payment for Jan 24',
      smallTitle: 'FPay',
      price: 'RM520.00',
      date: '23 Jan 2024',
    ),
  ];

  void setTransactionTypeSelection(bool val) {
    _isTransactionTypeSelected = val;
    notifyListeners();
  }

  bool get transactionTypeSelected => _isTransactionTypeSelected;

  void setDates(List<DateTime?> date) {
    _dates = date;
    notifyListeners();
  }

  List<DateTime?> get getDates => _dates;

  Future callModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        HistoryProvider provider = Provider.of<HistoryProvider>(context);

        return SizedBox(
          height: 650,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Transaction History Filter'),
                        IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.close_sharp),
                        ),
                      ],
                    ),
                    const Text('Transaction Type'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                provider.setTransactionTypeSelection(false);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: provider.transactionTypeSelected
                                      ? Colour.grey13
                                      : Colour.grey14,
                                  border: Border.all(
                                    color: provider.transactionTypeSelected
                                        ? Colors.transparent
                                        : Colors.yellow,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: const Center(
                                  child: Text(
                                    'FPay',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                provider.setTransactionTypeSelection(true);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: provider.transactionTypeSelected
                                      ? Colour.grey14
                                      : Colour.grey13,
                                  border: Border.all(
                                    color: provider.transactionTypeSelected
                                        ? Colors.yellow
                                        : Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: const Center(
                                  child: Text(
                                    'Manual Transaction',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text('Select Date'),
                    ),
                    CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.range,
                        centerAlignModePicker: true,
                      ),
                      value: provider.getDates,
                      onValueChanged: (dates) {
                        provider.setDates(dates);
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              provider.setDates([]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colour.grey13,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: const Center(
                                child: Text(
                                  'Reset',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                color: Colour.yellow,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: const Center(
                                child: Text(
                                  'Apply',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class TempHistory {
  String? title;
  String? smallTitle;
  String? price;
  String? date;

  TempHistory({this.title, this.smallTitle, this.price, this.date});
}
