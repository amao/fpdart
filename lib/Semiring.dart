abstract class Semiring<A> {
  A add(A x, A y);
  get zero => A;
  A mul(A x, A y);
  get one => A;
}

class GetFunctionSemiring<A, B> extends Semiring<B Function(A)> {
  final Semiring<B> _S;
  GetFunctionSemiring(this._S);
  @override
  B Function(A) add(B Function(A) f, B Function(A) g) {
    return (A x) => _S.add(f(x), g(x));
  }

  @override
  get zero => _S.zero;

  @override
  B Function(A) mul(B Function(A) f, B Function(A) g) {
    return (A x) => _S.mul(f(x), g(x));
  }

  @override
  get one => _S.one;
}

Semiring<B Function(A)> getFunctionSemiring<A, B>(Semiring<B> S) {
  return GetFunctionSemiring(S);
}