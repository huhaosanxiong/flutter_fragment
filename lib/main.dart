import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter/modules/group/home.dart';
import 'package:my_flutter/modules/local/app_translation.dart';
import 'package:my_flutter/routes/app_pages.dart';
import 'http.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      locale: Locale('zh', ''),
      fallbackLocale: Locale('en', ''),
      defaultTransition: Transition.fadeIn,
      translationsKeys: AppTranslation.translations,

      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      home: MyHomePage(
        title: 'Flutter Demo',
      ),
      // routes: <String, WidgetBuilder>{
      //   '/ShoppingList': (BuildContext context) => ShoppingList(products: []),
      //   '/Fade Demo': (BuildContext context) => FadeTest(title: 'Fade'),
      //   '/AsyncListView': (BuildContext context) => AsyncListView(),
      //   '/GetIPAddress': (BuildContext context) => GetIPAddress(),
      //   '/GetBattery': (BuildContext context) => BatteryGetter(),
      //   '/CardListView': (BuildContext context) => CardListView(),
      // },
    );
  }
}
