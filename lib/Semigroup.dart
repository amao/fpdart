import 'package:fpdart/Ord.dart';
import 'package:fpdart/function.dart';

abstract class Semigroup<A> {
  A concat(A x, A y);
}

A Function(List<A>) Function(A) fold<A>(Semigroup<A> S) {
  return (A a) => (List<A> as) => as.fold(a, S.concat);
}

class GetFirstSemigroup<A> extends Semigroup<A> {
  @override
  A concat(A x, A y) {
    return identity(x);
  }
}

Semigroup<A> getFirstSemigroup<A>() {
  return GetFirstSemigroup();
}

class GetLastSemigroup<A> extends Semigroup<A> {
  @override
  A concat(A x, A y) {
    return identity(y);
  }
}

Semigroup<A> getLastSemigroup<A>() {
  return GetLastSemigroup();
}

class GetProductSemigroup<A, B> extends Semigroup<List<dynamic>> {
  final Semigroup<A> _SA;
  final Semigroup<B> _SB;
  GetProductSemigroup(this._SA, this._SB);
  @override
  List concat(List x, List y) {
    return [_SA.concat(x[0], y[0]), _SB.concat(x[1], y[1])];
  }
}

Semigroup<List<dynamic>> getProductSemigroup<A, B>(Semigroup<A> SA, Semigroup<B> SB) {
  return GetProductSemigroup(SA, SB);
}

class GetDualSemigroup<A> extends Semigroup<A> {
  final Semigroup<A> _S;
  GetDualSemigroup(this._S);
  @override
  A concat(A x, A y) {
    return _S.concat(x, y);
  }
}

Semigroup<A> getDualSemigroup<A>(Semigroup<A> S) {
  return GetDualSemigroup(S);
}

class GetFunctionSemigroup<S, A> extends Semigroup<S Function(A)> {
  final Semigroup<S> _s;
  GetFunctionSemigroup(this._s);

  @override
  S Function(A) concat(S Function(A) f, S Function(A) g) {
    return (A a) => _s.concat(f(a), g(a));
  }
}

Semigroup<S Function(A)> getFunctionSemigroup<S, A>(Semigroup<S> s) {
  return GetFunctionSemigroup(s);
}

class GetRecordSemigroup<O extends Map<String, dynamic>> extends Semigroup<O> {
  final Map<String, Semigroup<O>> _semigroups;
  GetRecordSemigroup(this._semigroups);
  @override
  O concat(O x, O y) {
    final r = Map<String, dynamic>();
    final keys = _semigroups.keys;
    for (var key in keys) {
      r[key] = _semigroups[key].concat(x[key], y[key]);
    }
    return r;
  }
}

Semigroup<O> getRecordSemigroup<O extends Map<String, dynamic>>(Map<String, Semigroup<O>> semigroups) {
  return GetRecordSemigroup(semigroups);
}

class GetMeetSemigroup<A> extends Semigroup<A> {
  final Ord<A> _O;
  GetMeetSemigroup(this._O);
  @override
  A concat(A x, A y) {
    return min(_O)(x, y);
  }
}

Semigroup<A> getMeetSemigroup<A>(Ord<A> O) {
  return GetMeetSemigroup(O);
}

class GetJoinSemigroup<A> extends Semigroup<A> {
  final Ord<A> _O;
  GetJoinSemigroup(this._O);
  @override
  A concat(A x, A y) {
    return max(_O)(x, y);
  }
}

Semigroup<A> getJoinSemigroup<A>(Ord<A> O) {
  return GetJoinSemigroup(O);
}

class SemigroupAll extends Semigroup<bool> {
  @override
  bool concat(bool x, bool y) {
    return x && y;
  }
}

Semigroup<bool> semigroupAll() {
  return SemigroupAll();
}

class SemigroupAny extends Semigroup<bool> {
  @override
  bool concat(bool x, bool y) {
    return x || y;
  }
}

Semigroup<bool> semigroupAny() {
  return SemigroupAny();
}

class GetArraySemigroup<A> extends Semigroup<List<A>> {
  @override
  List<A> concat(List<A> x, List<A> y) {
    return List<A>.from(x)..addAll(y);
  }
}

Semigroup<List<A>> getArraySemigroup<A>() {
  return GetArraySemigroup();
}

class GetDictionarySemigroup<A> extends Semigroup<Map<String, A>> {
  final Semigroup<A> _S;
  GetDictionarySemigroup(this._S);
  @override
  Map<String, A> concat(Map<String, A> x, Map<String, A> y) {
    final Map<String, A> r = x;
    final keys = y.keys.toList();
    final len = keys.length;
    for (var i = 0; i < len; i++) {
      final k = keys[i];
      r[k] = x.containsKey(k) ? _S.concat(x[k], y[k]) : y[k];
    }
    return r;
  }
}

Semigroup<Map<String, A>> getDictionarySemigroup<A>(Semigroup<A> S) {
  return GetDictionarySemigroup(S);
}

final semigroupAnyDictionary = getDictionarySemigroup(getLastSemigroup());

Semigroup<A> getObjectSemigroup<A extends Object>() {
  return semigroupAnyDictionary as Semigroup<A>;
}

class SemigroupSum extends Semigroup<num> {
  @override
  num concat(num x, num y) {
    return x + y;
  }
}

Semigroup<num> semigroupSum() {
  return SemigroupSum();
}

class SemigroupProduct extends Semigroup<num> {
  @override
  num concat(num x, num y) {
    return x * y;
  }
}

Semigroup<num> semigroupProduct() {
  return SemigroupProduct();
}

class SemigroupString extends Semigroup<String> {
  @override
  String concat(String x, String y) {
    return x + y;
  }
}

Semigroup<String> setmigroupString() {
  return SemigroupString();
}

class SemigroupVoid extends Semigroup<void> {
  @override
  void concat(void x, void y) {
    return null;
  }}

Semigroup<void> semigroupVoid() {
  return SemigroupVoid();
}