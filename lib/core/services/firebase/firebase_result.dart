import 'firebase_error_model.dart';

abstract class FirebaseResult<T> {
  const FirebaseResult();

  factory FirebaseResult.success(T data) = FirebaseSuccess<T>;
  factory FirebaseResult.failure(FirebaseErrorModel error) = FirebaseFailure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(FirebaseErrorModel error) failure,
  });
}

class FirebaseSuccess<T> extends FirebaseResult<T> {
  final T data;

  const FirebaseSuccess(this.data);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(FirebaseErrorModel error) failure,
  }) {
    return success(data);
  }
}

class FirebaseFailure<T> extends FirebaseResult<T> {
  final FirebaseErrorModel error;

  const FirebaseFailure(this.error);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(FirebaseErrorModel error) failure,
  }) {
    return failure(error);
  }
}
