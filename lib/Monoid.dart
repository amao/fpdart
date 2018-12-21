import 'package:fpdart/Bounded.dart';
import 'package:fpdart/function.dart';
import 'package:fpdart/Semigroup.dart' as semigroup;

abstract class Monoid<A> extends semigroup.Semigroup<A> {
  get empty => A;
}

A Function(List<A>) fold<A>(Monoid<A> M) {
  return semigroup.fold(M)(M.empty);
}

class GetProductMonoid<A, B> extends Monoid<List<dynamic>> {
  final Monoid<A> _MA;
  final Monoid<B> _MB;
  GetProductMonoid(this._MA, this._MB);
  @override
  get empty => [_MA.empty, _MB.empty];

  @override
  List concat(List x, List y) {
    return semigroup.getProductSemigroup(_MA, _MB).concat(x, y);
  }
}
Monoid<List<dynamic>> getProductMonoid<A, B>(Monoid<A> MA, Monoid<B> MB) {
  return GetProductMonoid(MA, MB);
}

class GetDualMonoid<A> extends Monoid<A> {
  final Monoid<A> _M;
  GetDualMonoid(this._M);
  @override
  get empty => _M.empty;

  @override
  A concat(A x, A y) {
    return semigroup.getDualSemigroup(_M).concat(x, y);
  }
}
Monoid<A> getDualMonoid<A>(Monoid<A> M) {
  return GetDualMonoid(M);
}

class MonoidAll extends Monoid<bool> {
  @override
  get empty => true;

  @override
  bool concat(bool x, bool y) {
    return semigroup.semigroupAll().concat(x, y);
  }
}
Monoid<bool> monoidAll() {
  return MonoidAll();
}
class MonoidAny extends Monoid<bool> {
  @override
  get empty => false;

  @override
  bool concat(bool x, bool y) {
    return semigroup.semigroupAny().concat(x, y);
  }
}
Monoid<bool> monoidAny() {
  return MonoidAny();
}

final List<dynamic> emptyArray = [];

class UnsafeMonoidArray extends Monoid<List<dynamic>> {
  @override
  get empty => emptyArray;

  @override
  List concat(List x, List y) {
    return semigroup.getArraySemigroup().concat(x, y);
  }
}
Monoid<List<dynamic>> unsafeMonoidArray() {
  return UnsafeMonoidArray();
}

Monoid<List<A>> getArrayMonoid<A>() {
  return unsafeMonoidArray();
}

final emptyObject = Object();

class GetDictionaryMonoid<A> extends Monoid<Map<String, A>> {
  final semigroup.Semigroup<A> _S;
  GetDictionaryMonoid(this._S);

  @override
  get empty => emptyObject;

  @override
  Map<String, A> concat(Map<String, A> x, Map<String, A> y) {
    return semigroup.getDictionarySemigroup(_S).concat(x, y);
  }
}
Monoid<Map<String, A>> getDictionaryMonoid<A>(semigroup.Semigroup<A> S) {
  return GetDictionaryMonoid(S);
}

class MonoidSum extends Monoid<num> {
  @override
  get empty => 0;

  @override
  num concat(num x, num y) {
    return semigroup.semigroupSum().concat(x, y);
  }
}
Monoid<num> monoidSum() {
  return MonoidSum();
}

class MonoidProduct extends Monoid<num> {
  @override
  get empty => 1;

  @override
  num concat(num x, num y) {
    return semigroup.semigroupProduct().concat(x, y);
  }
}
Monoid<num> monoidProduct() {
  return MonoidProduct();
}

class MonoidString extends Monoid<String> {
  @override
  get empty => '';

  @override
  String concat(String x, String y) {
    return semigroup.setmigroupString().concat(x, y);
  }
}
Monoid<String> monoidString() {
  return MonoidString();
}

class MonoidVoid extends Monoid<void> {
  @override
  get empty => null;

  @override
  void concat(void x, void y) {
    return semigroup.semigroupVoid().concat(x, y);
  }
}
Monoid<void> monoidVoid() {
  return MonoidVoid();
}

class GetFunctionMonoid<M, A> extends Monoid<M Function(A)> {
  final Monoid<M> _m;
  GetFunctionMonoid(this._m);

  @override
  get empty => () => _m.empty;

  @override
  M Function(A) concat(M Function(A) x, M Function(A) y) {
    return semigroup.getFunctionSemigroup(_m).concat(x, y);
  }
}
Monoid<M Function(A)> Function() getFunctionMonoid<M, A>(Monoid<M> m) {
  return () => GetFunctionMonoid(m);
}

class GetEndomorphismMonoid<A> extends Monoid<Endomorphism<A>> {
  @override
  get empty => identity;

  @override
  Endomorphism<A> concat(Endomorphism<A> x, Endomorphism<A> y) {
    return compose2(x, y);
  }
}
Monoid<Endomorphism<A>> getEndomorphismMonoid<A>() {
  return GetEndomorphismMonoid();
}

class GetRecordMonoid<O extends Map<String, dynamic>> extends Monoid<O> {
  final Map<String, Monoid<O>> _monoids;
  GetRecordMonoid(this._monoids);

  @override
  get empty {
    final result = Map();
    final keys = _monoids.keys;
    for (var key in keys) {
      result[key] = _monoids[key].empty;
    }
    return result;
  }

  @override
  O concat(O x, O y) {
    return semigroup.getRecordSemigroup(_monoids).concat(x, y);
  }
}
Monoid<O> getRecordMonoid<O extends Map<String, dynamic>>(Map<String, Monoid<O>> monoids) {
  return GetRecordMonoid(monoids);
}

class GetMeetMonoid<A> extends Monoid<A> {
  final Bounded<A> _B;
  GetMeetMonoid(this._B);

  @override
  // TODO: check implementation of `fp-ts`
  get empty => null;

  @override
  A concat(A x, A y) {
    return semigroup.getMeetSemigroup(_B).concat(x, y);
  }
}
Monoid<A> getMeetMonoid<A>(Bounded<A> B) {
  return GetMeetMonoid(B);
}

class GetJoinMonoid<A> extends Monoid<A> {
  final Bounded<A> _B;
  GetJoinMonoid(this._B);

  @override
  // TODO: check implementation of `fp-ts`
  get empty => null;

  @override
  A concat(A x, A y) {
    return semigroup.getJoinSemigroup(_B).concat(x, y);
  }
}
Monoid<A> getJoinMonoid<A>(Bounded<A> B) {
  return GetJoinMonoid(B);
}
