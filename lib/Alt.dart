import 'package:fpdart/Functor.dart';
import 'package:fpdart/Hkt.dart';

abstract class Alt1<F extends HKT> extends Functor1<F> {
  HKT<F, A> alt<A>(HKT<F, A> fx, HKT<F, A> fy);
}

abstract class Alt2<F extends HKT2> extends Functor2<F> {
  HKT2<F, L, A> alt<L, A>(HKT2<F, L, A> fx, HKT2<F, L, A> fy);
}

abstract class Alt3<F extends HKT3> extends Functor3<F> {
  HKT3<F, U, L, A> alt<U, L, A>(HKT3<F, U, L, A> fx, HKT3<F, U, L, A> fy);
}

abstract class Alt2C<F extends HKT2, L> extends Functor2C<F, L> {
  HKT2<F, L, A> alt<L, A>(HKT2<F, L, A> fx, HKT2<F, L, A> fy);
}

abstract class Alt3C<F extends HKT3, U, L> extends Functor3C<F, U, L> {
  HKT3<F, U, L, A> alt<U, L, A>(HKT3<F, U, L, A> fx, HKT3<F, U, L, A> fy);
}


