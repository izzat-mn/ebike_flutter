import 'dart:io';

import 'package:ebike_flutter/l10n/l10n.dart';
import 'package:ebike_flutter/providers/providers.dart';
import 'package:ebike_flutter/router.dart';
import 'package:ebike_flutter/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LocaleProvider()),
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
        colorScheme: ColorScheme.light(background: Colour.black),
      ),
      builder: EasyLoading.init(),
    );
  }
}
