import 'package:fpdart/Alternative.dart';
import 'package:fpdart/Applicative.dart';
import 'package:fpdart/Either.dart';
import 'package:fpdart/Extend.dart';
import 'package:fpdart/function.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Monad.dart';
import 'package:fpdart/Monoid.dart';
import 'package:fpdart/Ord.dart';
import 'package:fpdart/Plus.dart';
import 'package:fpdart/Semigroup.dart';
import 'package:fpdart/Setoid.dart';
import 'package:fpdart/Ordering.dart';

abstract class Option<A> extends HKT<Option, A> {
  var value;
  Option<B> map<B>(B Function(A) f);
  Option<B> mapNullable<B>(B Function(A) /*null | undefined*/ f);
  Option<B> ap<B>(Option<B Function(A)> fab);
  Option<C> ap_<B, C>(/*this: Option<(b: B) => C>*/Option<B> fb);
  Option<B> chain<B>(Option<B> Function(A) f);
  B reduce<B>(B b, B Function(B b, A a) f);
  Option<A> alt(Option<A> fa);
  Option<A> orElse(Lazy<Option<A>> fa);
  Option<B> extend<B>(B Function(Option<A>) ea);
  B fold<B>(B b, B Function(A) whenSome);
  B foldL<B>(B Function() whenNone, B Function(A) whenSome);
  A getOrElse(A a);
  A getOrElseL(A Function() f);
  A /*| null*/toNullable();
  /*
  toUndefined(): A | undefined { return undefined }
  * */
  bool contains(Setoid<A> S, A a);
  bool isNone();/* isNone(): this is None<A>*/
  bool isSome();/* isSome(): this is Some<A>*/
  bool exists(bool Function(A) p);
  /*
  filter<B extends A>(p: Refinement<A, B>): Option<B>
  * */
  Option<A> filter(Predicate<A> p);
}

class None<A> extends Option<A> {
  static final None _none =None._internal();
  factory None() {
    return _none;
  }
  None._internal();
  @override
  Option<A> alt(Option<A> fa) {
    return fa;
  }

  @override
  Option<B> ap<B>(Option<B Function(A)> fab) {
    return none;
  }

  @override
  Option<C> ap_<B, C>(Option<B> fb) {
    if (this is Option<C Function(B)>) {
      return fb.ap(this as Option<C Function(B)>);
    }
    return this as dynamic;
  }

  @override
  Option<B> chain<B>(Option<B> Function(A) f) {
    return none;
  }

  @override
  bool contains(Setoid<A> S, A a) {
    return false;
  }

  @override
  bool exists(bool Function(A) p) {
    return false;
  }

  @override
  Option<B> extend<B>(B Function(Option<A>) ea) {
    return none;
  }

  @override
  Option<A> filter(Predicate<A> p) {
    return none;
  }

  @override
  B fold<B>(B b, B Function(A) whenSome) {
    return b;
  }

  @override
  B foldL<B>(B Function() whenNone, B Function(A) whenSome) {
    return whenNone();
  }

  @override
  A getOrElse(A a) {
    return a;
  }

  @override
  A getOrElseL(A Function() f) {
    return f();
  }

  @override
  bool isNone() {
    return true;
  }

  @override
  bool isSome() {
    return false;
  }

  @override
  Option<B> map<B>(B Function(A) f) {
    return none;
  }

  @override
  Option<B> mapNullable<B>(B Function(A) f) {
    return none;
  }

  @override
  Option<A> orElse(Lazy<Option<A>> fa) {
    return fa(null);
  }

  @override
  B reduce<B>(B b, B Function(B b, A a) Function) {
    return b;
  }

  @override
  A toNullable() {
    return null;
  }

  @override
  String toString() {
    return 'none';
  }
}

final Option<void> none = None();

class Some<A> extends Option<A> {
  final A value;
  Some(this.value);

  @override
  Option<A> alt(Option<A> fa) {
    // TODO: implement alt
    return null;
  }

  @override
  Option<B> ap<B>(Option<B Function(A)> fab) {
    return fab.isNone() ? none: Some(fab.value(this.value));
  }

  @override
  Option<C> ap_<B, C>(Option<B> fb) {
    if (this is Option<C Function(B)>) {
      return fb.ap(this as Option<C Function(B)>);
    }
    return this as dynamic;
  }

  @override
  Option<B> chain<B>(Option<B> Function(A) f) {
    return f(this.value);
  }

  @override
  bool contains(Setoid<A> S, A a) {
    return S.equals(this.value, a);
  }

  @override
  bool exists(bool Function(A) p) {
    return p(this.value);
  }

  @override
  Option<B> extend<B>(B Function(Option<A>) ea) {
    return Some(ea(this));
  }

  @override
  Option<A> filter(Predicate<A> p) {
    return this.exists(p) ? this : none;
  }

  @override
  B fold<B>(B b, B Function(A) whenSome) {
    return whenSome(this.value);
  }

  @override
  B foldL<B>(B Function() whenNone, B Function(A) whenSome) {
    return whenSome(this.value);
  }

  @override
  A getOrElse(A a) {
    return this.value;
  }

  @override
  A getOrElseL(A Function() f) {
    return this.value;
  }

  @override
  bool isNone() {
    return false;
  }

  @override
  bool isSome() {
    return true;
  }

  @override
  Option<B> map<B>(B Function(A) f) {
    return Some(f(this.value));
  }

  @override
  Option<B> mapNullable<B>(B Function(A) f) {
    return fromNullable(f(this.value));
  }

  @override
  Option<A> orElse(Lazy<Option<A>> fa) {
    return this;
  }

  @override
  B reduce<B>(B b, B Function(B b, A a) f) {
    return f(b, this.value);
  }

  @override
  A toNullable() {
    return this.value;
  }

  @override
  String toString() {
    return 'some(${this.value.toString()})';
  }
}

Option<A> fromNullable<A>(A a) {
  return a == null ? none : Some(a);
}

class _GetSetoid<A> extends Setoid<Option<A>> {
  final Setoid<A> S;
  _GetSetoid(this.S);

  @override
  bool equals(Option<A> x, Option<A> y) {
    return x.isNone() ? y.isNone() : y.isNone() ? false : S.equals(x.value, y.value);
  }
}
Setoid<Option<A>> getSetoid<A>(Setoid<A> S) {
  return _GetSetoid(S);
}

class _GetOrd<A> extends Ord<Option<A>> {
  final Ord<A> O;
  _GetOrd(this.O);

  @override
  Ordering compare(Option<A> x, Option<A> y) {
    return x.isSome() ? (y.isSome() ? O.compare(x.value, y.value) : Ordering.one) : y.isSome() ? Ordering.minusone: Ordering.zero;
  }

  @override
  bool equals(Option<A> x, Option<A> y) {
    return getSetoid(O).equals(x, y);
  }
}
Ord<Option<A>> getOrd<A>(Ord<A> O) {
  return _GetOrd(O);
}

Option<B> _map<A, B>(Option<A> fa, B Function(A) f) {
  return fa.map(f);
}

Option<A> _of<A>(A a) {
  return Some(a);
}

Option<B> _ap<A, B>(Option<B Function(A)> fab, Option<A> fa) {
  return fa.ap(fab);
}

Option<B> _chain<A, B>(Option<A> fa, Option<B> Function(A) f) {
  return fa.chain(f);
}

B _reduce<A, B>(Option<A> fa, B b, B Function(B b, A a) f) {
  return fa.reduce(b, f);
}

M Function(Option<A> fa, M Function(A) f) _foldMap<M, A>(Monoid<M> m) {
  return (Option<A> fa, M Function(A) f) => fa.isNone() ? m.empty : f(fa.value);
}

B _foldr<A, B>(Option<A> fa, B b, B Function(A a, B b) f) {
  return fa.isNone() ? b : f(fa.value, b);
}

final some = _of;

HKT<F, Option<B>> Function(Option<A> ta, HKT<F, B> Function(A a) f) _traverse<F extends HKT, A, B>(Applicative1<F> applicative) {
  return (Option<A> ta, HKT<F, B> Function(A a) f) => ta.isNone() ? applicative.of(none) : applicative.map(f(ta.value), some);
}

HKT<F, Option<A>> Function(Option<HKT<F, A>> ta) _sequence<F extends HKT, A>(Applicative1<F> applicative) {
  return (Option<HKT<F, A>> ta) => ta.isNone() ? applicative.of(none) : applicative.map(ta.value, some);
}

Option<A> _alt<A>(Option<A> fx, Option<A> fy) {
  return fx.alt(fy);
}

Option<B> _extend<A, B>(Option<A> ea, B Function(Option<A>) f) {
  return ea.extend(f);
}

Option<A> _zero<A>() {
  return none;
}

class GetApplySemigroup<A> extends Semigroup<Option<A>> {
  final Semigroup<A> S;
  GetApplySemigroup(this.S);

  @override
  Option<A> concat(Option<A> x, Option<A> y) {
    return x.isSome() && y.isSome() ? some(S.concat(x.value, y.value)) : none;
  }
}
Semigroup<Option<A>> getApplySemigroup<A>(Semigroup<A> S) {
  return GetApplySemigroup(S);
}

class _GetApplyMonoid<A> extends Monoid<Option<A>> {
  final Monoid<A> M;
  _GetApplyMonoid(this.M);

  @override
  get empty => some(M.empty);

  @override
  Option<A> concat(Option<A> x, Option<A> y) {
    return getApplySemigroup(M).concat(x, y);
  }


}
Monoid<Option<A>> getApplyMonoid<A>(Monoid<A> M) {
  return _GetApplyMonoid(M);
}

class _GetFirstMonoid<A> extends Monoid<Option<A>> {
  @override
  get empty => none;

  @override
  Option<A> concat(Option<A> x, Option<A> y) {
    return _alt(x, y);
  }
}
Monoid<Option<A>> getFirstMonoid<A/* A = never */>() {
  return _GetFirstMonoid();
}

class _GetLastMonoid<A> extends Monoid<Option<A>> {
  final M = getDualMonoid(getFirstMonoid());
  @override
  get empty => M.empty;

  @override
  Option<A> concat(Option<A> x, Option<A> y) {
    return M.concat(x, y);
  }
}
Monoid<Option<A>> getLastMonoid<A/* A = never */>() {
  return _GetLastMonoid();
}

class _GetMonoid<A> extends Monoid<Option<A>> {
  final Semigroup<A> S;
  _GetMonoid(this.S);

  @override
  get empty => none;

  @override
  Option<A> concat(Option<A> x, Option<A> y) {
    return x.isNone() ? y : y.isNone() ? x : some(S.concat(x.value, y.value));
  }
}
Monoid<Option<A>> getMonoid<A>(Semigroup<A> S) {
  return _GetMonoid(S);
}

Option<A> Function(A) fromPredicate<A>(Predicate<A> predicate) {
  return (A a) => predicate(a) ? some(a) : none;
}

Option<A> tryCatch<A>(Lazy<A> f) {
  try {
    return some(f(null));
  } catch (e) {
    return none;
  }
}

Option<A> fromEither<L, A>(Either<L, A> fa) {
  return fa.isLeft() ? none : some(fa.value);
}

bool/*fa is Some<A>*/ isSome<A>(Option<A> fa) {
  return fa.isSome();
}

bool/*fa is None<A>*/isNone<A>(Option<A> fa) {
  return fa.isNone();
}

// TODO implementation of `getRefinement`

Option<A> _compact<A>(Option<Option<A>> fa) {
  return fa.chain(identity);
}
// TODO: not finished yet

