import 'package:drift/drift.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 40)();

  /// income | expense
  TextColumn get kind => text().withLength(min: 4, max: 7)();

  TextColumn get icon =>
      text().withLength(min: 1, max: 40).withDefault(const Constant('category'))();

  IntColumn get color => integer().withDefault(const Constant(0xFF2196F3))();

  BoolColumn get archived => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        'UNIQUE(name, kind)',
      ];
}
