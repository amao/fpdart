import 'package:fpdart/Setoid.dart';
import 'package:fpdart/Semigroup.dart';

class Ordering {
  static const minusone = const Ordering._(-1);
  static const zero = const Ordering._(0);
  static const one = const Ordering._(1);
  static get values => [minusone, zero, one];
  final int value;
  const Ordering._(this.value);
}

Ordering sign(num n) {
  return n <= -1 ? Ordering.minusone : n >= 1 ? Ordering.one : Ordering.zero;
}

class OrderingSetoid extends Setoid<Ordering> {
  @override
  bool equals(Ordering x, Ordering y) {
    return identical(x, y);
  }
}

Setoid<Ordering> setoidOrdering() {
  return OrderingSetoid();
}

class SemigroupOrdering extends Semigroup<Ordering> {
  @override
  Ordering concat(Ordering x, Ordering y) {
    return x != Ordering.zero ? x : y;
  }
}

Semigroup<Ordering> semigroupOrdering() {
  return SemigroupOrdering();
}

Ordering invert(Ordering O) {
  switch(O) {
    case Ordering.minusone:
      return Ordering.one;
    case Ordering.one:
      return Ordering.minusone;
    default:
      return Ordering.zero;
  }
}

