import 'dart:io';

import 'package:ebike_flutter/l10n/l10n.dart';
import 'package:ebike_flutter/local_save.dart';
import 'package:ebike_flutter/providers/check_out_provider.dart';
import 'package:ebike_flutter/providers/history_provider.dart';
import 'package:ebike_flutter/providers/order_provider.dart';
import 'package:ebike_flutter/providers/profile_provider.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:ebike_flutter/router.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

String appVersion = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appVersion = packageInfo.version;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LocaleProvider()),
          ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
          ChangeNotifierProvider(create: (context) => KYCProvider()),
          ChangeNotifierProvider(create: (context) => MyBikeProvider()),
          ChangeNotifierProvider(create: (context) => HistoryProvider()),
          ChangeNotifierProvider(create: (context) => OrderProvider()),
          ChangeNotifierProvider(create: (context) => CheckOutProvider()),
          ChangeNotifierProvider(create: (context) => ProfileProvider()),
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
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp.router(
      routeInformationParser: Routers.router.routeInformationParser,
      routeInformationProvider: Routers.router.routeInformationProvider,
      routerDelegate: Routers.router.routerDelegate,
      locale: Platform.localeName.isNotEmpty
          ? Locale(Platform.localeName)
          : localeProvider.locale,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colour.black,
        ),
        colorScheme: ColorScheme.dark(
          background: Colour.black,
        ),
      ),
      builder: EasyLoading.init(),
    );
  }
}
