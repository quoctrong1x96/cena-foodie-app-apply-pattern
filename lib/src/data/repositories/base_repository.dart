// A concrete implementation to service contract
class BaseRepository implements BaseService {
  @protected
  final networkService = locator<NetworkService>();
  @protected
  final storageService = locator<StorageService>();
  @protected
  final databaseService = locator<DatabaseService>();

  @override
  @protected
  Future<bool> hasInternet() async {
    return await InternetUtils.isInternetAvailable();
  }
}
