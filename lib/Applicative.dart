import 'package:fpdart/Apply.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Monoid.dart';

abstract class Applicative1<F extends HKT> extends Apply1<F> {
  HKT<F, A> of<A>(A a);
}

abstract class Applicative2<F extends HKT2> extends Apply2<F> {
  HKT2<F, L, A> of<L, A>(A a);
}

abstract class Applicative3<F extends HKT3> extends Apply3<F> {
  HKT3<F, U, L, A> of<U, L, A>(A a);
}

abstract class Applicative2C<F extends HKT2, L> extends Apply2C<F, L> {
  HKT2<F, L, A> of<A>(A a);
}

abstract class Applicative3C<F extends HKT3, U, L> extends Apply3C<F, U, L> {
  HKT3<F, U, L, A> of<A>(A a);
}

abstract class ApplicativeComposition11<F extends HKT, G extends HKT> extends FunctorComposition11<F, G> {
  HKT<F, HKT<G, A>> of<A>(A a);
  HKT<F, HKT<G, B>> ap<A, B>(HKT<F, HKT<G, B Function(A)>> fgab, HKT<F, HKT<G, A>> fga);
}

abstract class ApplicativeComposition12<F extends HKT, G extends HKT2> extends FunctorComposition12<F, G> {
  HKT<F, HKT2<G, LG, A>> of<LG, A>(A a);
  HKT<F, HKT2<G, LG, B>> ap<LG, A, B>(HKT<F, HKT2<G, LG, B Function(A)>> fgab, HKT<F, HKT2<G, LG, A>> fga);
}

abstract class ApplicativeComposition12C<F extends HKT, G extends HKT2, LG> extends FunctorComposition12C<F, G, LG> {
  HKT<F, HKT2<G, LG, A>> of<A>(A a);
  HKT<F, HKT2<G, LG, B>> ap<A, B>(HKT<F, HKT2<G, LG, B Function(A)>> fgab, HKT<F, HKT2<G, LG, A>> fga);
}

abstract class ApplicativeComposition21<F extends HKT2, G extends HKT> extends FunctorComposition21<F, G> {
  HKT2<F, LF, HKT<G, A>> of<LF, A>(A a);
  HKT2<F, LF, HKT<G, B>> ap<LF, A, B>(HKT2<F, LF, HKT<G, B Function(A)>> fgab, HKT2<F, LF, HKT<G, A>> fga);
}

abstract class ApplicativeComposition2C1<F extends HKT2, G extends HKT, LF> extends FunctorComposition2C1<F, G, LF> {
  HKT2<F, LF, HKT<G, A>> of<A>(A a);
  HKT2<F, LF, HKT<G, B>> ap<A, B>(HKT2<F, LF, HKT<G, B Function(A)>> fgab, HKT2<F, LF, HKT<G, A>> fga);
}

abstract class ApplicativeComposition22<F extends HKT2, G extends HKT2> extends FunctorComposition22<F, G> {
  HKT2<F, LF, HKT2<G, LG, A>> of<LF, LG, A>(A a);
  HKT2<F, LF, HKT2<G, LG, B>> ap<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, B Function(A)>> fgab, HKT2<F, LF, HKT2<G, LG, A>> fga);
}

abstract class ApplicativeComposition22C<F extends HKT2, G extends HKT2, LG> extends FunctorComposition22C<F, G, LG> {
  HKT2<F, LF, HKT2<G, LG, A>> of<LF, A>(A a);
  HKT2<F, LF, HKT2<G, LG, B>> ap<LF, A, B>(HKT2<F, LF, HKT2<G, LG, B Function(A)>> fgab, HKT2<F, LF, HKT2<G, LG, A>> fga);
}

abstract class ApplicativeComposition3C1<F extends HKT3, G extends HKT, UF, LF> extends FunctorComposition3C1<F, G, UF, LF> {
  HKT3<F, UF, LF, HKT<G, A>> of<A>(A a);
  HKT3<F, UF, LF, HKT<G, B>> ap<A, B>(HKT3<F, UF, LF, HKT<G, B Function(A)>> fgab, HKT3<F, UF, LF, HKT<G, A>> fga);
}

// when

HKT3<F, U, L, void> Function(bool, HKT3<F, U, L, void>) when3<F extends HKT3, U, L>(Applicative3<F> applicative) {
  return (bool condition, HKT3<F, U, L, void> fu) => condition ? fu : applicative.of(null);
}

HKT3<F, U, L, void> Function(bool, HKT3<F, U, L, void>) when3C<F extends HKT3, U, L>(Applicative3C<F, U, L> applicative) {
  return (bool condition, HKT3<F, U, L, void> fu) => condition ? fu : applicative.of(null);
}

HKT2<F, L, void> Function(bool, HKT2<F, L, void>) when2<F extends HKT2, L>(Applicative2<F> applicative) {
  return (bool condition, HKT2<F, L, void> fu) => condition ? fu : applicative.of(null);
}

HKT2<F, L, void> Function(bool, HKT2<F, L, void>) when2C<F extends HKT2, L>(Applicative2C<F, L> applicative) {
  return (bool condition, HKT2<F, L, void> fu) => condition ? fu : applicative.of(null);
}

HKT<F, void> Function(bool, HKT<F, void>) when<F extends HKT>(Applicative1<F> applicative) {
  return (bool condition, HKT<F, void> fu) => condition ? fu : applicative.of(null);
}

// getApplicativeComposition

class GetApplicativeComposition3C1<F extends HKT3, G extends HKT, UF, LF> extends ApplicativeComposition3C1<F, G, UF, LF> {
  final Applicative3C<F, UF, LF> _applicativeF;
  final Applicative1<G> _applicativeG;
  GetApplicativeComposition3C1(this._applicativeF, this._applicativeG);

  @override
  HKT3<F, UF, LF, HKT<G, A>> of<A>(A a) {
    return _applicativeF.of(_applicativeG.of(a));
  }

  @override
  HKT3<F, UF, LF, HKT<G, B>> ap<A, B>(HKT3<F, UF, LF, HKT<G, B Function(A)>> fgab, HKT3<F, UF, LF, HKT<G, A>> fga) {
    return _applicativeF.ap(_applicativeF.map(fgab, (HKT<G, B Function(A)> h) => (HKT<G, A> ga) => _applicativeG.ap(h, ga)), fga);
  }

  @override
  HKT3<F, UF, LF, HKT<G, B>> map<A, B>(HKT3<F, UF, LF, HKT<G, A>> fa, B Function(A a) f) {
    return getFunctorComposition3C1(_applicativeF, _applicativeG).map(fa, f);
  }
}
ApplicativeComposition3C1<F, G, UF, LF> getApplicativeComposition3C1<F extends HKT3, G extends HKT, UF, LF>(Applicative3C<F, UF, LF> applicativeF, Applicative1<G> applicativeG) {
  return GetApplicativeComposition3C1(applicativeF, applicativeG);
}

class GetApplicativeComposition22C<F extends HKT2, G extends HKT2, LG> extends ApplicativeComposition22C<F, G, LG> {
  final Applicative2<F> _applicativeF;
  final Applicative2C<G, LG> _applicativeG;
  GetApplicativeComposition22C(this._applicativeF, this._applicativeG);

  @override
  HKT2<F, LF, HKT2<G, LG, A>> of<LF, A>(A a) {
    return _applicativeF.of(_applicativeG.of(a));
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> ap<LF, A, B>(HKT2<F, LF, HKT2<G, LG, B Function(A)>> fgab, HKT2<F, LF, HKT2<G, LG, A>> fga) {
    return _applicativeF.ap(_applicativeF.map(fgab, (HKT2<G, LG, B Function(A)> h) => (HKT2<G, LG, A> ga) => _applicativeG.ap(h, ga)), fga);
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return getFunctorComposition22C(_applicativeF, _applicativeG).map(fa, f);
  }
}
ApplicativeComposition22C<F, G, LG> getApplicativeComposition22C<F extends HKT2, G extends HKT2, LG>(Applicative2<F> applicativeF, Applicative2C<G, LG> applicativeG) {
  return GetApplicativeComposition22C(applicativeF, applicativeG);
}

class GetApplicativeComposition22<F extends HKT2, G extends HKT2> extends ApplicativeComposition22<F, G> {
  final Applicative2<F> _applicativeF;
  final Applicative2<G> _applicativeG;
  GetApplicativeComposition22(this._applicativeF, this._applicativeG);

  @override
  HKT2<F, LF, HKT2<G, LG, A>> of<LF, LG, A>(A a) {
    return _applicativeF.of(_applicativeG.of(a));
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> ap<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, B Function(A)>> fgab, HKT2<F, LF, HKT2<G, LG, A>> fga) {
    return _applicativeF.ap(_applicativeF.map(fgab, (HKT2<G, LG, B Function(A)> h) => (HKT2<G, LG, A> ga) => _applicativeG.ap(h, ga)), fga);
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return getFunctorComposition22(_applicativeF, _applicativeG).map(fa, f);
  }
}
ApplicativeComposition22<F, G> getApplicativeComposition22<F extends HKT2, G extends HKT2>(Applicative2<F> applicativeF, Applicative2<G> applicativeG) {
  return GetApplicativeComposition22(applicativeF, applicativeG);
}

class GetApplicativeComposition21<F extends HKT2, G extends HKT> extends ApplicativeComposition21<F, G> {
  final Applicative2<F> _applicativeF;
  final Applicative1<G> _applicativeG;
  GetApplicativeComposition21(this._applicativeF, this._applicativeG);

  @override
  HKT2<F, LF, HKT<G, A>> of<LF, A>(A a) {
    return _applicativeF.of(_applicativeG.of(a));
  }

  @override
  HKT2<F, LF, HKT<G, B>> ap<LF, A, B>(HKT2<F, LF, HKT<G, B Function(A)>> fgab, HKT2<F, LF, HKT<G, A>> fga) {
    return _applicativeF.ap(_applicativeF.map(fgab, (HKT<G, B Function(A)> h) => (HKT<G, A> ga) => _applicativeG.ap(h, ga)), fga);
  }

  @override
  HKT2<F, LF, HKT<G, B>> map<LF, A, B>(HKT2<F, LF, HKT<G, A>> fa, B Function(A a) f) {
    return getFunctorComposition21(_applicativeF, _applicativeG).map(fa, f);
  }
}
ApplicativeComposition21<F, G> getApplicativeComposition21<F extends HKT2, G extends HKT>(Applicative2<F> applicativeF, Applicative1<G> applicativeG) {
  return GetApplicativeComposition21(applicativeF, applicativeG);
}

class GetApplicativeComposition12<F extends HKT, G extends HKT2> extends ApplicativeComposition12<F, G> {
  final Applicative1<F> _applicativeF;
  final Applicative2<G> _applicativeG;
  GetApplicativeComposition12(this._applicativeF, this._applicativeG);

  @override
  HKT<F, HKT2<G, LG, A>> of<LG, A>(A a) {
    return _applicativeF.of(_applicativeG.of(a));
  }

  @override
  HKT<F, HKT2<G, LG, B>> ap<LG, A, B>(HKT<F, HKT2<G, LG, B Function(A)>> fgab, HKT<F, HKT2<G, LG, A>> fga) {
    return _applicativeF.ap(_applicativeF.map(fgab, (HKT2<G, LG, B Function(A)> h) => (HKT2<G, LG, A> ga) => _applicativeG.ap(h, ga)), fga);
  }

  @override
  HKT<F, HKT2<G, LG, B>> map<LG, A, B>(HKT<F, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return getFunctorComposition12(_applicativeF, _applicativeG).map(fa, f);
  }
}
ApplicativeComposition12<F, G> getApplicativeComposition12<F extends HKT, G extends HKT2>(Applicative1<F> applicativeF, Applicative2<G> applicativeG) {
  return GetApplicativeComposition12(applicativeF, applicativeG);
}

class GetApplicativeComposition12C<F extends HKT, G extends HKT2, LG> extends ApplicativeComposition12C<F, G, LG> {
  final Applicative1<F> _applicativeF;
  final Applicative2C<G, LG> _applicativeG;
  GetApplicativeComposition12C(this._applicativeF, this._applicativeG);

  @override
  HKT<F, HKT2<G, LG, A>> of<A>(A a) {
    return _applicativeF.of(_applicativeG.of(a));
  }

  @override
  HKT<F, HKT2<G, LG, B>> ap<A, B>(HKT<F, HKT2<G, LG, B Function(A)>> fgab, HKT<F, HKT2<G, LG, A>> fga) {
    return _applicativeF.ap(_applicativeF.map(fgab, (HKT2<G, LG, B Function(A)> h) => (HKT2<G, LG, A> ga) => _applicativeG.ap(h, ga)), fga);
  }

  @override
  HKT<F, HKT2<G, LG, B>> map<A, B>(HKT<F, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return getFunctorComposition12C(_applicativeF, _applicativeG).map(fa, f);
  }
}
ApplicativeComposition12C<F, G, LG> getApplicativeComposition12C<F extends HKT, G extends HKT2, LG>(Applicative1<F> applicativeF, Applicative2C<G, LG> applicativeG) {
  return GetApplicativeComposition12C(applicativeF, applicativeG);
}

class GetApplicativeComposition11<F extends HKT, G extends HKT> extends ApplicativeComposition11<F, G> {
  final Applicative1<F> _applicativeF;
  final Applicative1<G> _applicativeG;
  GetApplicativeComposition11(this._applicativeF, this._applicativeG);

  @override
  HKT<F, HKT<G, A>> of<A>(A a) {
    return _applicativeF.of(_applicativeG.of(a));
  }

  @override
  HKT<F, HKT<G, B>> ap<A, B>(HKT<F, HKT<G, B Function(A)>> fgab, HKT<F, HKT<G, A>> fga) {
    return _applicativeF.ap(_applicativeF.map(fgab, (HKT<G, B Function(A)> h) => (HKT<G, A> ga) => _applicativeG.ap(h, ga)), fga);
  }

  @override
  HKT<F, HKT<G, B>> map<A, B>(HKT<F, HKT<G, A>> fa, B Function(A a) f) {
    return getFunctorComposition(_applicativeF, _applicativeG).map(fa, f);
  }
}
ApplicativeComposition11<F, G> getApplicativeComposition11<F extends HKT, G extends HKT>(Applicative1<F> applicativeF, Applicative1<G> applicativeG) {
  return GetApplicativeComposition11(applicativeF, applicativeG);
}

// getMonoid

class GetMonoid3<F extends HKT3, A, U, L> extends Monoid<HKT3<F, U, L, A>> {
  final Applicative3<F> _applicativeF;
  final Monoid<A> _M;
  GetMonoid3(this._applicativeF, this._M);

  @override
  get empty => _applicativeF.of(_M.empty);

  @override
  HKT3<F, U, L, A> concat(HKT3<F, U, L, A> x, HKT3<F, U, L, A> y) {
    return getSemigroup3(_applicativeF, _M)().concat(x, y);
  }
}
Monoid<HKT3<F, U, L, A>> Function() getMonoid3<F extends HKT3, A, U, L>(Applicative3<F> applicativeF, Monoid<A> M) {
  return () => GetMonoid3(applicativeF, M);
}

class GetMonoid3C<F extends HKT3, U, L, A> extends Monoid<HKT3<F, U, L, A>> {
  final Applicative3C<F, U, L> _applicativeF;
  final Monoid<A> _M;
  GetMonoid3C(this._applicativeF, this._M);

  @override
  get empty => _applicativeF.of(_M.empty);

  @override
  HKT3<F, U, L, A> concat(HKT3<F, U, L, A> x, HKT3<F, U, L, A> y) {
    return getSemigroup3C(_applicativeF, _M)().concat(x, y);
  }
}
Monoid<HKT3<F, U, L, A>> Function() getMonoid3C<F extends HKT3, U, L, A>(Applicative3C<F, U, L> applicativeF, Monoid<A> M) {
  return () => GetMonoid3C(applicativeF, M);
}

class GetMonoid2<F extends HKT2, A, L> extends Monoid<HKT2<F, L, A>> {
  final Applicative2<F> _applicativeF;
  final Monoid<A> _M;
  GetMonoid2(this._applicativeF, this._M);

  @override
  get empty => _applicativeF.of(_M.empty);

  @override
  HKT2<F, L, A> concat(HKT2<F, L, A> x, HKT2<F, L, A> y) {
    return getSemigroup2(_applicativeF, _M)().concat(x, y);
  }
}
Monoid<HKT2<F, L, A>> Function() getMonoid2<F extends HKT2, A, L>(Applicative2<F> applicativeF, Monoid<A> M) {
  return () => GetMonoid2(applicativeF, M);
}

class GetMonoid2C<F extends HKT2, A, L> extends Monoid<HKT2<F, L, A>> {
  final Applicative2C<F, L> _applicativeF;
  final Monoid<A> _M;
  GetMonoid2C(this._applicativeF, this._M);

  @override
  get empty => _applicativeF.of(_M.empty);

  @override
  HKT2<F, L, A> concat(HKT2<F, L, A> x, HKT2<F, L, A> y) {
    return getSemigroup2C(_applicativeF, _M)().concat(x, y);
  }
}
Monoid<HKT2<F, L, A>> Function() getMonoid2C<F extends HKT2, A, L>(Applicative2C<F, L> applicativeF, Monoid<A> M) {
  return () => GetMonoid2C(applicativeF, M);
}

class GetMonoid1<F extends HKT, A> extends Monoid<HKT<F, A>> {
  final Applicative1<F> _applicativeF;
  final Monoid<A> _M;
  GetMonoid1(this._applicativeF, this._M);

  @override
  get empty => _applicativeF.of(_M.empty);

  @override
  HKT<F, A> concat(HKT<F, A> x, HKT<F, A> y) {
    return getSemigroup1(_applicativeF, _M)().concat(x, y);
  }
}
Monoid<HKT<F, A>> Function() getMonoid1<F extends HKT, A>(Applicative1<F> applicativeF, Monoid<A> M) {
  return () => GetMonoid1(applicativeF, M);
}