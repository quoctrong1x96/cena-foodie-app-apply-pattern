import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'src/blocs/auth/auth_bloc.dart';
import 'src/blocs/cart/cart_bloc.dart';
import 'src/blocs/client_map/map_client_bloc.dart';
import 'src/blocs/client_store/client_store_bloc.dart';
import 'src/blocs/delivery/delivery_bloc.dart';
import 'src/blocs/delivery_map/map_delivery_bloc.dart';
import 'src/blocs/general/general_bloc.dart';
import 'src/blocs/my_location/my_location_map_bloc.dart';
import 'src/blocs/order/orders_bloc.dart';
import 'src/blocs/payment/payments_bloc.dart';
import 'src/blocs/product/product_bloc.dart';
import 'src/blocs/store/store_bloc.dart';
import 'src/blocs/user/user_bloc.dart';
import 'src/configs/cena_themes.dart';
import 'src/data/services/google/push_notification.dart';
import 'src/generated/l10n.dart';
import 'src/getx_services/getx_settings_service.dart';
import 'src/screens/intro/checking_login_page.dart';
import 'src/themes/theme_maps.dart';

PushNotification pushNotification = PushNotification();

Future<void> _firebaseMessagingBackground(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future initServices() async {
  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
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
      ],
      child: GestureDetector(
        onTap: hideKeyboard,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CENA FOODIE - FOOD&DRINK DELIVERY',
          home: const CheckingLoginPage(),
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

  void hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
