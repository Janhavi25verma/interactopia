import 'package:fpdart/fpdart.dart';
import 'package:interactopia/core/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
