abstract class Usecase<T, P> {
  Future<T> call(P param);
}
