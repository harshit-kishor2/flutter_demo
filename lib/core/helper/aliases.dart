import 'package:fpdart/fpdart.dart';
import 'package:person_plan/core/helper/base_failure.dart';

typedef Result<T> = Either<Failure, T>;

typedef FutureResult<T> = Future<Either<Failure, T>>;

typedef FutureResultString = Future<Either<Failure, String>>;
