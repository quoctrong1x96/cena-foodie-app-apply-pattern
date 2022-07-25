// A concrete implementation to service contract
import 'package:flutter/material.dart';

import '../../utils/internet_utils.dart';
import '../app_locator.dart';
import '../services/base_service.dart';
import '../services/cena_service/cena_service.dart';
import '../services/local/database_service.dart';
import '../services/local/storage_service.dart';

class BaseRepository implements IService {
  @protected
  final cenaService = locator<ICenaService>();
  @protected
  final storageService = locator<IStorageService>();
  @protected
  final databaseService = locator<IDatabaseService>();

  @override
  @protected
  Future<bool> hasInternet() async {
    return await InternetUtils.isInternetAvailable();
  }
}
