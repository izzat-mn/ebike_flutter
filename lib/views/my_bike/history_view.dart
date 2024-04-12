import 'package:ebike_flutter/providers/history_provider.dart';
import 'package:ebike_flutter/utils/colour.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryProvider provider = Provider.of<HistoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                await provider.callModalBottomSheet(context);
              },
              child: Image.asset(
                'assets/icons/date_setting.png',
                width: 35,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              children: provider.data
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colour.blackBottomNavBar,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(e.title!),
                              ),
                              Text(
                                e.smallTitle!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Text(e.price!),
                              ),
                              Text(
                                e.date!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
