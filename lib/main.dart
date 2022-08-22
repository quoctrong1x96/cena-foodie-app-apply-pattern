import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'src/data/app_locator.dart';
import 'src/data/services/google/push_notification.dart';
import 'src/ui/blocs/auth/auth_bloc.dart';
import 'src/ui/blocs/cart/cart_bloc.dart';
import 'src/ui/blocs/client_map/map_client_bloc.dart';
import 'src/ui/blocs/client_store/client_store_bloc.dart';
import 'src/ui/blocs/delivery/delivery_bloc.dart';
import 'src/ui/blocs/delivery_map/map_delivery_bloc.dart';
import 'src/ui/blocs/general/general_bloc.dart';
import 'src/ui/blocs/my_location/my_location_map_bloc.dart';
import 'src/ui/blocs/order/orders_bloc.dart';
import 'src/ui/blocs/payment/payments_bloc.dart';
import 'src/ui/blocs/product/product_bloc.dart';
import 'src/ui/blocs/store/store_bloc.dart';
import 'src/ui/blocs/user/user_bloc.dart';
import 'src/ui/resources/generated/l10n.dart';
import 'src/utils/configs/cena_themes.dart';
import 'src/utils/constants/route_constants.dart';
import 'src/utils/getx_services/getx_settings_service.dart';
import 'src/utils/log_utils.dart';
import 'src/utils/route_utils.dart';
import 'src/utils/themes/theme_maps.dart';

PushNotification pushNotification = PushNotification();

Future<void> _firebaseMessagingBackground(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future initServices() async {
  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.

  initLocator();
  LogUtils.init();
  await Get.putAsync(() => SettingService().init());
}

/// Main - Run in the first time
///
/// 1. Initialized Firebase [Firebase]
///
/// 2. Initialized [Firebase Messages] - Push notify
///
/// 3. Run app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initServices();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackground);
  pushNotification.initNotification();
  //Save file to phone's local
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(
      const CustomTheme(
        initialThemeKey: MyThemeKeys.light,
        child: MyApp(),
      ),
    ),
    storage: storage,
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    pushNotification.onMessagingListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _systemChromeConfig();
    return MultiBlocProvider(
      providers: _delareBlocProviders,
      child: GestureDetector(
        onTap: hideKeyboard,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CENA FOODIE - FOOD&DRINK DELIVERY',
          // home: const CheckingLoginPage(),
          initialRoute: RouteConstants.check_login,
          onGenerateRoute: RouteUtils.generateRoute,
          theme: CustomTheme.of(context),
          darkTheme: CenaThemes.darkTheme,
          themeMode: ThemeMode.light,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate,
          ],
          locale: Get.find<SettingService>().currentLocate.value,
          supportedLocales: S.delegate.supportedLocales,
        ),
      ),
    );
  }

  void _systemChromeConfig() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  List<BlocProviderSingleChildWidget> get _delareBlocProviders {
    return [
      BlocProvider(create: (context) => AuthBloc()..add(CheckLoginEvent())),
      BlocProvider(create: (context) => GeneralBloc()),
      BlocProvider(create: (context) => ProductsBloc()),
      BlocProvider(create: (context) => CartBloc()),
      BlocProvider(create: (context) => UserBloc()),
      BlocProvider(create: (context) => MyLocationMapBloc()),
      BlocProvider(create: (context) => PaymentsBloc()),
      BlocProvider(create: (context) => OrdersBloc()),
      BlocProvider(create: (context) => DeliveryBloc()),
      BlocProvider(create: (context) => MapDeliveryBloc()),
      BlocProvider(create: (context) => MapClientBloc()),
      BlocProvider(create: (context) => StoreBloc()),
      BlocProvider(create: (context) => ClientStoreBloc()),
    ];
  }

  void hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
