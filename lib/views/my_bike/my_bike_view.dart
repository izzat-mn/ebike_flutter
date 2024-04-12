import 'package:animated_battery_gauge/animated_battery_gauge.dart';
import 'package:animated_battery_gauge/battery_gauge.dart';
import 'package:ebike_flutter/utils/colour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import '../../providers/providers.dart';

class MyBikeView extends StatefulWidget {
  const MyBikeView({super.key});

  @override
  State<MyBikeView> createState() => _MyBikeViewState();
}

class _MyBikeViewState extends State<MyBikeView> {
  late final StopWatchTimer _stopWatchTimer;
  late MyBikeProvider provider;

  @override
  void initState() {
    super.initState();
    _stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
    ); // Create instance.
    _stopWatchTimer.setPresetHoursTime(5);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<MyBikeProvider>(context);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'My Bike',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              context.go('/history');
                            },
                            child: Image.asset(
                              'assets/icons/history.png',
                              width: 35,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/icons/help2.png',
                            width: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    'Charging Timer',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'Remember to click when start charging, we will notify when fully charged.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          provider.setBatterySelected(false);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: provider.batterySelected
                                ? Colour.grey13
                                : Colour.grey14,
                            border: Border.all(
                              color: provider.batterySelected
                                  ? Colors.transparent
                                  : Colors.yellow,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          child: const Text(
                            'Battery 1',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.setBatterySelected(true);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: provider.batterySelected
                                ? Colour.grey14
                                : Colour.grey13,
                            border: Border.all(
                              color: provider.batterySelected
                                  ? Colors.yellow
                                  : Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          child: const Text(
                            'Battery 2',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colour.blackBottomNavBar,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/icons/clock.png',
                                  width: 15,
                                ),
                              ),
                              StreamBuilder<int>(
                                stream: _stopWatchTimer.rawTime,
                                initialData: _stopWatchTimer.rawTime.value,
                                builder: (context, snap) {
                                  final value = snap.data!;
                                  final displayTime =
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    milliSecond: false,
                                  );

                                  String hours = displayTime.substring(0, 2);

                                  String minutes = displayTime.substring(3, 5);

                                  String seconds = displayTime.substring(6);

                                  return Row(
                                    children: <Widget>[
                                      Text(
                                        hours,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        ':',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        minutes,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        ':',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        seconds,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontFamily: 'Helvetica',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: provider.getIsTimeStart
                                      ? AnimatedBatteryGauge(
                                          duration: const Duration(hours: 5),
                                          value: 100,
                                          size: const Size(160, 40),
                                          borderColor: Colour.grey15,
                                          valueColor: Colour.yellow,
                                          mode: BatteryGaugePaintMode.gauge,
                                          hasText: true,
                                        )
                                      : provider.getIsRestart
                                          ? AnimatedBatteryGauge(
                                              duration: const Duration(
                                                  milliseconds: 0),
                                              value: 0,
                                              size: const Size(160, 40),
                                              borderColor: Colour.grey15,
                                              valueColor: Colors.transparent,
                                              mode: BatteryGaugePaintMode.gauge,
                                              hasText: true,
                                            )
                                          : AnimatedBatteryGauge(
                                              duration: const Duration(
                                                  milliseconds: 0),
                                              value: 0,
                                              size: const Size(160, 40),
                                              borderColor: Colour.grey15,
                                              valueColor: Colors.transparent,
                                              mode: BatteryGaugePaintMode.gauge,
                                              hasText: true,
                                            ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      _stopWatchTimer.onResetTimer();
                                      provider.setIsRestart(true);
                                      provider.setIsTimeStart(false);
                                    },
                                    child: Image.asset(
                                      'assets/icons/reset.png',
                                      width: 50,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _stopWatchTimer.onStartTimer();
                                    provider.setIsTimeStart(true);
                                    provider.setIsRestart(false);
                                  },
                                  child: Image.asset(
                                    'assets/icons/start.png',
                                    width: 50,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Startron Mini X',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '12 Months, RM520.00',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colour.blackBottomNavBar,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 30,
                    ),
                    child: Column(
                      children: provider.data.map((e) {
                        int index = provider.data.indexOf(e);

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Column(
                                children: [
                                  Text(
                                    e.month!,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    e.year!,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 5,
                                    left: index == provider.data.length - 1
                                        ? 3
                                        : 0,
                                  ),
                                  height: 10,
                                  width: 10,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.yellow,
                                  ),
                                ),
                                if (index < provider.data.length - 1)
                                  const SizedBox(
                                    height: 60,
                                    child:
                                        VerticalDivider(color: Colors.yellow),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.paymentDetail!,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    e.info!,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
