import 'package:drift/drift.dart';

class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 60)();

  /// checking, cash, savings, investment, wallet
  TextColumn get type =>
      text().withLength(min: 1, max: 20).withDefault(const Constant('checking'))();

  TextColumn get currency =>
      text().withLength(min: 3, max: 3).withDefault(const Constant('BRL'))();

  IntColumn get initialBalanceCents => integer().withDefault(const Constant(0))();

  BoolColumn get archived => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
