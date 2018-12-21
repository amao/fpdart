import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Apply.dart';

abstract class Chain1<F extends HKT> extends Apply1<F> {
  HKT<F, B> chain<A, B>(HKT<F, A> fa, HKT<F, B> Function(A) f);
}

abstract class Chain2<F extends HKT2> extends Apply2<F> {
  HKT2<F, L, B> chain<L, A, B>(HKT2<F, L, A> fa, HKT2<F, L, B> Function(A) f);
}

abstract class Chain3<F extends HKT3> extends Apply3<F> {
  HKT3<F, U, L, B> chain<U, L, A, B>(HKT3<F, U, L, A> fa, HKT3<F, U, L, B> Function(A) f);
}

abstract class Chain2C<F extends HKT2, L> extends Apply2C<F, L> {
  HKT2<F, L, B> chain<A, B>(HKT2<F, L, A> fa, HKT2<F, L, B> Function(A) f);
}

abstract class Chain3C<F extends HKT3, U, L> extends Apply3C<F, U, L> {
  HKT3<F, U, L, B> chain<A, B>(HKT3<F, U, L, A> fa, HKT3<F, U, L, B> Function(A) f);
}

// flatten
HKT3<F, U, L, A> Function(HKT3<F, U, L, HKT3<F, U, L, A>>) flatten3<F extends HKT3, U, L, A>(Chain3<F> chain) {
  return (HKT3<F, U, L, HKT3<F, U, L, A>> mma) => chain.chain(mma, (HKT3<F, U, L, A> ma) => ma);
}

HKT3<F, U, L, A> Function(HKT3<F, U, L, HKT3<F, U, L, A>>) flatten3C<F extends HKT3, U, L, A>(Chain3C<F, U, L> chain) {
  return (HKT3<F, U, L, HKT3<F, U, L, A>> mma) => chain.chain(mma, (HKT3<F, U, L, A> ma) => ma);
}

HKT2<F, L, A> Function(HKT2<F, L, HKT2<F, L, A>>) flatten2<F extends HKT2, L, A>(Chain2<F> chain) {
  return (HKT2<F, L, HKT2<F, L, A>> mma) => chain.chain(mma, (HKT2<F, L, A> ma) => ma);
}

HKT2<F, L, A> Function(HKT2<F, L, HKT2<F, L, A>>) flatten2C<F extends HKT2, L, A>(Chain2C<F, L> chain) {
  return (HKT2<F, L, HKT2<F, L, A>> mma) => chain.chain(mma, (HKT2<F, L, A> ma) => ma);
}

HKT<F, A> Function(HKT<F, HKT<F, A>>) flatten1<F extends HKT, A>(Chain1<F> chain) {
  return (HKT<F, HKT<F, A>> mma) => chain.chain(mma, (HKT<F, A> ma) => ma);
}