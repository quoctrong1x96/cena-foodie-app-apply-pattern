import 'package:get_it/get_it.dart';

import 'repositories/cena/cena_repository.dart';
import 'repositories/entities/auth_repository.dart';
import 'services/cena/cena_service.dart';
import 'services/entities/auth_service.dart';

// Using GetIt is a convenient way to provide objects anywhere we need them in the app
GetIt locator = GetIt.instance;

void initLocator() {
  // services
  locator.registerLazySingleton<ICenaService>(() => CenaRepository());
  // locator.registerLazySingleton<IStorageService>(() => StorageRepository());
  // locator.registerLazySingleton<IDatabaseService>(() => DatabaseRepository());
  // locator.registerLazySingleton<IProductService>(() => ProductRepository());
  // locator.registerLazySingleton<IOrderService>(() => OrderRepository());
  locator.registerLazySingleton<IAuthService>(() => AuthRepository());
}
