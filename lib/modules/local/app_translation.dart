abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_EN': Locales.en_EN,
    'zh_CN': Locales.zh_CN,
    'fr_CA': Locales.zh_CN,
  };
}

abstract class LocaleKeys {
  static const buttons_login = 'buttons_login';
  static const buttons_sign_in = 'buttons_sign_in';
  static const buttons_logout = 'buttons_logout';
  static const buttons_change_zh = 'change_zh-CN';
  static const buttons_change_en = 'change_en_EN';
  static const shopping_list = 'shopping_list';
  static const animation = 'animation';
  static const async_listview = 'async_listview';
  static const get_ip = 'get_ip';
  static const get_battery = 'get_battery';
  static const card_listview = 'card_listview';
  static const fluter_call_native = 'flutter_call_native';
}

abstract class Locales {
  static const en_EN = {
    LocaleKeys.buttons_login: 'Login',
    LocaleKeys.buttons_sign_in: 'Sign-in',
    LocaleKeys.buttons_logout: 'Logout',
    LocaleKeys.buttons_change_zh: 'change Chinese',
    LocaleKeys.buttons_change_en: 'change English',
    LocaleKeys.shopping_list: 'shopping list',
    LocaleKeys.get_ip: 'get ip',
    LocaleKeys.animation: 'animation',
    LocaleKeys.async_listview: 'async listview',
    LocaleKeys.get_battery: 'get battery',
    LocaleKeys.card_listview: 'card listview',
    LocaleKeys.fluter_call_native: 'fluter call native',
  };
  static const zh_CN = {
    LocaleKeys.buttons_login: '登录',
    LocaleKeys.buttons_sign_in: '注册',
    LocaleKeys.buttons_logout: '退出',
    LocaleKeys.buttons_change_zh: '切换中文',
    LocaleKeys.buttons_change_en: '切换英文',
    LocaleKeys.shopping_list: '购物列表',
    LocaleKeys.get_ip: '获取IP',
    LocaleKeys.animation: '渐变动画',
    LocaleKeys.async_listview: '异步加载列表',
    LocaleKeys.get_battery: '获取电池电量',
    LocaleKeys.card_listview: '卡片列表',
    LocaleKeys.fluter_call_native: 'flutter 调用原生',
  };

  static const fr_CA = {};
}
