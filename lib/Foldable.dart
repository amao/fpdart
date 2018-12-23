import 'package:fpdart/Applicative.dart';
import 'package:fpdart/Apply.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Monad.dart';
import 'package:fpdart/Monoid.dart';
import 'package:fpdart/Option.dart';
import 'package:fpdart/Ord.dart';
import 'package:fpdart/Plus.dart';
import 'package:fpdart/Semiring.dart';
import 'package:fpdart/Setoid.dart';
import 'package:fpdart/function.dart';

abstract class Foldable1<F extends HKT> {
  B reduce<A, B>(HKT<F, A> fa, B b, B Function(B b, A a) f);
}

abstract class Foldable2<F extends HKT2> {
  B reduce<L, A, B>(HKT2<F, L, A> fa, B b, B Function(B b, A a) f);
}

abstract class Foldable3<F extends HKT3> {
  B reduce<U, L, A, B>(HKT3<F, U, L, A> fa, B b, B Function(B b, A a) f);
}

abstract class Foldable2C<F extends HKT2, L> {
  B reduce<A, B>(HKT2<F, L, A> fa, B b, B Function(B b, A a) f);
}

abstract class Foldable3C<F extends HKT3, U, L> {
  B reduce<A, B>(HKT3<F, U, L, A> fa, B b, B Function(B b, A a) f);
}

abstract class FoldableComposition11<F extends HKT, G extends HKT> {
  B reduce<A, B>(HKT<F, HKT<G, A>> fga, B b, B Function(B b, A a) f);
}

abstract class FoldableComposition12<F extends HKT, G extends HKT2> {
  B reduce<LG, A, B>(HKT<F, HKT2<G, LG, A>> fga, B b, B Function(B b, A a) f);
}

abstract class FoldableComposition12C<F extends HKT, G extends HKT2, LG> {
  B reduce<A, B>(HKT<F, HKT2<G, LG, A>> fga, B b, B Function(B b, A a) f);
}

abstract class FoldableComposition21<F extends HKT2, G extends HKT> {
  B reduce<LF, A, B>(HKT2<F, LF, HKT<G, A>> fga, B b, B Function(B b, A a) f);
}

abstract class FoldableComposition2C1<F extends HKT2, G extends HKT, LF> {
  B reduce<A, B>(HKT2<F, LF, HKT<G, A>> fga, B b, B Function(B b, A a) f);
}

abstract class FoldableComposition22<F extends HKT2, G extends HKT2> {
  B reduce<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, B b, B Function(B b, A a) f);
}

abstract class FoldableComposition22C<F extends HKT2, G extends HKT2, LG> {
  B reduce<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, B b, B Function(B b, A a) f);
}

abstract class FoldableComposition3C1<F extends HKT3, G extends HKT, UF, LF> {
  B reduce<A, B>(HKT3<F, UF, LF, HKT<G, A>> fga, B b, B Function(B b, A a) f);
}

class _GetFoldableComposition3C1<F extends HKT3, G extends HKT, UF, LF> extends FoldableComposition3C1<F, G, UF, LF> {
  final Foldable3C<F, UF, LF> f3cF;
  final Foldable1<G> f1G;
  _GetFoldableComposition3C1(this.f3cF, this.f1G);

  @override
  B reduce<A, B>(HKT3<F, UF, LF, HKT<G, A>> fga, B b, B Function(B b, A a) f) {
    return f3cF.reduce(fga, b, (b, ga) => f1G.reduce(ga, b, f));
  }
}
FoldableComposition3C1<F, G, UF, LF> getFoldableComposition3C1<F extends HKT3, G extends HKT, UF, LF>(Foldable3C<F, UF, LF> f3cF, Foldable1<G> f1G) {
  return _GetFoldableComposition3C1(f3cF, f1G);
}

class _GetFoldableComposition22C<F extends HKT2, G extends HKT2, LG> extends FoldableComposition22C<F, G, LG> {
  final Foldable2<F> f2F;
  final Foldable2C<G, LG> f2cG;
  _GetFoldableComposition22C(this.f2F, this.f2cG);

  @override
  B reduce<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, B b, B Function(B b, A a) f) {
    return f2F.reduce(fga, b, (b, ga) => f2cG.reduce(ga, b, f));
  }
}
FoldableComposition22C<F, G, LG> getFoldableComposition22C<F extends HKT2, G extends HKT2, LG>(Foldable2<F> f2F, Foldable2C<G, LG> f2cG) {
  return _GetFoldableComposition22C(f2F, f2cG);
}

class _GetFoldableComposition22<F extends HKT2, G extends HKT2> extends FoldableComposition22<F, G> {
  final Foldable2<F> f2F;
  final Foldable2<G> f2G;
  _GetFoldableComposition22(this.f2F, this.f2G);

  @override
  B reduce<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, B b, B Function(B b, A a) f) {
    return f2F.reduce(fga, b, (b, ga) => f2G.reduce(ga, b, f));
  }
}
FoldableComposition22<F, G> getFoldableComposition22<F extends HKT2, G extends HKT2>(Foldable2<F> f2F, Foldable2<G> f2G) {
  return _GetFoldableComposition22(f2F, f2G);
}

class _GetFoldableComposition21<F extends HKT2, G extends HKT> extends FoldableComposition21<F, G> {
  final Foldable2<F> f2F;
  final Foldable1<G> f1G;
  _GetFoldableComposition21(this.f2F, this.f1G);

  @override
  B reduce<LF, A, B>(HKT2<F, LF, HKT<G, A>> fga, B b, B Function(B b, A a) f) {
    return f2F.reduce(fga, b, (b, ga) => f1G.reduce(ga, b, f));
  }
}
FoldableComposition21<F, G> getFoldableComposition21<F extends HKT2, G extends HKT>(Foldable2<F> f2F, Foldable1<G> f1G) {
  return _GetFoldableComposition21(f2F, f1G);
}

class _GetFoldableComposition11<F extends HKT, G extends HKT> extends FoldableComposition11<F, G> {
  final Foldable1<F> f1F;
  final Foldable1<G> f1G;
  _GetFoldableComposition11(this.f1F, this.f1G);

  @override
  B reduce<A, B>(HKT<F, HKT<G, A>> fga, B b, B Function(B b, A a) f) {
    return f1F.reduce(fga, b, (b, ga) => f1G.reduce(ga, b, f));
  }
}
FoldableComposition11<F, G> getFoldableComposition11<F extends HKT, G extends HKT>(Foldable1<F> f1F, Foldable1<G> f1G) {
  return _GetFoldableComposition11(f1F, f1G);
}

// foldMap

M Function(HKT3<F, U, L, A> fa, M Function(A) f) foldMap3<F extends HKT3, M, U, L, A>(Foldable3<F> f3F, Monoid<M> m) {
  return (HKT3<F, U, L, A> fa, M Function(A) f) => f3F.reduce(fa, m.empty, (acc, x) => m.concat(acc, f(x)));
}

M Function(HKT3<F, U, L, A> fa, M Function(A) f) foldMap3C<F extends HKT3, M, U, L, A>(Foldable3C<F, U, L> f3cF, Monoid<M> m) {
  return (HKT3<F, U, L, A> fa, M Function(A) f) => f3cF.reduce(fa, m.empty, (acc, x) => m.concat(acc, f(x)));
}

M Function(HKT2<F, L, A> fa, M Function(A) f) foldMap2<F extends HKT2, M, L, A>(Foldable2<F> f2F, Monoid<M> m) {
  return (HKT2<F, L, A> fa, M Function(A) f) => f2F.reduce(fa, m.empty, (acc, x) => m.concat(acc, f(x)));
}

M Function(HKT2<F, L, A> fa, M Function(A) f) foldMap2C<F extends HKT2, M, L, A>(Foldable2C<F, L> f2cF, Monoid<M> m) {
  return (HKT2<F, L, A> fa, M Function(A) f) => f2cF.reduce(fa, m.empty, (acc, x) => m.concat(acc, f(x)));
}

M Function(HKT<F, A> fa, M Function(A) f) foldMap1<F extends HKT, M, A>(Foldable1<F> f1F, Monoid<M> m) {
  return (HKT<F, A> fa, M Function(A) f) => f1F.reduce(fa, m.empty, (acc, x) => m.concat(acc, f(x)));
}

// toArray

List<A> Function(HKT3<F, U, L, A> fa) toArray3<F extends HKT3, U, L, A>(Foldable3<F> f3F) {
  final foldMapF = foldMap3(f3F, unsafeMonoidArray());
  return (HKT3<F, U, L, A> fa) => foldMapF(fa, (a) => [a]);
}

List<A> Function(HKT3<F, U, L, A> fa) toArray3C<F extends HKT3, U, L, A>(Foldable3C<F, U, L> f3cF) {
  final foldMapF = foldMap3C(f3cF, unsafeMonoidArray());
  return (HKT3<F, U, L, A> fa) => foldMapF(fa, (a) => [a]);
}

List<A> Function(HKT2<F, L, A> fa) toArray2<F extends HKT2, L, A>(Foldable2<F> f2F) {
  final foldMapF = foldMap2(f2F, unsafeMonoidArray());
  return (HKT2<F, L, A> fa) => foldMapF(fa, (a) => [a]);
}

List<A> Function(HKT2<F, L, A> fa) toArray2C<F extends HKT2, L, A>(Foldable2C<F, L> f2cF) {
  final foldMapF = foldMap2C(f2cF, unsafeMonoidArray());
  return (HKT2<F, L, A> fa) => foldMapF(fa, (a) => [a]);
}

List<A> Function(HKT<F, A> fa) toArray1<F extends HKT, A>(Foldable1<F> f1F) {
  final foldMapF = foldMap1(f1F, unsafeMonoidArray());
  return (HKT<F, A> fa) => foldMapF(fa, (a) => [a]);
}

// foldr

B Function(HKT3<F, U, L, A> fa, B b, B Function(A a, B b) f) foldr3<F extends HKT3, U, L, A, B>(Foldable3<F> f3F) {
  final toArrayF = toArray3(f3F);
  return (HKT3<F, U, L, A> fa, B b, B Function(A a, B b) f) => toArrayF(fa).reversed.reduce((b, a) => f(a, b));
}

B Function(HKT3<F, U, L, A> fa, B b, B Function(A a, B b) f) foldr3C<F extends HKT3, U, L, A, B>(Foldable3C<F, U, L> f3cF) {
  final toArrayF = toArray3C(f3cF);
  return (HKT3<F, U, L, A> fa, B b, B Function(A a, B b) f) => toArrayF(fa).reversed.reduce((b, a) => f(a, b));
}

B Function(HKT2<F, L, A> fa, B b, B Function(A a, B b) f) foldr2<F extends HKT2, L, A, B>(Foldable2<F> f2F) {
  final toArrayF = toArray2(f2F);
  return (HKT2<F, L, A> fa, B b, B Function(A a, B b) f) => toArrayF(fa).reversed.reduce((b, a) => f(a, b));
}

B Function(HKT2<F, L, A> fa, B b, B Function(A a, B b) f) foldr2C<F extends HKT2, L, A, B>(Foldable2C<F, L> f2cF) {
  final toArrayF = toArray2C(f2cF);
  return (HKT2<F, L, A> fa, B b, B Function(A a, B b) f) => toArrayF(fa).reversed.reduce((b, a) => f(a, b));
}

B Function(HKT<F, A> fa, B b, B Function(A a, B b) f) foldr1<F extends HKT, A, B>(Foldable1<F> f1F) {
  final toArrayF = toArray1(f1F);
  return (HKT<F, A> fa, B b, B Function(A a, B b) f) => toArrayF(fa).reversed.reduce((b, a) => f(a, b));
}

// fold

M Function(HKT3<F, U, L, M> fa) fold3<F extends HKT3, M, U, L>(Foldable3<F> f3F, Monoid<M> m) {
  return (HKT3<F, U, L, M> fa) => f3F.reduce(fa, m.empty, m.concat);
}

M Function(HKT3<F, U, L, M> fa) fold3C<F extends HKT3, M, U, L>(Foldable3C<F, U, L> f3cF, Monoid<M> m) {
  return (HKT3<F, U, L, M> fa) => f3cF.reduce(fa, m.empty, m.concat);
}

M Function(HKT2<F, L, M> fa) fold2<F extends HKT2, M, L>(Foldable2<F> f2F, Monoid<M> m) {
  return (HKT2<F, L, M> fa) => f2F.reduce(fa, m.empty, m.concat);
}

M Function(HKT2<F, L, M> fa) fold2C<F extends HKT2, M, L>(Foldable2C<F, L> f2cF, Monoid<M> m) {
  return (HKT2<F, L, M> fa) => f2cF.reduce(fa, m.empty, m.concat);
}

M Function(HKT<F, M> fa) fold1<F extends HKT, M>(Foldable1<F> f1F, Monoid<M> m) {
  return (HKT<F, M> fa) => f1F.reduce(fa, m.empty, m.concat);
}

// foldM

HKT3<M, U, L, B> Function(HKT3<M, U, L, B> Function(B b, A a) f, B b, HKT<F, A> fa) foldM3<F extends HKT, M extends HKT3, U, L, A, B>(Foldable1<F> f1, Monad3<M> m3) {
  return (HKT3<M, U, L, B> Function(B b, A a) f, B b, HKT<F, A> fa) => f1.reduce(fa, m3.of(b), (mb, a) => m3.chain(mb, (b) => f(b, a)));
}

HKT3<M, U, L, B> Function(HKT3<M, U, L, B> Function(B b, A a) f, B b, HKT<F, A> fa) foldM3C<F extends HKT, M extends HKT3, U, L, A, B>(Foldable1<F> f1, Monad3C<M, U, L> m3c) {
  return (HKT3<M, U, L, B> Function(B b, A a) f, B b, HKT<F, A> fa) => f1.reduce(fa, m3c.of(b), (mb, a) => m3c.chain(mb, (b) => f(b, a)));
}

HKT2<M, L, B> Function(HKT2<M, L, B> Function(B b, A a) f, B b, HKT<F, A> fa) foldM2<F extends HKT, M extends HKT2, L, A, B>(Foldable1<F> f1, Monad2<M> m2) {
  return (HKT2<M, L, B> Function(B b, A a) f, B b, HKT<F, A> fa) => f1.reduce(fa, m2.of(b), (mb, a) => m2.chain(mb, (b) => f(b, a)));
}

HKT2<M, L, B> Function(HKT2<M, L, B> Function(B b, A a) f, B b, HKT<F, A> fa) foldM2C<F extends HKT, M extends HKT2, L, A, B>(Foldable1<F> f1, Monad2C<M, L> m2c) {
  return (HKT2<M, L, B> Function(B b, A a) f, B b, HKT<F, A> fa) => f1.reduce(fa, m2c.of(b), (mb, a) => m2c.chain(mb, (b) => f(b, a)));
}

HKT<M, B> Function(HKT<M, B> Function(B b, A a) f, B b, HKT<F, A> fa) foldM1<F extends HKT, M extends HKT, A, B>(Foldable1<F> f1, Monad1<M> m1) {
  return (HKT<M, B> Function(B b, A a) f, B b, HKT<F, A> fa) => f1.reduce(fa, m1.of(b), (mb, a) => m1.chain(mb, (b) => f(b, a)));
}

// traverse_

HKT3<M, U, L, void> Function(HKT3<M, U, L, B> Function(A) f, HKT<F, A> fa) traverse_3<M extends HKT3, F extends HKT, U, L, A, B>(Applicative3<M> a3, Foldable1<F> f1) {
  final toArrayF = toArray1(f1);
  final applyFirstM = applyFirst3(a3);
  //final initialValue = a3.of(null);
  return (HKT3<M, U, L, B> Function(A) f, HKT<F, A> fa) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

HKT3<M, U, L, void> Function(HKT3<M, U, L, B> Function(A) f, HKT<F, A> fa) traverse_3C<M extends HKT3, F extends HKT, U, L, A, B>(Applicative3C<M, U, L> a3c, Foldable1<F> f1) {
  final toArrayF = toArray1(f1);
  final applyFirstM = applyFirst3C(a3c);
  //final initialValue = a3c.of(null);
  return (HKT3<M, U, L, B> Function(A) f, HKT<F, A> fa) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

HKT2<M, L, void> Function(HKT2<M, L, B> Function(A) f, HKT<F, A> fa) traverse_2<M extends HKT2, F extends HKT, L, A, B>(Applicative2<M> a2, Foldable1<F> f1) {
  final toArrayF = toArray1(f1);
  final applyFirstM = applyFirst2(a2);
  //final initialValue = a2.of(null);
  return (HKT2<M, L, B> Function(A) f, HKT<F, A> fa) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

HKT2<M, L, void> Function(HKT2<M, L, B> Function(A) f, HKT<F, A> fa) traverse_2C<M extends HKT2, F extends HKT, L, A, B>(Applicative2C<M, L> a2c, Foldable1<F> f1) {
  final toArrayF = toArray1(f1);
  final applyFirstM = applyFirst2C(a2c);
  //final initialValue = a2c.of(null);
  return (HKT2<M, L, B> Function(A) f, HKT<F, A> fa) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

HKT<M, void> Function(HKT<M, B> Function(A) f, HKT<F, A> fa) traverse_1<M extends HKT, F extends HKT, A, B>(Applicative1<M> a1, Foldable1<F> f1) {
  final toArrayF = toArray1(f1);
  final applyFirstM = applyFirst(a1);
  //final initialValue = a1.of(null);
  return (HKT<M, B> Function(A) f, HKT<F, A> fa) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

// sequence_

HKT3<M, U, L, void> Function(HKT<F, HKT3<M, U, L, A>> fa) sequence_3<M extends HKT3, F extends HKT, U, L, A, B>(Applicative3<M> a3, Foldable1<F> f1) {
  final traverse_MF = traverse_3(a3, f1);
  return (HKT<F, HKT3<M, U, L, A>> fa) => traverse_MF((ma) => ma, fa);
}

HKT3<M, U, L, void> Function(HKT<F, HKT3<M, U, L, A>> fa) sequence_3C<M extends HKT3, F extends HKT, U, L, A, B>(Applicative3C<M, U, L> a3c, Foldable1<F> f1) {
  final traverse_MF = traverse_3C(a3c, f1);
  return (HKT<F, HKT3<M, U, L, A>> fa) => traverse_MF((ma) => ma, fa);
}

HKT2<M, L, void> Function(HKT<F, HKT2<M, L, A>> fa) sequence_2<M extends HKT2, F extends HKT, L, A, B>(Applicative2<M> a2, Foldable1<F> f1) {
  final traverse_MF = traverse_2(a2, f1);
  return (HKT<F, HKT2<M, L, A>> fa) => traverse_MF((ma) => ma, fa);
}

HKT2<M, L, void> Function(HKT<F, HKT2<M, L, A>> fa) sequence_2C<M extends HKT2, F extends HKT, L, A, B>(Applicative2C<M, L> a2c, Foldable1<F> f1) {
  final traverse_MF = traverse_2C(a2c, f1);
  return (HKT<F, HKT2<M, L, A>> fa) => traverse_MF((ma) => ma, fa);
}

HKT<M, void> Function(HKT<F, HKT<M, A>> fa) sequence_1<M extends HKT, F extends HKT, A, B>(Applicative1<M> a1, Foldable1<F> f1) {
  final traverse_MF = traverse_1(a1, f1);
  return (HKT<F, HKT<M, A>> fa) => traverse_MF((ma) => ma, fa);
}

// oneOf

HKT3<P, U, L, A> Function(HKT<F, HKT3<P, U, L, A>> fga) oneOf3<F extends HKT, P extends HKT3, U, L, A>(Foldable1<F> f1, Plus3<P> p3) {
  return (HKT<F, HKT3<P, U, L, A>> fga) => f1.reduce(fga, p3.zero(), (acc, a) => p3.alt(acc, a));
}

HKT3<P, U, L, A> Function(HKT<F, HKT3<P, U, L, A>> fga) oneOf3C<F extends HKT, P extends HKT3, U, L, A>(Foldable1<F> f1, Plus3C<P, U, L> p3c) {
  return (HKT<F, HKT3<P, U, L, A>> fga) => f1.reduce(fga, p3c.zero(), (acc, a) => p3c.alt(acc, a));
}

HKT2<P, L, A> Function(HKT<F, HKT2<P, L, A>> fga) oneOf2<F extends HKT, P extends HKT2, L, A>(Foldable1<F> f1, Plus2<P> p2) {
  return (HKT<F, HKT2<P, L, A>> fga) => f1.reduce(fga, p2.zero(), (acc, a) => p2.alt(acc, a));
}

HKT2<P, L, A> Function(HKT<F, HKT2<P, L, A>> fga) oneOf2C<F extends HKT, P extends HKT2, L, A>(Foldable1<F> f1, Plus2C<P, L> p2c) {
  return (HKT<F, HKT2<P, L, A>> fga) => f1.reduce(fga, p2c.zero(), (acc, a) => p2c.alt(acc, a));
}

HKT<P, A> Function(HKT<F, HKT<P, A>> fga) oneOf1<F extends HKT, P extends HKT, A>(Foldable1<F> f1, Plus1<P> p1) {
  return (HKT<F, HKT<P, A>> fga) => f1.reduce(fga, p1.zero(), (acc, a) => p1.alt(acc, a));
}

// intercalater

class _Acc<M> {
  final bool init;
  final M acc;

  _Acc({this.init, this.acc});
}

M Function(HKT3<F, U, L, M> fm) Function(M sep) intercalater3<F extends HKT3, M, U, L>(Foldable3<F> f3, Monoid<M> m) {
  return (M sep) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return (HKT3<F, U, L, M> fm) => f3.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

M Function(HKT3<F, U, L, M> fm) Function(M sep) intercalater3C<F extends HKT3, M, U, L>(Foldable3C<F, U, L> f3c, Monoid<M> m) {
  return (M sep) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return (HKT3<F, U, L, M> fm) => f3c.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

M Function(HKT2<F, L, M> fm) Function(M sep) intercalater2<F extends HKT2, M, L>(Foldable2<F> f2, Monoid<M> m) {
  return (M sep) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return (HKT2<F, L, M> fm) => f2.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

M Function(HKT2<F, L, M> fm) Function(M sep) intercalater2C<F extends HKT2, M, L>(Foldable2C<F, L> f2c, Monoid<M> m) {
  return (M sep) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return (HKT2<F, L, M> fm) => f2c.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

M Function(HKT<F, M> fm) Function(M sep) intercalater1<F extends HKT, M>(Foldable1<F> f1, Monoid<M> m) {
  return (M sep) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return (HKT<F, M> fm) => f1.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

// sum

A Function(HKT3<F, U, L, A> fa) sum3<F extends HKT3, A, U, L>(Foldable3<F> f3, Semiring<A> S) {
  return (HKT3<F, U, L, A> fa) => f3.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

A Function(HKT3<F, U, L, A> fa) sum3C<F extends HKT3, A, U, L>(Foldable3C<F, U, L> f3c, Semiring<A> S) {
  return (HKT3<F, U, L, A> fa) => f3c.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

A Function(HKT2<F, L, A> fa) sum2<F extends HKT2, A, L>(Foldable2<F> f2, Semiring<A> S) {
  return (HKT2<F, L, A> fa) => f2.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

A Function(HKT2<F, L, A> fa) sum2C<F extends HKT2, A, L>(Foldable2C<F, L> f2c, Semiring<A> S) {
  return (HKT2<F, L, A> fa) => f2c.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

A Function(HKT<F, A> fa) sum1<F extends HKT, A>(Foldable1<F> f1, Semiring<A> S) {
  return (HKT<F, A> fa) => f1.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

// product

A Function(HKT3<F, U, L, A> fa) product3<F extends HKT3, A, U, L>(Foldable3<F> f3, Semiring<A> S) {
  return (HKT3<F, U, L, A> fa) => f3.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

A Function(HKT3<F, U, L, A> fa) product3C<F extends HKT3, A, U, L>(Foldable3C<F, U, L> f3c, Semiring<A> S) {
  return (HKT3<F, U, L, A> fa) => f3c.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

A Function(HKT2<F, L, A> fa) product2<F extends HKT2, A, L>(Foldable2<F> f2, Semiring<A> S) {
  return (HKT2<F, L, A> fa) => f2.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

A Function(HKT2<F, L, A> fa) product2C<F extends HKT2, A, L>(Foldable2C<F, L> f2c, Semiring<A> S) {
  return (HKT2<F, L, A> fa) => f2c.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

A Function(HKT<F, A> fa) product1<F extends HKT, A>(Foldable1<F> f1, Semiring<A> S) {
  return (HKT<F, A> fa) => f1.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

// elem

bool Function(A a, HKT3<F, U, L, A> fa) elem3<F extends HKT3, A, U, L>(Foldable3<F> f3, Setoid<A> S) {
  return (A a, HKT3<F, U, L, A> fa) => f3.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

bool Function(A a, HKT3<F, U, L, A> fa) elem3C<F extends HKT3, A, U, L>(Foldable3C<F, U, L> f3c, Setoid<A> S) {
  return (A a, HKT3<F, U, L, A> fa) => f3c.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

bool Function(A a, HKT2<F, L, A> fa) elem2<F extends HKT2, A, L>(Foldable2<F> f2, Setoid<A> S) {
  return (A a, HKT2<F, L, A> fa) => f2.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

bool Function(A a, HKT2<F, L, A> fa) elem2C<F extends HKT2, A, L>(Foldable2C<F, L> f2c, Setoid<A> S) {
  return (A a, HKT2<F, L, A> fa) => f2c.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

bool Function(A a, HKT<F, A> fa) elem1<F extends HKT, A>(Foldable1<F> f1, Setoid<A> S) {
  return (A a, HKT<F, A> fa) => f1.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

// find

Option<A> Function(HKT3<F, U, L, A> fa, Predicate<A> p) find3<F extends HKT3, U, L, A>(Foldable3<F> f3) {
  return (HKT3<F, U, L, A> fa, Predicate<A> p) => f3.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

Option<A> Function(HKT3<F, U, L, A> fa, Predicate<A> p) find3C<F extends HKT3, U, L, A>(Foldable3C<F, U, L> f3c) {
  return (HKT3<F, U, L, A> fa, Predicate<A> p) => f3c.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

Option<A> Function(HKT2<F, L, A> fa, Predicate<A> p) find2<F extends HKT2, L, A>(Foldable2<F> f2) {
  return (HKT2<F, L, A> fa, Predicate<A> p) => f2.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

Option<A> Function(HKT2<F, L, A> fa, Predicate<A> p) find2C<F extends HKT2, L, A>(Foldable2C<F, L> f2c) {
  return (HKT2<F, L, A> fa, Predicate<A> p) => f2c.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

Option<A> Function(HKT<F, A> fa, Predicate<A> p) find1<F extends HKT, A>(Foldable1<F> f1) {
  return (HKT<F, A> fa, Predicate<A> p) => f1.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

// minimum

Option<A> Function(HKT3<F, U, L, A> fa) minimum3<F extends HKT3, U, L, A>(Foldable3<F> f3, Ord<A> O) {
  final minO = min(O);
  return (HKT3<F, U, L, A> fa) => f3.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

Option<A> Function(HKT3<F, U, L, A> fa) minimum3C<F extends HKT3, U, L, A>(Foldable3C<F, U, L> f3c, Ord<A> O) {
  final minO = min(O);
  return (HKT3<F, U, L, A> fa) => f3c.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

Option<A> Function(HKT2<F, L, A> fa) minimum2<F extends HKT2, L, A>(Foldable2<F> f2, Ord<A> O) {
  final minO = min(O);
  return (HKT2<F, L, A> fa) => f2.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

Option<A> Function(HKT2<F, L, A> fa) minimum2C<F extends HKT2, L, A>(Foldable2C<F, L> f2c, Ord<A> O) {
  final minO = min(O);
  return (HKT2<F, L, A> fa) => f2c.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

Option<A> Function(HKT<F, A> fa) minimum1<F extends HKT, A>(Foldable1<F> f1, Ord<A> O) {
  final minO = min(O);
  return (HKT<F, A> fa) => f1.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

// maximum

Option<A> Function(HKT3<F, U, L, A> fa) maximum3<F extends HKT3, U, L, A>(Foldable3<F> f3, Ord<A> O) {
  final maxO = max(O);
  return (HKT3<F, U, L, A> fa) => f3.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}

Option<A> Function(HKT3<F, U, L, A> fa) maximum3C<F extends HKT3, U, L, A>(Foldable3C<F, U, L> f3c, Ord<A> O) {
  final maxO = max(O);
  return (HKT3<F, U, L, A> fa) => f3c.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}

Option<A> Function(HKT2<F, L, A> fa) maximum2<F extends HKT2, L, A>(Foldable2<F> f2, Ord<A> O) {
  final maxO = max(O);
  return (HKT2<F, L, A> fa) => f2.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}

Option<A> Function(HKT2<F, L, A> fa) maximum2C<F extends HKT2, L, A>(Foldable2C<F, L> f2c, Ord<A> O) {
  final maxO = max(O);
  return (HKT2<F, L, A> fa) => f2c.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}

Option<A> Function(HKT<F, A> fa) maximum1<F extends HKT, A>(Foldable1<F> f1, Ord<A> O) {
  final maxO = max(O);
  return (HKT<F, A> fa) => f1.reduce(fa, none, (Option<A> b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}

// traverse
HKT3<M, U, L, void> Function(HKT<F, A> fa, HKT3<M, U, L, B> Function(A) f) traverse3<M extends HKT3, F extends HKT, U, L, A, B>(Applicative3<M> a3M, Foldable1<F> f1F) {
  final HKT3<M, U, L, void> Function(HKT3<M, U, L, B> Function(A), HKT<F, A>) traverseMF = traverse_3(a3M, f1F);
  return (HKT<F, A> fa, HKT3<M, U, L, B> Function(A) f) => traverseMF(f, fa);
}

HKT3<M, U, L, void> Function(HKT<F, A> fa, HKT3<M, U, L, B> Function(A) f) traverse3C<M extends HKT3, F extends HKT, U, L, A, B>(Applicative3C<M, U, L> a3cM, Foldable1<F> f1F) {
  final HKT3<M, U, L, void> Function(HKT3<M, U, L, B> Function(A), HKT<F, A>) traverseMF = traverse_3C(a3cM, f1F);
  return (HKT<F, A> fa, HKT3<M, U, L, B> Function(A) f) => traverseMF(f, fa);
}

HKT2<M, L, void> Function(HKT<F, A> fa, HKT2<M, L, B> Function(A) f) traverse2<M extends HKT2, F extends HKT, L, A, B>(Applicative2<M> a2M, Foldable1<F> f1F) {
  final HKT2<M, L, void> Function(HKT2<M, L, B> Function(A), HKT<F, A>) traverseMF = traverse_2(a2M, f1F);
  return (HKT<F, A> fa, HKT2<M, L, B> Function(A) f) => traverseMF(f, fa);
}

HKT2<M, L, void> Function(HKT<F, A> fa, HKT2<M, L, B> Function(A) f) traverse2C<M extends HKT2, F extends HKT, L, A, B>(Applicative2C<M, L> a2cM, Foldable1<F> f1F) {
  final HKT2<M, L, void> Function(HKT2<M, L, B> Function(A), HKT<F, A>) traverseMF = traverse_2C(a2cM, f1F);
  return (HKT<F, A> fa, HKT2<M, L, B> Function(A) f) => traverseMF(f, fa);
}

HKT<M, void> Function(HKT<F, A> fa, HKT<M, B> Function(A) f) traverse1<M extends HKT, F extends HKT, A, B>(Applicative1<M> a1M, Foldable1<F> f1F) {
  final HKT<M, void> Function(HKT<M, B> Function(A), HKT<F, A>) traverseMF = traverse_1(a1M, f1F);
  return (HKT<F, A> fa, HKT<M, B> Function(A) f) => traverseMF(f, fa);
}