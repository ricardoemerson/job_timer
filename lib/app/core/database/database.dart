import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'i_database.dart';

class Database implements IDatabase {
  Isar? _databaseInstance;

  @override
  Future<Isar> openConnection() async {
    if (_databaseInstance == null) {
      final dir = await getApplicationSupportDirectory();

      _databaseInstance = await Isar.open(
        [],
        directory: dir.path,
      );
    }

    return _databaseInstance!;
  }
}
