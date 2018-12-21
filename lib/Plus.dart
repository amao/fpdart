import 'package:fpdart/Alt.dart';
import 'package:fpdart/Hkt.dart';

abstract class Plus1<F extends HKT> extends Alt1<F> {
  HKT<F, A> zero<A>();
}

abstract class Plus2<F extends HKT2> extends Alt2<F> {
  HKT2<F, L, A> zero<L, A>();
}

abstract class Plus3<F extends HKT3> extends Alt3<F> {
  HKT3<F, U, L, A> zero<U, L, A>();
}

abstract class Plus2C<F extends HKT2, L> extends Alt2C<F, L> {
  HKT2<F, L, A> zero<A>();
}

abstract class Plus3C<F extends HKT3, U, L> extends Alt3C<F, U, L> {
  HKT3<F, U, L, A> zero<A>();
}



