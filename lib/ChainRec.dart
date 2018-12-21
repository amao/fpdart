import 'package:fpdart/Chain.dart';
import 'package:fpdart/Either.dart';
import 'package:fpdart/Hkt.dart';

abstract class ChainRec1<F extends HKT> extends Chain1<F> {
  HKT<F, B> chainRec<A, B>(A a, HKT<F, Either<A, B>> Function(A) f);
}

abstract class ChainRec2<F extends HKT2> extends Chain2<F> {
  HKT2<F, L, B> chainRec<L, A, B>(A a, HKT2<F, L, Either<A, B>> Function(A) f);
}

abstract class ChainRec3<F extends HKT3> extends Chain3<F> {
  HKT3<F, U, L, B> chainRec<U, L, A, B>(A a, HKT3<F, U, L, Either<A, B>> Function(A) f);
}

abstract class ChainRec2C<F extends HKT2, L> extends Chain2C<F, L> {
  HKT2<F, L, B> chainRec<A, B>(A a, HKT2<F, L, Either<A, B>> Function(A) f);
}

abstract class ChainRec3C<F extends HKT3, U, L> extends Chain3C<F, U, L> {
  HKT3<F, U, L, B> chainRec<A, B>(A a, HKT3<F, U, L, Either<A, B>> Function(A) f);
}

B tailRec<A, B>(Either<A, B> Function(A) f, A a) {
  var v = f(a);
  while (v.isLeft()) {
    v = f(v.value);
  }
  return v.value;
}