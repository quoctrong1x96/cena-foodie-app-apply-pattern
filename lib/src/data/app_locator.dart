import 'package:cenafoodie/src/data/repositories/entities/address_repository.dart';
import 'package:cenafoodie/src/data/repositories/entities/category_repository.dart';
import 'package:cenafoodie/src/data/repositories/entities/delivery_repository.dart';
import 'package:cenafoodie/src/data/repositories/entities/store_repository.dart';
import 'package:cenafoodie/src/data/repositories/entities/user_repository.dart';
import 'package:cenafoodie/src/data/services/entities/address_service.dart';
import 'package:cenafoodie/src/data/services/entities/category_service.dart';
import 'package:cenafoodie/src/data/services/entities/delivery_service.dart';
import 'package:cenafoodie/src/data/services/entities/user_service.dart';
import 'package:get_it/get_it.dart';

import 'repositories/cena/cena_repository.dart';
import 'repositories/entities/auth_repository.dart';
import 'repositories/entities/order_repository.dart';
import 'repositories/entities/product_repository.dart';
import 'repositories/local/database_repository.dart';
import 'repositories/local/storage_repository.dart';
import 'services/cena/cena_service.dart';
import 'services/entities/auth_service.dart';
import 'services/entities/store_service.dart';
import 'services/entities/product_service.dart';
import 'services/entities/order_service.dart';
import 'services/local/database_service.dart';
import 'services/local/storage_service.dart';

// Using GetIt is a convenient way to provide objects anywhere we need them in the app
GetIt locator = GetIt.instance;

void initLocator() {
  // services

  locator.registerLazySingleton<IAddressService>(() => AddressRepository());
  locator.registerLazySingleton<IAuthService>(() => AuthRepository());
  locator.registerLazySingleton<ICategoryService>(() => CategoryRepository());
  // locator.registerLazySingleton<IDatabaseService>(() => DashboardRepository());
  locator.registerLazySingleton<IDeliveryService>(() => DeliveryRepository());
  locator.registerLazySingleton<IOrderService>(() => OrderRepository());
  locator.registerLazySingleton<IProductService>(() => ProductRepository());
  locator.registerLazySingleton<IStoreService>(() => StoreRepository());
  locator.registerLazySingleton<IUserService>(() => UserRepository());

  locator.registerLazySingleton<ICenaService>(() => CenaRepository());
  locator.registerLazySingleton<IStorageService>(() => StorageRepository());
  locator.registerLazySingleton<IDatabaseService>(() => DatabaseRepository());
}
