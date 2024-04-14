import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../converters/services_model_converter.dart';
import '../models/service_model.dart';
import 'tables/appointments_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [AppointmentsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<AppointmentsTableData>> getAppointments() =>
      select(appointmentsTable).get();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() => LazyDatabase(
      () async {
        final appDatabaseFolder = await getApplicationDocumentsDirectory();
        final file =
            File(path.join(appDatabaseFolder.path, 'appdatabase.sqlite'));

        if (Platform.isAndroid) {
          await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
        }

        final cachebase = (await getTemporaryDirectory()).path;
        sqlite3.tempDirectory = cachebase;

        return NativeDatabase.createInBackground(file);
      },
    );
