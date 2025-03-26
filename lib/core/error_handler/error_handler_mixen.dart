import 'package:sqflite/sqflite.dart';

import 'failure.dart';

mixin ErrorHandlerMixen {
  Future<T> handleDatabaseErrors<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on DatabaseException catch (e) {
      throw ServiceFailure.fromSqflite(e);
    } on Exception catch (e) {
      throw ServiceFailure('Unexpected error: ${e.toString()}');
    }
  }
}
