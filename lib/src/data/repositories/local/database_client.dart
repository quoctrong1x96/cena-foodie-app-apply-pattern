class DatabaseClient {
  const DatabaseClient._internal();

  // ignore: prefer_const_constructors
  static final DatabaseClient _instance = DatabaseClient._internal();

  static DatabaseClient get instance => _instance;
}
