import 'package:equatable/equatable.dart';

abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
