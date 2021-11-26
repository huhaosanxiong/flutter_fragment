import 'package:get/route_manager.dart';
import 'package:my_flutter/modules/group/Animation.dart';
import 'package:my_flutter/modules/group/AsyncListView.dart';
import 'package:my_flutter/modules/group/Battery.dart';
import 'package:my_flutter/modules/group/CardDetail.dart';
import 'package:my_flutter/modules/group/CardListView.dart';
import 'package:my_flutter/modules/group/GetIPAddress.dart';
import 'package:my_flutter/modules/group/ShoppingList.dart';
import 'package:my_flutter/modules/group/home.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => MyHomePage(title: "Home"),
    ),
    GetPage(
      name: Routes.PAGE_ANIMATION,
      page: () => FadeTest(title: 'Fade'),
    ),
    GetPage(
      name: Routes.PAGE_ASYNC_LISTVIEW,
      page: () => AsyncListView(),
    ),
    GetPage(
      name: Routes.PAGE_BATTERY,
      page: () => BatteryGetter(),
    ),
    GetPage(
      name: Routes.PAGE_CARDLIST,
      page: () => CardListView(),
    ),
    GetPage(
      name: Routes.PAGE_GETIPADDRESS,
      page: () => GetIPAddress(),
    ),
    GetPage(
      name: Routes.PAGE_SHOPPINGLIST,
      page: () => ShoppingList(
        products: [],
      ),
    ),
    GetPage(
      name: Routes.PAGE_CARD_DETAIL,
      page: () => CardDetailView(),
    )
  ];
}
