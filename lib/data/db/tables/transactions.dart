import 'package:drift/drift.dart';
import 'accounts.dart';
import 'categories.dart';

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// income | expense | transfer
  TextColumn get type => text().withLength(min: 6, max: 8)();

  /// sempre positivo
  IntColumn get amountCents => integer()();

  DateTimeColumn get occurredAt => dateTime()();

  TextColumn get description =>
      text().withLength(min: 0, max: 80).withDefault(const Constant(''))();

  TextColumn get notes => text().nullable()();

  IntColumn get accountId => integer().references(Accounts, #id)();

  IntColumn get categoryId => integer().nullable().references(Categories, #id)();

  TextColumn get transferGroupId => text().nullable()();

  IntColumn get counterpartyAccountId =>
      integer().nullable().references(Accounts, #id)();

  /// manual | recurrence | card_installment | import
  TextColumn get origin =>
      text().withLength(min: 4, max: 16).withDefault(const Constant('manual'))();

  BoolColumn get isVoid => boolean().withDefault(const Constant(false))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<String> get customConstraints => [
        "CHECK(type IN ('income','expense','transfer'))",
        "CHECK(origin IN ('manual','recurrence','card_installment','import'))",
      ];

  @override
  List<Set<Column>> get indexes => [
        {occurredAt},
        {accountId, occurredAt},
        {categoryId, occurredAt},
        {transferGroupId},
      ];
}
