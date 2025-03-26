import 'package:sqflite/sqflite.dart';

class Failure {
  String message;
  Failure({required this.message});
}

class ServiceFailure extends Failure {
  ServiceFailure(String message) : super(message: message);

  factory ServiceFailure.fromSqflite(DatabaseException err) {
    if (err.isOpenFailedError()) {
      return ServiceFailure('Error in opening database');
    }
    if (err.isDatabaseClosedError()) {
      return ServiceFailure('failed to read from database');
    }
    if (err.isReadOnlyError()) {
      return ServiceFailure('failed to write to database');
    }
    if (err.isSyntaxError()) {
      return ServiceFailure('Syntax error');
    }
    if (err.isNoSuchTableError()) {
      return ServiceFailure('Table not found');
    }
    return ServiceFailure(err.toString());
  }
}
