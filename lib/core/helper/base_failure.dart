abstract class Failure {
  const Failure(this.message);

  final String message;
}

class BaseFailure extends Failure {
  const BaseFailure(super.message);
}
