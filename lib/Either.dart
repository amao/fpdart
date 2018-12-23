import 'package:fpdart/Bifunctor.dart';
import 'package:fpdart/ChainRec.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/function.dart';
import 'package:fpdart/Setoid.dart';
import 'package:fpdart/Semigroup.dart';
import 'package:fpdart/Monoid.dart';
import 'package:fpdart/Monad.dart';
import 'package:fpdart/Applicative.dart';

abstract class Either<L, A> extends HKT2<Either, L, A> {
  var value;
  bool isLeft();
  Either<L, B> ap<B>(Either<L, B Function(A)> fab);
  Either<L, C> ap_<B, C>(Either<L, B> fb);
  Either<L, B> map<B>(B Function(A) f);
  Either<V, B> bimap<V, B>(V Function(L) f, B Function(A) g);
  Either<L,A> alt(Either<L, A> fy);
  Either<L, B> chain<B>(Either<L, B> Function(A) f);
  Either<M, A> orElse<M>(Either<M, A> Function(L) fy);
  Either<L, B> extend<B>(B Function(Either<L, A>) ea);
  B reduce<B>(B b, B Function(B b, A a) f);
  B fold<B>(B Function(L) whenLeft, B Function(A) whenRight);
  A getOrElse(A a);
  A getOrElseL(A Function(L) f);
  Either<M, A> mapLeft<M>(M Function(L) f);
  bool isRight();
  Either<A, L> swap();
  Either<L, A> filterOrElse(Predicate<A> p, L zero);
  Either<L, A> filterOrElseL(Predicate<A> p, L Function(A) zero);
}

class Left<L, A> extends Either<L, A> {
  final L value;
  Left(this.value);

  @override
  Either<L, B> map<B>(B Function(A) f) {
    return this as dynamic;
  }

  @override
  bool isLeft() {
    return true;
  }

  @override
  Either<L, B> ap<B>(Either<L, B Function(A)> fab) {
    return fab.isLeft() ? fab : this;
  }

  @override
  //TODO: might be wrong implementation. see `fp-ts`.
  Either<L, C> ap_<B, C>(Either<L, B> fb) {
    if (this is Either<L, C Function(B)>) {
      return fb.ap(this as Either<L, C Function(B)>);
    }

    return this as dynamic;
  }

  @override
  Either<L, B> chain<B>(Either<L, B> Function(A) f) {
    return this as dynamic;
  }

  @override
  Either<V, B> bimap<V, B>(V Function(L) f, B Function(A) g) {
    return Left(f(this.value));
  }

  @override
  Either<L,A> alt(Either<L, A> fy) {
    return fy;
  }

  @override
  Either<M, A> orElse<M>(Either<M, A> Function(L) fy) {
    return fy(this.value);
  }

  @override
  Either<L, B> extend<B>(B Function(Either<L, A>) ea) {
    return this as dynamic;
  }

  @override
  B reduce<B>(B b, B Function(B b, A a) f) {
    return b;
  }

  @override
  B fold<B>(B Function(L) whenLeft, B Function(A) whenRight) {
    return whenLeft(this.value);
  }

  @override
  A getOrElse(A a) {
    return a;
  }

  @override
  A getOrElseL(A Function(L) f) {
    return f(this.value);
  }

  @override
  Either<M, A> mapLeft<M>(M Function(L) f) {
    return Left(f(this.value));
  }

  @override
  String toString() {
    return 'left(${this.value.toString()})';
  }

  @override
  bool isRight() {
    return false;
  }

  @override
  Either<A, L> swap() {
    return Right(this.value);
  }

  @override
  Either<L, A> filterOrElse(Predicate<A> p, L zero) {
    return this;
  }

  @override
  Either<L, A> filterOrElseL(Predicate<A> p, L Function(A) zero) {
    return this;
  }
}

class Right<L, A> extends Either<L, A> {
  final A value;
  Right(this.value);

  @override
  Either<L, A> alt(Either<L, A> fy) {
    return this;
  }

  @override
  Either<L, B> ap<B>(Either<L, B Function(A)> fab) {
    return fab.isRight() ? this.map(fab.value) : Left(fab.value);
  }

  @override
  Either<L, C> ap_<B, C>(Either<L, B> fb) {
    if (this is Either<L, C Function(B)>) {
      return fb.ap(this as Either<L, C Function(B)>);
    }

    return this as dynamic;
  }

  @override
  Either<V, B> bimap<V, B>(V Function(L) f, B Function(A) g) {
    return Right(g(this.value));
  }

  @override
  Either<L, B> chain<B>(Either<L, B> Function(A) f) {
    return f(this.value);
  }

  @override
  Either<L, B> extend<B>(B Function(Either<L, A>) ea) {
    return Right(ea(this));
  }

  @override
  Either<L, A> filterOrElse(Predicate<A> p, L zero) {
    return p(this.value) ? this : Left(zero);
  }

  @override
  Either<L, A> filterOrElseL(Predicate<A> p, L Function(A) zero) {
    return p(this.value) ? this : Left(zero(this.value));
  }

  @override
  B fold<B>(B Function(L) whenLeft, B Function(A) whenRight) {
    return whenRight(this.value);
  }

  @override
  A getOrElse(A a) {
    return this.value;
  }

  @override
  A getOrElseL(A Function(L) f) {
    return this.value;
  }

  @override
  bool isLeft() {
    return false;
  }

  @override
  bool isRight() {
    return true;
  }

  @override
  Either<L, B> map<B>(B Function(A) f) {
    return Right(f(this.value));
  }

  @override
  Either<M, A> mapLeft<M>(M Function(L) f) {
    return Right(this.value);
  }

  @override
  Either<M, A> orElse<M>(Either<M, A> Function(L) fy) {
    return this as dynamic;
  }

  @override
  B reduce<B>(B b, B Function(B b, A a) f) {
    return f(b, this.value);
  }

  @override
  Either<A, L> swap() {
    return Left(this.value);
  }

  @override
  String toString() {
    return 'right(${this.value.toString()})';
  }
}

class GetSetoid<L, A> extends Setoid<Either<L, A>> {
  final Setoid<L> SL;
  final Setoid<A> SA;
  GetSetoid(this.SL, this.SA);

  @override
  bool equals(Either<L, A> x, Either<L, A> y) {
    return x.isLeft() ? y.isLeft() && SL.equals(x.value, y.value) : y.isRight() && SA.equals(x.value, y.value);
  }
}
Setoid<Either<L, A>> getSetoid<L, A>(Setoid<L> SL, Setoid<A> SA) {
  return GetSetoid(SL, SA);
}

class GetSemigroup<L, A> extends Semigroup<Either<L, A>> {
  final Semigroup<A> S;
  GetSemigroup(this.S);

  @override
  Either<L, A> concat(Either<L, A> x, Either<L, A> y) {
    return y.isLeft() ? x : x.isLeft() ? y : Right(S.concat(x.value, y.value));
  }
}
Semigroup<Either<L, A>> getSemigroup<L, A>(Semigroup<A> S) {
  return GetSemigroup(S);
}

class GetApplySemigroup<L, A> extends Semigroup<Either<L, A>> {
  final Semigroup<A> S;
  GetApplySemigroup(this.S);

  @override
  Either<L, A> concat(Either<L, A> x, Either<L, A> y) {
    return x.isLeft() ? x : y.isLeft() ? y : Right(S.concat(x.value, y.value));
  }
}
Semigroup<Either<L, A>> getApplySemigroup<L, A>(Semigroup<A> S) {
  return GetApplySemigroup(S);
}

class GetApplyMonoid<L, A> extends Monoid<Either<L, A>> {
  final Monoid<A> M;
  GetApplyMonoid(this.M);

  @override
  get empty => Right(M.empty);

  @override
  Either<L, A> concat(Either<L, A> x, Either<L, A> y) {
    return getApplySemigroup(M).concat(x, y);
  }
}
Monoid<Either<L, A>> getApplyMonoid<L, A>(Monoid<A> M) {
  return GetApplyMonoid(M);
}

Either<L, A> left<L, A>(L l) {
  return Left(l);
}

final right = _of;

// private
Either<L, B> _map<L, A, B>(Either<L, A> fa, B Function(A) f) {
  return fa.map(f);
}

Either<L, B> _ap<L, A, B>(Either<L, B Function(A)> fab, Either<L, A> fa) {
  return fa.ap(fab);
}

Either<L, B> _chain<L, A, B>(Either<L, A> fa, Either<L, B> Function(A) f) {
  return fa.chain(f);
}

Either<L, A> _of<L, A>(A a) {
  return Right<L, A>(a);
}

Either<V, B> _bimap<L, V, A, B>(Either<L, A> fla, V Function(L) f, B Function(A) g) {
  return fla.bimap(f, g);
}

Either<L, A> _alt<L, A>(Either<L, A> fx, Either<L, A> fy) {
  return fx.alt(fy);
}

Either<L, B> _extend<L, A, B>(Either<L, A> ea, B Function(Either<L, A>) f) {
  return ea.extend(f);
}

B _reduce<L, A, B>(Either<L, A> fa, B b, B Function(B b, A a) f) {
  return fa.reduce(b, f);
}

M Function(Either<L, A>, M Function(A)) _foldMap<M, L, A>(Monoid<M> m) {
  return (Either<L, A> fa, M Function(A) f) => fa.isLeft() ? m.empty : f(fa.value);
}

B _foldr<L, A, B>(Either<L, A> fa, B b, B Function(A a, B b) f) {
  return fa.isLeft() ? b : f(fa.value, b);
}

HKT<F, Either<L, B>> Function(Either<L, A>, HKT<F, B> Function(A)) _traverse<F extends HKT, L, A, B>(Applicative1<F> applicative) {
  return (Either<L, A> ta, HKT<F, B> Function(A) f) => ta.isLeft() ? applicative.of(left(ta.value)) : applicative.map(f(ta.value), _of);
}

HKT<F, Either<L, A>> Function(Either<L, HKT<F, A>>) _sequence<F extends HKT, L, A>(Applicative1<F> applicative) {
  return (Either<L, HKT<F, A>> ta) => ta.isLeft() ? applicative.of(Left(ta.value)) : applicative.map(ta.value, right);
}

Either<L, B> _chainRec<L, A, B>(A a, Either<L, Either<A, B>> Function(A) f) {
  return tailRec((e) {
    if (e.isLeft()) {
      return right(left(e.value));
    } else {
      final r = e.value;
      return r.isLeft() ? left(f(r.value)) : right(right(r.value));
    }
  }, f(a));
}

// TODO: not finished yet
class either<L, A> implements Monad2<Either>, Bifunctor2<Either>, ChainRec2<Either> {
  static final either _either = either._internal();
  factory either() {
    return _either;
  }
  either._internal();

  @override
  HKT2<Either, L, B> ap<L, A, B>(HKT2<Either, L, B Function(A)> fab, HKT2<Either, L, A> fa) {
    return _ap(fab, fa as Either<L, A>);
  }

  @override
  HKT2<Either, L, B> chain<L, A, B>(HKT2<Either, L, A> fa, HKT2<Either, L, B> Function(A) f) {
    return _chain(fa as Either<L, A>, f);
  }

  @override
  HKT2<Either, L, B> map<L, A, B>(HKT2<Either, L, A> fa, B Function(A a) f) {
    return _map(fa, f);
  }

  @override
  HKT2<Either, L, A> of<L, A>(A a) {
    return _of(a);
  }

  @override
  HKT2<Either, M, B> bimap<L, A, M, B>(HKT2<Either, L, A> fla, M Function(L) f, B Function(A) g) {
    return _bimap(fla, f, g);
  }

  @override
  HKT2<Either, L, B> chainRec<L, A, B>(A a, HKT2<Either, L, Either<A, B>> Function(A) f) {
    return _chainRec(a, f);
  }
}