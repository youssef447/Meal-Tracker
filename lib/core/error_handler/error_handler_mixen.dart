import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import 'failure.dart';

mixin ErrorHandlerMixen {
  Future<Either<Failure, T>> handleDatabaseErrors<T>(
      Future<T> Function() operation) async {
    try {
      final res = await operation();
      return Right(res);
    } on DatabaseException catch (e) {
      return Left(ServiceFailure.fromSqflite(e));
    } catch (e) {
      return Left(ServiceFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
