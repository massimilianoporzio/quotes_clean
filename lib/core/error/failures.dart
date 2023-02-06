import 'package:equatable/equatable.dart';

abstract class Failure {}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class ParsingFailure extends Failure {}

class CacheFailure extends Failure {}

class GenericFailure extends Failure {}
