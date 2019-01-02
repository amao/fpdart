import 'package:fpdart/Applicative.dart';
import 'package:fpdart/Foldable.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Hkt.dart';

abstract class Traverse1<T extends HKT> {
  HKT3<F, FU, FL, HKT<T, B>> Function(HKT<T, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3<F extends HKT3, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT<T, B>> Function(HKT<T, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3C<F extends HKT3, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT<T, B>> Function(HKT<T, A> ta, HKT2<F, FL, B> Function(A) f) traverse2<F extends HKT2, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT<T, B>> Function(HKT<T, A> ta, HKT2<F, FL, B> Function(A) f) traverse2C<F extends HKT2, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT<T, B>> Function(HKT<T, A> ta, HKT<F, B> Function(A) f) traverse1<F extends HKT, A, B>(Applicative1<F> a1F);
}

abstract class Traverse2<T extends HKT2> {
  HKT3<F, FU, FL, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3<F extends HKT3, TL, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3C<F extends HKT3, TL, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT2<F, FL, B> Function(A) f) traverse2<F extends HKT2, TL, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT2<F, FL, B> Function(A) f) traverse2C<F extends HKT2, TL, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT<F, B> Function(A) f) traverse1<F extends HKT, TL, A, B>(Applicative1<F> a1F);
}

abstract class Traverse2C<T extends HKT2, TL> {
  HKT3<F, FU, FL, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3<F extends HKT3, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3C<F extends HKT3, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT2<F, FL, B> Function(A) f) traverse2<F extends HKT2, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT2<F, FL, B> Function(A) f) traverse2C<F extends HKT2, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT2<T, TL, B>> Function(HKT2<T, TL, A> ta, HKT<F, B> Function(A) f) traverse1<F extends HKT, A, B>(Applicative1<F> a1F);
}

abstract class Traverse3<T extends HKT3> {
  HKT3<F, FU, FL, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3<F extends HKT3, TU, TL, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3C<F extends HKT3, TU, TL, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT2<F, FL, B> Function(A) f) traverse2<F extends HKT2, TU, TL, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT2<F, FL, B> Function(A) f) traverse2C<F extends HKT2, TU, TL, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT<F, B> Function(A) f) traverse1<F extends HKT, TU, TL, A, B>(Applicative1<F> a1F);
}

abstract class Traverse3C<T extends HKT3, TU, TL> {
  HKT3<F, FU, FL, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3<F extends HKT3, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT3<F, FU, FL, B> Function(A) f) traverse3C<F extends HKT3, TU, TL, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT2<F, FL, B> Function(A) f) traverse2<F extends HKT2, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT2<F, FL, B> Function(A) f) traverse2C<F extends HKT2, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT3<T, TU, TL, B>> Function(HKT3<T, TU, TL, A> ta, HKT<F, B> Function(A) f) traverse1<F extends HKT, A, B>(Applicative1<F> a1F);
}


abstract class Traversable1<T extends HKT> implements Functor1<T>, Foldable1<T>, Traverse1<T> {
}

abstract class Traversable2<T extends HKT2> implements Functor2<T>, Foldable2<T> {
  Traverse2<T> traverse;
}

abstract class Traversable2C<T extends HKT2, TL> implements Functor2C<T, TL>, Foldable2C<T, TL> {
  Traverse2C<T, TL> traverse;
}

abstract class Traversable3<T extends HKT3> implements Functor3<T>, Foldable3<T> {
  Traverse3<T> traverse;
}

abstract class Traversable3C<T extends HKT3, TU, TL> implements Functor3C<T, TU, TL>, Foldable3C<T, TU, TL> {
  Traverse3C<T, TU, TL> traverse;
}

abstract class TraversableComposition11<F extends HKT, G extends HKT> implements FoldableComposition11<F, G>, FunctorComposition11<F, G> {
  HKT<H, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT<H, B> Function(A) f) traverse<H extends HKT, A, B>(Applicative1<H> a1H);
}

HKT3<F, UF, LF, HKT2<T, LT, B>> Function(HKT2<T, LT, A> ta, HKT3<F, UF, LF, B> Function(A) f) traverse32<F extends HKT3, T extends HKT2, UF, LF, LT, A, B>(Applicative3<F> a3F, Traversable2<T> t2T) {
  return t2T.traverse.traverse3(a3F);
}

HKT2<F, LF, HKT2<T, LT, B>> Function(HKT2<T, LT, A> ta, HKT2<F, LF, B> Function(A) f) traverse22<F extends HKT2, T extends HKT2, LF, LT, A, B>(Applicative2<F> a2F, Traversable2<T> t2T) {
  return t2T.traverse.traverse2(a2F);
}

HKT2<F, LF, HKT2<T, LT, B>> Function(HKT2<T, LT, A> ta, HKT2<F, LF, B> Function(A) f) traverse2C2<F extends HKT2, T extends HKT2, LF, LT, A, B>(Applicative2C<F, LF> a2cF, Traversable2<T> t2T) {
  return t2T.traverse.traverse2C(a2cF);
}

HKT<F, HKT2<T, LT, B>> Function(HKT2<T, LT, A> ta, HKT<F, B> Function(A) f) traverse12<F extends HKT, T extends HKT2, LT, A, B>(Applicative1<F> a1F, Traversable2<T> t2T) {
  return t2T.traverse.traverse1(a1F);
}

HKT3<F, U, L, HKT<T, B>> Function(HKT<T, A> ta, HKT3<F, U, L, B> Function(A) f) traverse31<F extends HKT3, T extends HKT, U, L, A, B>(Applicative3<F> a3F, Traversable1<T> t1T) {
  return t1T.traverse3(a3F);
}

HKT2<F, L, HKT<T, B>> Function(HKT<T, A> ta, HKT2<F, L, B> Function(A) f) traverse21<F extends HKT2, T extends HKT, L, A, B>(Applicative2<F> a2F, Traversable1<T> t1T) {
  return t1T.traverse2(a2F);
}

HKT2<F, L, HKT<T, B>> Function(HKT<T, A> ta, HKT2<F, L, B> Function(A) f) traverse2C1<F extends HKT2, T extends HKT, L, A, B>(Applicative2C<F, L> a2cF, Traversable1<T> t1T) {
  return t1T.traverse2C(a2cF);
}

HKT<F, HKT<T, B>> Function(HKT<T, A> ta, HKT<F, B> Function(A) f) traverse11<F extends HKT, T extends HKT, A, B>(Applicative1<F> a1F, Traversable1<T> t1T) {
  return t1T.traverse1(a1F);
}

// sequence
HKT2<F, LF, HKT2<T, LT, A>> Function(HKT2<T, LT, HKT2<F, LF, A>> tfa) sequence22<F extends HKT2, T extends HKT2, LF, LT, A>(Applicative2<F> a2F, Traversable2<T> t2T) {
  return (HKT2<T, LT, HKT2<F, LF, A>> tfa) => t2T.traverse.traverse2(a2F)(tfa, (fa) => fa);
}

HKT2<F, LF, HKT2<T, LT, A>> Function(HKT2<T, LT, HKT2<F, LF, A>> tfa) sequence2C2<F extends HKT2, T extends HKT2, LF, LT, A>(Applicative2C<F, LF> a2cF, Traversable2<T> t2T) {
  return (HKT2<T, LT, HKT2<F, LF, A>> tfa) => t2T.traverse.traverse2C(a2cF)(tfa, (fa) => fa);
}

HKT<F, HKT2<T, LT, A>> Function(HKT2<T, LT, HKT<F, A>> tfa) sequence12<F extends HKT, T extends HKT2, LT, A>(Applicative1<F> a1F, Traversable2<T> t2T) {
  return (HKT2<T, LT, HKT<F, A>> tfa) => t2T.traverse.traverse1(a1F)(tfa, (fa) => fa);
}

HKT3<F, UF, LF, HKT<T, A>> Function(HKT<T, HKT3<F, UF, LF, A>> tfa) sequence31<F extends HKT3, T extends HKT, UF, LF, A>(Applicative3<F> a3F, Traversable1<T> t1T) {
  return (HKT<T, HKT3<F, UF, LF, A>> tfa) => t1T.traverse3(a3F)(tfa, (fa) => fa);
}

HKT3<F, UF, LF, HKT<T, A>> Function(HKT<T, HKT3<F, UF, LF, A>> tfa) sequence3C1<F extends HKT3, T extends HKT, UF, LF, A>(Applicative3C<F, UF, LF> a3cF, Traversable1<T> t1T) {
  return (HKT<T, HKT3<F, UF, LF, A>> tfa) => t1T.traverse3C(a3cF)(tfa, (fa) => fa);
}

HKT2<F, LF, HKT<T, A>> Function(HKT<T, HKT2<F, LF, A>> tfa) sequence21<F extends HKT2, T extends HKT, LF, A>(Applicative2<F> a2F, Traversable1<T> t1T) {
  return (HKT<T, HKT2<F, LF, A>> tfa) => t1T.traverse2(a2F)(tfa, (fa) => fa);
}

HKT2<F, LF, HKT<T, A>> Function(HKT<T, HKT2<F, LF, A>> tfa) sequence2C1<F extends HKT2, T extends HKT, LF, A>(Applicative2C<F, LF> a2cF, Traversable1<T> t1T) {
  return (HKT<T, HKT2<F, LF, A>> tfa) => t1T.traverse2C(a2cF)(tfa, (fa) => fa);
}

HKT<F, HKT<T, A>> Function(HKT<T, HKT<F, A>> tfa) sequence11<F extends HKT, T extends HKT, A>(Applicative1<F> a1F, Traversable1<T> t1T) {
  return (HKT<T, HKT<F, A>> tfa) => t1T.traverse1(a1F)(tfa, (fa) => fa);
}

class _GetTraversableComposition<F extends HKT, G extends HKT> extends TraversableComposition11<F,G> {
  final Traversable1<F> t1F;
  final Traversable1<G> t1G;
  _GetTraversableComposition(this.t1F, this.t1G);

  @override
  HKT<H, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT<H, B> Function(A) f) traverse<H extends HKT, A, B>(Applicative1<H> a1H) {
    final traverseF = t1F.traverse1(a1H);
    final traverseG = t1G.traverse1(a1H);
    return (HKT<F, HKT<G, A>> fga, HKT<H, B> Function(A) f) => traverseF(fga, (ga) => traverseG(ga, f as dynamic));
  }

  @override
  HKT<F, HKT<G, B>> map<A, B>(HKT<F, HKT<G, A>> fa, B Function(A a) f) {
    return getFunctorComposition(t1F, t1G).map(fa, f);
  }

  @override
  B reduce<A, B>(HKT<F, HKT<G, A>> fga, B b, f) {
    return getFoldableComposition11(t1F, t1G).reduce(fga, b, f);
  }
}
TraversableComposition11<F,G> getTraversableComposition<F extends HKT, G extends HKT>(Traversable1<F> t1F, Traversable1<G> t1G) {
  return _GetTraversableComposition(t1F, t1G);
}























