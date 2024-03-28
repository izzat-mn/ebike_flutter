import 'package:ebike_flutter/providers/providers.dart';
import 'package:ebike_flutter/router.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
          ChangeNotifierProvider(create: (context) => KYCProvider()),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Routers.router.routeInformationParser,
      routeInformationProvider: Routers.router.routeInformationProvider,
      routerDelegate: Routers.router.routerDelegate,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(background: Colour.black),
      ),
      builder: EasyLoading.init(),
    );
  }
}
