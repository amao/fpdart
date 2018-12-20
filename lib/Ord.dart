import 'package:fpdart/Ordering.dart';
import 'package:fpdart/Setoid.dart';
import 'package:fpdart/function.dart';
import 'package:fpdart/Semigroup.dart';

abstract class Ord<A> extends Setoid<A> {
  Ordering compare(A x, A y);
}

Ordering unsafeCompare(dynamic x, dynamic y) {
  return x < y ? Ordering.minusone : x > y ? Ordering.one : Ordering.zero;
}

class OrdString extends Ord<String> {
  @override
  bool equals(String x, String y) {
    return setoidString.equals(x, y);
  }

  @override
  Ordering compare(String x, String y) {
    return unsafeCompare(x, y);
  }
}

Ord<String> ordString() {
  return OrdString();
}

class OrdNumber extends Ord<num> {
  @override
  bool equals(num x, num y) {
    return setoidNumber.equals(x, y);
  }

  @override
  Ordering compare(num x, num y) {
    return unsafeCompare(x, y);
  }
}

Ord<num> ordNumber() {
  return OrdNumber();
}

class OrdBoolean extends Ord<bool> {
  @override
  bool equals(bool x, bool y) {
    return setoidBool.equals(x, y);
  }

  @override
  Ordering compare(bool x, bool y) {
    return unsafeCompare(x, y);
  }
}

Ord<bool> ordBoolean() {
  return OrdBoolean();
}

bool Function(A, A) lessThan<A>(Ord<A> O) {
  return (A x, A y) => O.compare(x, y) == Ordering.minusone;
}

bool Function(A, A) greaterThan<A>(Ord<A> O) {
  return (A x, A y) => O.compare(x, y) == Ordering.one;
}

bool Function(A, A) lessThanOrEq<A>(Ord<A> O) {
  return (A x, A y) => O.compare(x, y) != Ordering.one;
}

bool Function(A, A) greaterThanOrEq<A>(Ord<A> O) {
  return (A x, A y) => O.compare(x, y) != Ordering.minusone;
}

A Function(A, A) min<A>(Ord<A> O) {
  return (A x, A y) => O.compare(x, y) == Ordering.one ? y : x;
}

A Function(A, A) max<A>(Ord<A> O) {
  return (A x, A y) => O.compare(x, y) == Ordering.minusone ? y : x;
}

A Function(A) Function(A low, A hi) clamp<A>(Ord<A> O) {
  final minO = min(O);
  final maxO = max(O);

  return (A low, A hi) => (A x) => maxO(minO(x, hi), low);
}

bool Function(A) Function(A, A) between<A>(Ord<A> O) {
  final lessThanO = lessThan(O);
  final greaterThanO = greaterThan(O);

  return (A low, A hi) => (A x) => (lessThanO(x, low) || greaterThanO(x, hi) ? false : true);
}

class OrdfromCompare<A> extends Ord<A> {
  final Ordering Function(A, A) _compare;
  OrdfromCompare(this._compare);
  @override
  bool equals(A x, A y) {
    return _compare(x, y) == Ordering.zero;
  }

  @override
  Ordering compare(A x, A y) {
    return _compare(x, y);
  }
}

Ord<A> fromCompare<A>(Ordering Function(A, A) compare) {
  return OrdfromCompare(compare);
}

Ord<B> contramap<A, B>(A Function(B) f, Ord<A> fa) {
  return fromCompare(on(fa.compare)(f));
}

class GetSemigroup<A> extends Semigroup<Ord<A>> {
  @override
  Ord<A> concat(Ord<A> x, Ord<A> y) {
    return fromCompare((A a, A b) => semigroupOrdering().concat(x.compare(a, b), y.compare(a, b)));
  }
}

Semigroup<Ord<A>> getSemigroup<A>() {
  return GetSemigroup();
}

class GetProductOrd<A, B> extends Ord<List<dynamic>> {
  final Ord<A> _OA;
  final Ord<B> _OB;

  GetProductOrd(this._OA, this._OB);

  @override
  Ordering compare(List x, List y) {
    final r = _OA.compare(x[0], y[0]);
    return r == Ordering.zero ? _OB.compare(x[1], y[1]) : r;
  }

  @override
  bool equals(List x, List y) {
    return getProductSetoid(_OA, _OB).equals(x, y);
  }
}

Ord<List<dynamic>> getProductOrd<A, B>(Ord<A> OA, Ord<B> OB) {
  return GetProductOrd(OA, OB);
}

Ord<A> getDualOrd<A>(Ord<A> O) {
  return fromCompare((A x, A y) => O.compare(x, y));
}

final Ord<DateTime> ordDate = contramap((DateTime dateTime) => dateTime.millisecondsSinceEpoch, ordNumber());