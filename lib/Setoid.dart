import 'package:fpdart/function.dart';

abstract class Setoid<A> {
  bool equals(A x, A y);
}

bool strictEqual<A>(A a, A b) {
  return identical(a, b);
}

class SetoidStrict<A> extends Setoid<A> {
  @override
  bool equals(A x, A y) {
    return strictEqual(x, y);
  }
}

final Setoid<String> setoidString = SetoidStrict<String>();
final Setoid<num> setoidNumber = SetoidStrict<num>();
final Setoid<bool> setoidBool = SetoidStrict<bool>();

class ArraySetoid<A> extends Setoid<List<A>> {
  final Setoid<A> _S;
  ArraySetoid(this._S);

  @override
  bool equals(List<A> xs, List<A> ys) {
    if (xs.length == ys.length) {
      xs.asMap().forEach((int i, A x) {
        if (!_S.equals(x, ys[i])) {
          return false;
        }
      });
      return true;
    }
    return false;
  }
}

Setoid<Iterable<A>> getArraySetoid<A>(Setoid<A> S) {
  return ArraySetoid(S);
}

class RecordSetoid extends Setoid<Map<String, dynamic>> {
  final Map<String, Setoid> _setoids;
  RecordSetoid(this._setoids);

  @override
  bool equals(Map<String, dynamic> x, Map<String, dynamic> y) {
    _setoids.forEach((String k, _) {
      if (!_setoids[k].equals(x[k], y[k])) {
        return false;
      }
    });
    return true;
  }
}

Setoid<Map<String, dynamic>> getRecordSetoid(Map<String, Setoid<Map<String, dynamic>>> setoids) {
  return RecordSetoid(setoids);
}

class ProductSetoid<A, B> extends Setoid<List<dynamic>> {
  final Setoid<A> _SA;
  final Setoid<B> _SB;
  ProductSetoid(this._SA, this._SB);

  @override
  bool equals(List x, List y) {
    return _SA.equals(x[0], y[0]) && _SB.equals(x[1], y[1]);
  }
}

Setoid<List<dynamic>> getProductSetoid<A, B>(Setoid<A> SA, Setoid<B> SB) {
  return ProductSetoid(SA, SB);
}

class ContramapSetoid<A, B> extends Setoid<B> {
  final A Function(B) _f;
  final Setoid<A> _fa;

  ContramapSetoid(this._f, this._fa);

  @override
  bool equals(x, y) {
    return on(_fa.equals)(_f)(x, y);
  }
}

Setoid<B> contramap<A, B>(A Function(B) f, Setoid<A> fa) {
  return ContramapSetoid(f, fa);
}

Setoid<DateTime> setoidDate() {
  return contramap((DateTime date) => date.millisecondsSinceEpoch, setoidNumber);
}
