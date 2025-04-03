abstract class Failure {
  final String message;
  const Failure(this.message);
}

class BaseFailure extends Failure {
  const BaseFailure(super.message);
}
