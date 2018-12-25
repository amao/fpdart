import 'package:fpdart/Applicative.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Monad.dart';
import 'package:fpdart/Monoid.dart';
import 'package:fpdart/Option.dart';
import 'package:fpdart/Ord.dart';
import 'package:fpdart/Plus.dart';
import 'package:fpdart/Semiring.dart';
import 'package:fpdart/Setoid.dart';
import 'package:fpdart/function.dart';
import 'package:fpdart/Foldable.dart';
import 'package:fpdart/Apply.dart';

abstract class Foldable2v1<F extends HKT> extends Foldable1<F> {
  M Function(HKT<F, A> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m);
  B foldr<A, B>(HKT<F, A> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2v2<F extends HKT2> extends Foldable2<F> {
  M Function(HKT2<F, L, A> fa, M Function(A) f) foldMap<M, L, A>(Monoid<M> m);
  B foldr<L, A, B>(HKT2<F, L, A> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2v3<F extends HKT3> extends Foldable3<F> {
  M Function(HKT3<F, U, L, A> fa, M Function(A) f) foldMap<M, U, L, A>(Monoid<M> m);
  B foldr<U, L, A, B>(HKT3<F, U, L, A> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2v2C<F extends HKT2, L> extends Foldable2C<F, L> {
  M Function(HKT2<F, L, A> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m);
  B foldr<A, B>(HKT2<F, L, A> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2v3C<F extends HKT3, U, L> extends Foldable3C<F, U, L> {
  M Function(HKT3<F, U, L, A> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m);
  B foldr<A, B>(HKT3<F, U, L, A> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2vComposition11<F extends HKT, G extends HKT> extends FoldableComposition11<F, G> {
  M Function(HKT<F, HKT<G, A>> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m);
  B foldr<A, B>(HKT<F, HKT<G, A>> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2vComposition12<F extends HKT, G extends HKT2> extends FoldableComposition12<F, G> {
  M Function(HKT<F, HKT2<G, LG, A>> fa, M Function(A) f) foldMap<M, LG, A>(Monoid<M> m);
  B foldr<LG, A, B>(HKT<F, HKT2<G, LG, A>> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2vComposition12C<F extends HKT, G extends HKT2, LG> extends FoldableComposition12C<F, G, LG> {
  M Function(HKT<F, HKT2<G, LG, A>> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m);
  B foldr<A, B>(HKT<F, HKT2<G, LG, A>> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2vComposition21<F extends HKT2, G extends HKT> extends FoldableComposition21<F, G> {
  M Function(HKT2<F, LF, HKT<G, A>> fa, M Function(A) f) foldMap<M, LF, A>(Monoid<M> m);
  B foldr<LF, A, B>(HKT2<F, LF, HKT<G, A>> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2vComposition2C1<F extends HKT2, G extends HKT, LF> extends FoldableComposition2C1<F, G, LF> {
  M Function(HKT2<F, LF, HKT<G, A>> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m);
  B foldr<A, B>(HKT2<F, LF, HKT<G, A>> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2vComposition22<F extends HKT2, G extends HKT2> extends FoldableComposition22<F, G> {
  M Function(HKT2<F, LF, HKT2<G, LG, A>> fa, M Function(A) f) foldMap<M, LF, LG, A>(Monoid<M> m);
  B foldr<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2vComposition22C<F extends HKT2, G extends HKT2, LG> extends FoldableComposition22C<F, G, LG> {
  M Function(HKT2<F, LF, HKT2<G, LG, A>> fa, M Function(A) f) foldMap<M, LF, A>(Monoid<M> m);
  B foldr<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B b, B Function(A a, B b) f);
}

abstract class Foldable2vComposition3C1<F extends HKT3, G extends HKT, UF, LF> extends FoldableComposition3C1<F, G, UF, LF> {
  M Function(HKT3<F, UF, LF, HKT<G, A>> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m);
  B foldr<A, B>(HKT3<F, UF, LF, HKT<G, A>> fa, B b, B Function(A a, B b) f);
}

// getFoldableComposition

class _GetFoldableComposition3C1<F extends HKT3, G extends HKT, UF, LF> extends Foldable2vComposition3C1<F, G, UF, LF> {
  final Foldable2v3C<F, UF, LF> f2v3cF;
  final Foldable2v1<G> f2v1G;
  _GetFoldableComposition3C1(this.f2v3cF, this.f2v1G);

  @override
  B reduce<A, B>(HKT3<F, UF, LF, HKT<G, A>> fga, B b, B Function(B b, A a) f) {
    return f2v3cF.reduce(fga, b, (b, ga) => f2v1G.reduce(ga, b, f));
  }

  @override
  M Function(HKT3<F, UF, LF, HKT<G, A>> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m) {
    final foldMapF = f2v3cF.foldMap(m);
    final foldMapG = f2v1G.foldMap(m);
    return (HKT3<F, UF, LF, HKT<G, A>> fa, M Function(A) f) => foldMapF(fa, (ga) => foldMapG(ga, f));
  }

  @override
  B foldr<A, B>(HKT3<F, UF, LF, HKT<G, A>> fa, B b, B Function(A a, B b) f) {
    return f2v3cF.foldr(fa, b, (ga, b) => f2v1G.foldr(ga, b, f));
  }
}
Foldable2vComposition3C1<F, G, UF, LF> getFoldableComposition3C1<F extends HKT3, G extends HKT, UF, LF>(Foldable2v3C<F, UF, LF> f2v3cF, Foldable2v1<G> f2v1G) {
  return _GetFoldableComposition3C1(f2v3cF, f2v1G);
}

class _GetFoldableComposition22C<F extends HKT2, G extends HKT2, LG> extends Foldable2vComposition22C<F, G, LG> {
  final Foldable2v2<F> f2v2F;
  final Foldable2v2C<G, LG> f2v2cG;

  _GetFoldableComposition22C(this.f2v2F, this.f2v2cG);

  @override
  B reduce<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, B b, B Function(B b, A a) f) {
    return f2v2F.reduce(fga, b, (b, ga) => f2v2cG.reduce(ga, b, f));
  }

  @override
  M Function(HKT2<F, LF, HKT2<G, LG, A>> fa, M Function(A) f) foldMap<M, LF, A>(Monoid<M> m) {
    final foldMapF = f2v2F.foldMap(m);
    final foldMapG = f2v2cG.foldMap(m);
    return (HKT2<F, LF, HKT2<G, LG, A>> fa, M Function(A) f) => foldMapF(fa, (ga) => foldMapG(ga, f));
  }

  @override
  B foldr<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B b, B Function(A a, B b) f) {
    return f2v2F.foldr(fa, b, (ga, b) => f2v2cG.foldr(ga, b, f));
  }
}
Foldable2vComposition22C<F, G, LG> getFoldableComposition22C<F extends HKT2, G extends HKT2, LG>(Foldable2v2<F> f2v2F, Foldable2v2C<G, LG> f2v2cG) {
  return _GetFoldableComposition22C(f2v2F, f2v2cG);
}

class _GetFoldableComposition22<F extends HKT2, G extends HKT2> extends Foldable2vComposition22<F, G> {
  final Foldable2v2<F> f2v2F;
  final Foldable2v2<G> f2v2G;
  _GetFoldableComposition22(this.f2v2F, this.f2v2G);

  @override
  B reduce<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, B b, B Function(B b, A a) f) {
    return f2v2F.reduce(fga, b, (b, ga) => f2v2G.reduce(ga, b, f));
  }

  @override
  M Function(HKT2<F, LF, HKT2<G, LG, A>> fa, M Function(A) f) foldMap<M, LF, LG, A>(Monoid<M> m) {
    final foldMapF = f2v2F.foldMap(m);
    final foldMapG = f2v2G.foldMap(m);
    return (HKT2<F, LF, HKT2<G, LG, A>> fa, M Function(A) f) => foldMapF(fa, (ga) => foldMapG(ga, f));
  }

  @override
  B foldr<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B b, B Function(A a, B b) f) {
    return f2v2F.foldr(fa, b, (ga, b) => f2v2G.foldr(ga, b, f));
  }
}
Foldable2vComposition22<F, G> getFoldableComposition22<F extends HKT2, G extends HKT2>(Foldable2v2<F> f2v2F, Foldable2v2<G> f2v2G) {
  return _GetFoldableComposition22(f2v2F, f2v2G);
}

class _GetFoldableComposition2C1<F extends HKT2, G extends HKT, LF> extends Foldable2vComposition2C1<F, G, LF> {
  final Foldable2v2C<F, LF> f2v2cF;
  final Foldable2v1<G> f2v1G;
  _GetFoldableComposition2C1(this.f2v2cF, this.f2v1G);

  @override
  B reduce<A, B>(HKT2<F, LF, HKT<G, A>> fga, B b, B Function(B b, A a) f) {
    return f2v2cF.reduce(fga, b, (b, ga) => f2v1G.reduce(ga, b, f));
  }

  @override
  M Function(HKT2<F, LF, HKT<G, A>> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m) {
    final foldMapF = f2v2cF.foldMap(m);
    final foldMapG = f2v1G.foldMap(m);
    return (HKT2<F, LF, HKT<G, A>> fa, M Function(A) f) => foldMapF(fa, (ga) => foldMapG(ga, f));
  }

  @override
  B foldr<A, B>(HKT2<F, LF, HKT<G, A>> fa, B b, B Function(A a, B b) f) {
    return f2v2cF.foldr(fa, b, (ga, b) => f2v1G.foldr(ga, b, f));
  }
}
Foldable2vComposition2C1<F, G, LF> getFoldableComposition2C1<F extends HKT2, G extends HKT, LF>(Foldable2v2C<F, LF> f2v2cF, Foldable2v1<G> f2v1G) {
  return _GetFoldableComposition2C1(f2v2cF, f2v1G);
}

class _GetFoldableComposition21<F extends HKT2, G extends HKT> extends Foldable2vComposition21<F, G> {
  final Foldable2v2<F> f2v2F;
  final Foldable2v1<G> f2v1G;
  _GetFoldableComposition21(this.f2v2F, this.f2v1G);

  @override
  B reduce<LF, A, B>(HKT2<F, LF, HKT<G, A>> fga, B b, B Function(B b, A a) f) {
    return f2v2F.reduce(fga, b, (b, ga) => f2v1G.reduce(ga, b, f));
  }

  @override
  M Function(HKT2<F, LF, HKT<G, A>> fa, M Function(A) f) foldMap<M, LF, A>(Monoid<M> m) {
    final foldMapF = f2v2F.foldMap(m);
    final foldMapG = f2v1G.foldMap(m);
    return (HKT2<F, LF, HKT<G, A>> fa, M Function(A) f) => foldMapF(fa, (ga) => foldMapG(ga, f));
  }

  @override
  B foldr<LF, A, B>(HKT2<F, LF, HKT<G, A>> fa, B b, B Function(A a, B b) f) {
    return f2v2F.foldr(fa, b, (ga, b) => f2v1G.foldr(ga, b, f));
  }
}
Foldable2vComposition21<F, G> getFoldableComposition21<F extends HKT2, G extends HKT>(Foldable2v2<F> f2v2F, Foldable2v1<G> f2v1G) {
  return _GetFoldableComposition21(f2v2F, f2v1G);
}

class _GetFoldableComposition12C<F extends HKT, G extends HKT2, LG> extends Foldable2vComposition12C<F, G, LG> {
  final Foldable2v1<F> f2v1F;
  final Foldable2v2C<G, LG> f2v2cG;
  _GetFoldableComposition12C(this.f2v1F, this.f2v2cG);

  @override
  B reduce<A, B>(HKT<F, HKT2<G, LG, A>> fga, B b, B Function(B b, A a) f) {
    return f2v1F.reduce(fga, b, (b, ga) => f2v2cG.reduce(ga, b, f));
  }

  @override
  M Function(HKT<F, HKT2<G, LG, A>> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m) {
    final foldMapF = f2v1F.foldMap(m);
    final foldMapG = f2v2cG.foldMap(m);
    return (HKT<F, HKT2<G, LG, A>> fa, M Function(A) f) => foldMapF(fa, (ga) => foldMapG(ga, f));
  }

  @override
  B foldr<A, B>(HKT<F, HKT2<G, LG, A>> fa, B b, B Function(A a, B b) f) {
    return f2v1F.foldr(fa, b, (ga, b) => f2v2cG.foldr(ga, b, f));
  }
}
Foldable2vComposition12C<F, G, LG> getFoldableComposition12C<F extends HKT, G extends HKT2, LG>(Foldable2v1<F> f2v1F, Foldable2v2C<G, LG> f2v2cG) {
  return _GetFoldableComposition12C(f2v1F, f2v2cG);
}

class _GetFoldableComposition12<F extends HKT, G extends HKT2> extends Foldable2vComposition12<F, G> {
  final Foldable2v1<F> f2v1F;
  final Foldable2v2<G> f2v2G;

  _GetFoldableComposition12(this.f2v1F, this.f2v2G);

  @override
  B reduce<LG, A, B>(HKT<F, HKT2<G, LG, A>> fga, B b, Function(B b, A a) f) {
    return f2v1F.reduce(fga, b, (b, ga) => f2v2G.reduce(ga, b, f));
  }

  @override
  M Function(HKT<F, HKT2<G, LG, A>> fa, M Function(A) f) foldMap<M, LG, A>(Monoid<M> m) {
    final foldMapF = f2v1F.foldMap(m);
    final foldMapG = f2v2G.foldMap(m);
    return (HKT<F, HKT2<G, LG, A>> fa, M Function(A) f) => foldMapF(fa, (ga) => foldMapG(ga, f));
  }

  @override
  B foldr<LG, A, B>(HKT<F, HKT2<G, LG, A>> fa, B b, B Function(A a, B b) f) {
    return f2v1F.foldr(fa, b, (ga, b) => f2v2G.foldr(ga, b, f));
  }
}
Foldable2vComposition12<F, G> getFoldableComposition12<F extends HKT, G extends HKT2>(Foldable2v1<F> f2v1F, Foldable2v2<G> f2v2G) {
  return _GetFoldableComposition12(f2v1F, f2v2G);
}

class _GetFoldableComposition11<F extends HKT, G extends HKT> extends Foldable2vComposition11<F, G> {
  final Foldable2v1<F> f2v1F;
  final Foldable2v1<G> f2v1G;
  _GetFoldableComposition11(this.f2v1F, this.f2v1G);

  @override
  B reduce<A, B>(HKT<F, HKT<G, A>> fga, B b, Function(B b, A a) f) {
    return f2v1F.reduce(fga, b, (b, ga) => f2v1G.reduce(ga, b, f));
  }

  @override
  M Function(HKT<F, HKT<G, A>> fa, M Function(A) f) foldMap<M, A>(Monoid<M> m) {
    final foldMapF = f2v1F.foldMap(m);
    final foldMapG = f2v1G.foldMap(m);
    return (HKT<F, HKT<G, A>> fa, M Function(A) f) => foldMapF(fa, (ga) => foldMapG(ga, f));
  }

  @override
  B foldr<A, B>(HKT<F, HKT<G, A>> fa, B b, B Function(A a, B b) f) {
    return f2v1F.foldr(fa, b, (ga, b) => f2v1G.foldr(ga, b, f));
  }
}
Foldable2vComposition11<F, G> getFoldableComposition11<F extends HKT, G extends HKT>(Foldable2v1<F> f2v1F, Foldable2v1<G> f2v1G) {
  return _GetFoldableComposition11(f2v1F, f2v1G);
}

// fold

M Function(HKT3<F, U, L, M>) fold2v3<M, F extends HKT3, U, L>(Monoid<M> m, Foldable2v3<F> f2v3F) {
  return (HKT3<F, U, L, M> fa) => f2v3F.reduce(fa, m.empty, m.concat);
}

M Function(HKT3<F, U, L, M>) fold2v3C<M, F extends HKT3, U, L>(Monoid<M> m, Foldable2v3C<F, U, L> f2v3cF) {
  return (HKT3<F, U, L, M> fa) => f2v3cF.reduce(fa, m.empty, m.concat);
}

M Function(HKT2<F, L, M>) fold2v2<M, F extends HKT2, L>(Monoid<M> m, Foldable2v2<F> f2v2F) {
  return (HKT2<F, L, M> fa) => f2v2F.reduce(fa, m.empty, m.concat);
}

M Function(HKT2<F, L, M>) fold2v2C<M, F extends HKT2, L>(Monoid<M> m, Foldable2v2C<F, L> f2v2cF) {
  return (HKT2<F, L, M> fa) => f2v2cF.reduce(fa, m.empty, m.concat);
}

M Function(HKT<F, M>) fold2v1<M, F extends HKT>(Monoid<M> m, Foldable2v1<F> f2v1F) {
  return (HKT<F, M> fa) => f2v1F.reduce(fa, m.empty, m.concat);
}

// foldM

HKT3<M, U, L, B> Function(HKT<F, A> fa, B b, HKT3<M, U, L, B> Function(B b, A a) f) foldM2v3<M extends HKT3, F extends HKT, U, L, A, B>(Monad3<M> m, Foldable2v1<F> f2v1) {
  return (HKT<F, A> fa, B b, HKT3<M, U, L, B> Function(B b, A a) f) => f2v1.reduce(fa, m.of(b), (mb, a) => m.chain(mb, (b) => f(b, a)));
}

HKT3<M, U, L, B> Function(HKT<F, A> fa, B b, HKT3<M, U, L, B> Function(B b, A a) f) foldM2v3C<M extends HKT3, F extends HKT, U, L, A, B>(Monad3C<M, U, L> m, Foldable2v1<F> f2v1) {
  return (HKT<F, A> fa, B b, HKT3<M, U, L, B> Function(B b, A a) f) => f2v1.reduce(fa, m.of(b), (mb, a) => m.chain(mb, (b) => f(b, a)));
}

HKT2<M, L, B> Function(HKT<F, A> fa, B b, HKT2<M, L, B> Function(B b, A a) f) foldM2v2<M extends HKT2, F extends HKT, L, A, B>(Monad2<M> m, Foldable2v1<F> f2v1) {
  return (HKT<F, A> fa, B b, HKT2<M, L, B> Function(B b, A a) f) => f2v1.reduce(fa, m.of(b), (mb, a) => m.chain(mb, (b) => f(b, a)));
}

HKT2<M, L, B> Function(HKT<F, A> fa, B b, HKT2<M, L, B> Function(B b, A a) f) foldM2v2C<M extends HKT2, F extends HKT, L, A, B>(Monad2C<M, L> m, Foldable2v1<F> f2v1) {
  return (HKT<F, A> fa, B b, HKT2<M, L, B> Function(B b, A a) f) => f2v1.reduce(fa, m.of(b), (mb, a) => m.chain(mb, (b) => f(b, a)));
}

HKT<M, B> Function(HKT<F, A> fa, B b, HKT<M, B> Function(B b, A a) f) foldM2v1<M extends HKT, F extends HKT, A, B>(Monad1<M> m, Foldable2v1<F> f2v1) {
  return (HKT<F, A> fa, B b, HKT<M, B> Function(B b, A a) f) => f2v1.reduce(fa, m.of(b), (mb, a) => m.chain(mb, (b) => f(b, a)));
}

// toArray

List<A> Function(HKT3<F, U, L, A> fa) toArray2v3<F extends HKT3, U, L, A>(Foldable2v3<F> f2v3F) {
  return (HKT3<F, U, L, A> fa) => foldMap3(f2v3F, unsafeMonoidArray())(fa, (a) => [a]);
}

List<A> Function(HKT3<F, U, L, A> fa) toArray2v3C<F extends HKT3, U, L, A>(Foldable2v3C<F, U, L> f2v3cF) {
  return (HKT3<F, U, L, A> fa) => foldMap3C(f2v3cF, unsafeMonoidArray())(fa, (a) => [a]);
}

List<A> Function(HKT2<F, L, A> fa) toArray2v2<F extends HKT2, L, A>(Foldable2v2<F> f2v2F) {
  return (HKT2<F, L, A> fa) => foldMap2(f2v2F, unsafeMonoidArray())(fa, (a) => [a]);
}

List<A> Function(HKT2<F, L, A> fa) toArray2v2C<F extends HKT2, L, A>(Foldable2v2C<F, L> f2v2cF) {
  return (HKT2<F, L, A> fa) => foldMap2C(f2v2cF, unsafeMonoidArray())(fa, (a) => [a]);
}

List<A> Function(HKT<F, A> fa) toArray2v1<F extends HKT, A>(Foldable2v1<F> f2v1F) {
  return (HKT<F, A> fa) => foldMap1(f2v1F, unsafeMonoidArray())(fa, (a) => [a]);
}

// traverse_

HKT3<M, U, L, void> Function(HKT<F, A> fa, HKT3<M, U, L, B> Function(A) f) traverse_2v3<M extends HKT3, F extends HKT, U, L, A, B>(Applicative3<M> a3M, Foldable2v1<F> f2v1F) {
  final toArrayF = toArray2v1(f2v1F);
  final applyFirstM = applyFirst3(a3M);
//  final initialValue = a3M.of(null);
  return (HKT<F, A> fa, HKT3<M, U, L, B> Function(A) f) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

HKT3<M, U, L, void> Function(HKT<F, A> fa, HKT3<M, U, L, B> Function(A) f) traverse_2v3C<M extends HKT3, F extends HKT, U, L, A, B>(Applicative3C<M, U, L> a3cM, Foldable2v1<F> f2v1F) {
  final toArrayF = toArray2v1(f2v1F);
  final applyFirstM = applyFirst3C(a3cM);
//  final initialValue = a3cM.of(null);
  return (HKT<F, A> fa, HKT3<M, U, L, B> Function(A) f) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

HKT2<M, L, void> Function(HKT<F, A> fa, HKT2<M, L, B> Function(A) f) traverse_2v2<M extends HKT2, F extends HKT, L, A, B>(Applicative2<M> a2M, Foldable2v1<F> f2v1F) {
  final toArrayF = toArray2v1(f2v1F);
  final applyFirstM = applyFirst2(a2M);
//  final initialValue = a2M.of(null);
  return (HKT<F, A> fa, HKT2<M, L, B> Function(A) f) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

HKT2<M, L, void> Function(HKT<F, A> fa, HKT2<M, L, B> Function(A) f) traverse_2v2C<M extends HKT2, F extends HKT, L, A, B>(Applicative2C<M, L> a2cM, Foldable2v1<F> f2v1F) {
  final toArrayF = toArray2v1(f2v1F);
  final applyFirstM = applyFirst2C(a2cM);
//  final initialValue = a2cM.of(null);
  return (HKT<F, A> fa, HKT2<M, L, B> Function(A) f) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

HKT<M, void> Function(HKT<F, A> fa, HKT<M, B> Function(A) f) traverse_2v1<M extends HKT, F extends HKT, A, B>(Applicative1<M> a1M, Foldable2v1<F> f2v1F) {
  final toArrayF = toArray2v1(f2v1F);
  final applyFirstM = applyFirst(a1M);
//  final initialValue = a1M.of(null);
  return (HKT<F, A> fa, HKT<M, B> Function(A) f) => toArrayF(fa).reduce((initialValue, a) => applyFirstM(initialValue, f(a)));
}

// sequence_

HKT3<M, U, L, void> Function(HKT<F, HKT3<M, U, L, A>> fa) sequence_2v3<M extends HKT3, F extends HKT, U, L, A>(Applicative3<M> a3M, Foldable2v1<F> f2v1F) {
  final traverseMF = traverse_2v3(a3M, f2v1F);
  return (HKT<F, HKT3<M, U, L, A>> fa) => traverseMF(fa, (ma) => ma);
}

HKT3<M, U, L, void> Function(HKT<F, HKT3<M, U, L, A>> fa) sequence_2v3C<M extends HKT3, F extends HKT, U, L, A>(Applicative3C<M, U, L> a3cM, Foldable2v1<F> f2v1F) {
  final traverseMF = traverse_2v3C(a3cM, f2v1F);
  return (HKT<F, HKT3<M, U, L, A>> fa) => traverseMF(fa, (ma) => ma);
}

HKT2<M, L, void> Function(HKT<F, HKT2<M, L, A>> fa) sequence_2v2<M extends HKT2, F extends HKT, U, L, A>(Applicative2<M> a2M, Foldable2v1<F> f2v1F) {
  final traverseMF = traverse_2v2(a2M, f2v1F);
  return (HKT<F, HKT2<M, L, A>> fa) => traverseMF(fa, (ma) => ma);
}

HKT2<M, L, void> Function(HKT<F, HKT2<M, L, A>> fa) sequence_2v2C<M extends HKT2, F extends HKT, U, L, A>(Applicative2C<M, L> a2cM, Foldable2v1<F> f2v1F) {
  final traverseMF = traverse_2v2C(a2cM, f2v1F);
  return (HKT<F, HKT2<M, L, A>> fa) => traverseMF(fa, (ma) => ma);
}

HKT<M, void> Function(HKT<F, HKT<M, A>> fa) sequence_2v1<M extends HKT, F extends HKT, A>(Applicative1<M> a1M, Foldable2v1<F> f2v1F) {
  final traverseMF = traverse_2v1(a1M, f2v1F);
  return (HKT<F, HKT<M, A>> fa) => traverseMF(fa, (ma) => ma);
}

// oneOf

HKT3<P, U, L, A> Function(HKT<F, HKT3<P, U, L, A>> fga) oneOf2v3<P extends HKT3, F extends HKT, U, L, A>(Plus3<P> p3P, Foldable2v1<F> f2v1F) {
  return (HKT<F, HKT3<P, U, L, A>> fga) => f2v1F.reduce(fga, p3P.zero(), (acc, a) => p3P.alt(acc, a));
}

HKT3<P, U, L, A> Function(HKT<F, HKT3<P, U, L, A>> fga) oneOf2v3C<P extends HKT3, F extends HKT, U, L, A>(Plus3C<P, U, L> p3cP, Foldable2v1<F> f2v1F) {
  return (HKT<F, HKT3<P, U, L, A>> fga) => f2v1F.reduce(fga, p3cP.zero(), (acc, a) => p3cP.alt(acc, a));
}

HKT2<P, L, A> Function(HKT<F, HKT2<P, L, A>> fga) oneOf2v2<P extends HKT2, F extends HKT, L, A>(Plus2<P> p2P, Foldable2v1<F> f2v1F) {
  return (HKT<F, HKT2<P, L, A>> fga) => f2v1F.reduce(fga, p2P.zero(), (acc, a) => p2P.alt(acc, a));
}

HKT2<P, L, A> Function(HKT<F, HKT2<P, L, A>> fga) oneOf2v2C<P extends HKT2, F extends HKT, L, A>(Plus2C<P, L> p2cP, Foldable2v1<F> f2v1F) {
  return (HKT<F, HKT2<P, L, A>> fga) => f2v1F.reduce(fga, p2cP.zero(), (acc, a) => p2cP.alt(acc, a));
}

HKT<P, A> Function(HKT<F, HKT<P, A>> fga) oneOf2v1<P extends HKT, F extends HKT, A>(Plus1<P> p1P, Foldable2v1<F> f2v1F) {
  return (HKT<F, HKT<P, A>> fga) => f2v1F.reduce(fga, p1P.zero(), (acc, a) => p1P.alt(acc, a));
}

class _Acc<M> {
  final bool init;
  final M acc;

  _Acc({this.init, this.acc});
}

// intercalater

M Function(M sep, HKT3<F, U, L, M> fm) intercalate3<M, F extends HKT3, U, L>(Monoid<M> m, Foldable2v3<F> f2v3F) {
  return (M sep, HKT3<F, U, L, M> fm) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return f2v3F.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

M Function(M sep, HKT3<F, U, L, M> fm) intercalate3C<M, F extends HKT3, U, L>(Monoid<M> m, Foldable2v3C<F, U, L> f2v3cF) {
  return (M sep, HKT3<F, U, L, M> fm) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return f2v3cF.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

M Function(M sep, HKT2<F, L, M> fm) intercalate2<M, F extends HKT2, L>(Monoid<M> m, Foldable2v2<F> f2v2F) {
  return (M sep, HKT2<F, L, M> fm) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return f2v2F.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

M Function(M sep, HKT2<F, L, M> fm) intercalate2C<M, F extends HKT2, L>(Monoid<M> m, Foldable2v2C<F, L> f2v2cF) {
  return (M sep, HKT2<F, L, M> fm) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return f2v2cF.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

M Function(M sep, HKT<F, M> fm) intercalate1<M, F extends HKT>(Monoid<M> m, Foldable2v1<F> f2v1F) {
  return (M sep, HKT<F, M> fm) {
    _Acc<M> _go(_Acc<M> accm, M x) {
      return accm.init ? _Acc<M>(init: false, acc: x) : _Acc<M>(init: false, acc: m.concat(m.concat(accm.acc, sep), x));
    }
    return f2v1F.reduce(fm, _Acc<M>(init: true, acc: m.empty), _go).acc;
  };
}

// sum

A Function(HKT3<F, U, L, A> fa) sum2v3<F extends HKT3, U, L, A>(Semiring<A> S, Foldable2v3<F> f2v3F) {
  return (HKT3<F, U, L, A> fa) => f2v3F.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

A Function(HKT3<F, U, L, A> fa) sum2v3C<F extends HKT3, U, L, A>(Semiring<A> S, Foldable2v3C<F, U, L> f2v3cF) {
  return (HKT3<F, U, L, A> fa) => f2v3cF.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

A Function(HKT2<F, L, A> fa) sum2v2<F extends HKT2, L, A>(Semiring<A> S, Foldable2v2<F> f2v2F) {
  return (HKT2<F, L, A> fa) => f2v2F.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

A Function(HKT2<F, L, A> fa) sum2v2C<F extends HKT2, L, A>(Semiring<A> S, Foldable2v2C<F, L> f2v2cF) {
  return (HKT2<F, L, A> fa) => f2v2cF.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

A Function(HKT<F, A> fa) sum2v1<F extends HKT, A>(Semiring<A> S, Foldable2v1<F> f2v1F) {
  return (HKT<F, A> fa) => f2v1F.reduce(fa, S.zero, (b, a) => S.add(b, a));
}

// product

A Function(HKT3<F, U, L, A> fa) product2v3<F extends HKT3, U, L, A>(Semiring<A> S, Foldable2v3<F> f2v3F) {
  return (HKT3<F, U, L, A> fa) => f2v3F.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

A Function(HKT3<F, U, L, A> fa) product2v3C<F extends HKT3, U, L, A>(Semiring<A> S, Foldable2v3C<F, U, L> f2v3cF) {
  return (HKT3<F, U, L, A> fa) => f2v3cF.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

A Function(HKT2<F, L, A> fa) product2v2<F extends HKT2, L, A>(Semiring<A> S, Foldable2v2<F> f2v2F) {
  return (HKT2<F, L, A> fa) => f2v2F.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

A Function(HKT2<F, L, A> fa) product2v2C<F extends HKT2, L, A>(Semiring<A> S, Foldable2v2C<F, L> f2v2cF) {
  return (HKT2<F, L, A> fa) => f2v2cF.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

A Function(HKT<F, A> fa) product2v1<F extends HKT, A>(Semiring<A> S, Foldable2v1<F> f2v1F) {
  return (HKT<F, A> fa) => f2v1F.reduce(fa, S.one, (b, a) => S.mul(b, a));
}

// member

bool Function(A a, HKT3<F, U, L, A> fa) member3<F extends HKT3, U, L, A>(Setoid<A> S, Foldable2v3<F> f2v3F) {
  return (A a, HKT3<F, U, L, A> fa) => f2v3F.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

bool Function(A a, HKT3<F, U, L, A> fa) member3C<F extends HKT3, U, L, A>(Setoid<A> S, Foldable2v3C<F, U, L> f2v3cF) {
  return (A a, HKT3<F, U, L, A> fa) => f2v3cF.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

bool Function(A a, HKT2<F, L, A> fa) member2<F extends HKT2, L, A>(Setoid<A> S, Foldable2v2<F> f2v2F) {
  return (A a, HKT2<F, L, A> fa) => f2v2F.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

bool Function(A a, HKT2<F, L, A> fa) member2C<F extends HKT2, L, A>(Setoid<A> S, Foldable2v2C<F, L> f2v2cF) {
  return (A a, HKT2<F, L, A> fa) => f2v2cF.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

bool Function(A a, HKT<F, A> fa) member1<F extends HKT, A>(Setoid<A> S, Foldable2v1<F> f2v1F) {
  return (A a, HKT<F, A> fa) => f2v1F.reduce(fa, false, (b, x) => b || S.equals(x, a));
}

// findFirst
Option<A> Function(HKT3<F, U, L, A> fa, Predicate<A> p) findFirst3<F extends HKT3, U, L, A>(Foldable2v3<F> f2v3F) {
  return (HKT3<F, U, L, A> fa, Predicate<A> p) => f2v3F.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

Option<A> Function(HKT3<F, U, L, A> fa, Predicate<A> p) findFirst3C<F extends HKT3, U, L, A>(Foldable2v3C<F, U, L> f2v3cF) {
  return (HKT3<F, U, L, A> fa, Predicate<A> p) => f2v3cF.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

Option<A> Function(HKT2<F, L, A> fa, Predicate<A> p) findFirst2<F extends HKT2, L, A>(Foldable2v2<F> f2v2F) {
  return (HKT2<F, L, A> fa, Predicate<A> p) => f2v2F.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

Option<A> Function(HKT2<F, L, A> fa, Predicate<A> p) findFirst2C<F extends HKT2, L, A>(Foldable2v2C<F, L> f2v2cF) {
  return (HKT2<F, L, A> fa, Predicate<A> p) => f2v2cF.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

Option<A> Function(HKT<F, A> fa, Predicate<A> p) findFirst1<F extends HKT, A>(Foldable2v1<F> f2v1F) {
  return (HKT<F, A> fa, Predicate<A> p) => f2v1F.reduce(fa, none, (b, a) {
    if (b.isNone() && p(a)) {
      return some(a);
    } else {
      return b;
    }
  });
}

// min

Option<A> Function(HKT3<F, U, L, A> fa) min3<F extends HKT3, U, L, A>(Ord<A> O, Foldable2v3<F> f2v3F) {
  final minO = min(O);
  return (HKT3<F, U, L, A> fa) => f2v3F.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

Option<A> Function(HKT3<F, U, L, A> fa) min3C<F extends HKT3, U, L, A>(Ord<A> O, Foldable2v3C<F, U, L> f2v3cF) {
  final minO = min(O);
  return (HKT3<F, U, L, A> fa) => f2v3cF.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

Option<A> Function(HKT2<F, L, A> fa) min2<F extends HKT2, L, A>(Ord<A> O, Foldable2v2<F> f2v2F) {
  final minO = min(O);
  return (HKT2<F, L, A> fa) => f2v2F.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

Option<A> Function(HKT2<F, L, A> fa) min2C<F extends HKT2, L, A>(Ord<A> O, Foldable2v2C<F, L> f2v2cF) {
  final minO = min(O);
  return (HKT2<F, L, A> fa) => f2v2cF.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

Option<A> Function(HKT<F, A> fa) min1<F extends HKT, A>(Ord<A> O, Foldable2v1<F> f2v1F) {
  final minO = min(O);
  return (HKT<F, A> fa) => f2v1F.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(minO(b.value, a))));
}

// max

Option<A> Function(HKT3<F, U, L, A> fa) max3<F extends HKT3, U, L, A>(Ord<A> O, Foldable2v3<F> f2v3F) {
  final maxO = max(O);
  return (HKT3<F, U, L, A> fa) => f2v3F.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}

Option<A> Function(HKT3<F, U, L, A> fa) max3C<F extends HKT3, U, L, A>(Ord<A> O, Foldable2v3C<F, U, L> f2v3cF) {
  final maxO = max(O);
  return (HKT3<F, U, L, A> fa) => f2v3cF.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}

Option<A> Function(HKT2<F, L, A> fa) max2<F extends HKT2, L, A>(Ord<A> O, Foldable2v2<F> f2v2F) {
  final maxO = max(O);
  return (HKT2<F, L, A> fa) => f2v2F.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}

Option<A> Function(HKT2<F, L, A> fa) max2C<F extends HKT2, L, A>(Ord<A> O, Foldable2v2C<F, L> f2v2cF) {
  final maxO = max(O);
  return (HKT2<F, L, A> fa) => f2v2cF.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}

Option<A> Function(HKT<F, A> fa) max1<F extends HKT, A>(Ord<A> O, Foldable2v1<F> f2v1F) {
  final maxO = max(O);
  return (HKT<F, A> fa) => f2v1F.reduce(fa, none, (b, a) => (b.isNone() ? some(a) : some(maxO(b.value, a))));
}