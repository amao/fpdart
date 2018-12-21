import 'Functor.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/function.dart';

abstract class Extend1<F extends HKT> extends Functor1<F> {
  HKT<F, B> extend<A, B>(HKT<F, A> ea, B Function(HKT<F, A> fa) f);
}

abstract class Extend2<F extends HKT2> extends Functor2<F> {
  HKT2<F, L, B> extend<L, A, B>(HKT2<F, L, A> ea, B Function(HKT2<F, L, A> fa) f);
}

abstract class Extend3<F extends HKT3> extends Functor3<F> {
  HKT3<F, U, L, B> extend<U, L, A, B>(HKT3<F, U, L, A> ea, B Function(HKT3<F, U, L, A> fa) f);
}

abstract class Extend2C<F extends HKT2, L> extends Functor2C<F, L> {
  HKT2<F, L, B> extend<A, B>(HKT2<F, L, A> ea, B Function(HKT2<F, L, A> fa) f);
}

abstract class Extend3C<F extends HKT3, U, L> extends Functor3C<F, U, L> {
  HKT3<F, U, L, B> extend<A, B>(HKT3<F, U, L, A> ea, B Function(HKT3<F, U, L, A> fa) f);
}

// duplicate

HKT3<F, U, L, HKT3<F, U, L, A>> Function(HKT3<F, U, L, A> ma) duplicate3<F extends HKT3, U, L, A>(Extend3<F> E) {
  return (HKT3<F, U, L, A> ma) => E.extend(ma, identity);
}

HKT3<F, U, L, HKT3<F, U, L, A>> Function(HKT3<F, U, L, A> ma) duplicate3C<F extends HKT3, U, L, A>(Extend3C<F, U, L> E) {
  return (HKT3<F, U, L, A> ma) => E.extend(ma, identity);
}

HKT2<F, L, HKT2<F, L, A>> Function(HKT2<F, L, A> ma) duplicate2<F extends HKT2, L, A>(Extend2<F> E) {
  return (HKT2<F, L, A> ma) => E.extend(ma, identity);
}

HKT2<F, L, HKT2<F, L, A>> Function(HKT2<F, L, A> ma) duplicate2C<F extends HKT2, L, A>(Extend2C<F, L> E) {
  return (HKT2<F, L, A> ma) => E.extend(ma, identity);
}

HKT<F, HKT<F, A>> Function(HKT<F, A> ma) duplicate1<F extends HKT, A>(Extend1<F> E) {
  return (HKT<F, A> ma) => E.extend(ma, identity);
}