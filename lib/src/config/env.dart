// // ignore_for_file: constant_identifier_names

// import 'package:flutter/material.dart';
// enum EnvType {
//   DEVELOPMENT,
//   STAGING,
//   PRODUCTION,
//   TESTING
// }

// class Env {

//   Env value;

//   String appName;
//   String baseUrl;
//   Color primarySwatch;
//   EnvType environmentType = EnvType.DEVELOPMENT;

//   // Database Config
//   int dbVersion = 1;
//   String dbName;


//   Env() {
//     value = this;
//     _init();
//   }

//   void _init() async{
//     WidgetsFlutterBinding.ensureInitialized();

//     if(EnvType.DEVELOPMENT == environmentType || EnvType.STAGING == environmentType){
//       Stetho.initialize();
//     }

//     var application = AppStoreApplication();
//     await application.onCreate();
//     runApp(AppComponent(application));
//   }
// }