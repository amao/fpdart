import 'package:fpdart/Applicative.dart';
import 'package:fpdart/Foldable2v.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Monoid.dart';
import 'package:fpdart/Traversable.dart';

abstract class Traversable2v1<T extends HKT> implements Functor1<T>, Foldable2v1<T>, Traverse1<T>, Sequence1<T> {}
abstract class Traversable2v2<T extends HKT2> implements Functor2<T>, Foldable2v2<T>, Traverse2<T>, Sequence2<T> {}
abstract class Traversable2v2C<T extends HKT2, TL> implements Functor2C<T, TL>, Foldable2v2C<T, TL>, Traverse2C<T, TL>, Sequence2C<T, TL> {}
abstract class Traversable2v3<T extends HKT3> implements Functor3<T>, Foldable2v3<T>, Traverse3<T>, Sequence3<T> {}
abstract class Traversable2v3C<T extends HKT3, TU, TL> implements Functor3C<T, TU, TL>, Foldable2v3C<T, TU, TL>, Traverse3C<T, TU, TL>, Sequence3C<T, TU, TL> {}

abstract class Sequence1<T extends HKT> {
  HKT3<F, FU, FL, HKT<T, A>> Function(HKT<T, HKT3<F, FU, FL, A>>) sequence3<F extends HKT3, FU, FL, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT<T, A>> Function(HKT<T, HKT3<F, FU, FL, A>>) sequence3C<F extends HKT3, FU, FL, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT<T, A>> Function(HKT<T, HKT2<F, FL, A>>) sequence2<F extends HKT2, FL, A>(Applicative2<F> a2F);
  HKT2<F, FL, HKT<T, A>> Function(HKT<T, HKT2<F, FL, A>>) sequence2C<F extends HKT2, FL, A>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT<T, A>> Function(HKT<T, HKT<F, A>>) sequence1<F extends HKT, A>(Applicative1<F> a1F);
}

abstract class Sequence2<T extends HKT2> {
  HKT3<F, FU, FL, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT3<F, FU, FL, A>>) sequence3<F extends HKT3, TL, FU, FL, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT3<F, FU, FL, A>>) sequence3C<F extends HKT3, TL, FU, FL, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT2<F, FL, A>>) sequence2<F extends HKT2, TL, FL, A>(Applicative2<F> a2F);
  HKT2<F, FL, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT2<F, FL, A>>) sequence2C<F extends HKT2, TL, FL, A>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT<F, A>>) sequence1<F extends HKT, TL, A>(Applicative1<F> a1F);
}

abstract class Sequence2C<T extends HKT2, TL> {
  HKT3<F, FU, FL, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT3<F, FU, FL, A>>) sequence3<F extends HKT3, FU, FL, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT3<F, FU, FL, A>>) sequence3C<F extends HKT3, FU, FL, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT2<F, FL, A>>) sequence2<F extends HKT2, FL, A>(Applicative2<F> a2F);
  HKT2<F, FL, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT2<F, FL, A>>) sequence2C<F extends HKT2, FL, A>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT2<T, TL, A>> Function(HKT2<T, TL, HKT<F, A>>) sequence1<F extends HKT, A>(Applicative1<F> a1F);
}

abstract class Sequence3<T extends HKT3> {
  HKT3<F, FU, FL, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT3<F, FU, FL, A>>) sequence3<F extends HKT3, TU, TL, FU, FL, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT3<F, FU, FL, A>>) sequence3C<F extends HKT3, TU, TL, FU, FL, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT2<F, FL, A>>) sequence2<F extends HKT2, TU, TL, FL, A>(Applicative2<F> a2F);
  HKT2<F, FL, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT2<F, FL, A>>) sequence2C<F extends HKT2, TU, TL, FL, A>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT<F, A>>) sequence1<F extends HKT, TU, TL, A>(Applicative1<F> a1F);
}

abstract class Sequence3C<T extends HKT3, TU, TL> {
  HKT3<F, FU, FL, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT3<F, FU, FL, A>>) sequence3<F extends HKT3, FU, FL, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT3<F, FU, FL, A>>) sequence3C<F extends HKT3, FU, FL, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT2<F, FL, A>>) sequence2<F extends HKT2, FL, A>(Applicative2<F> a2F);
  HKT2<F, FL, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT2<F, FL, A>>) sequence2C<F extends HKT2, FL, A>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT3<T, TU, TL, A>> Function(HKT3<T, TU, TL, HKT<F, A>>) sequence1<F extends HKT, A>(Applicative1<F> a1F);
}

abstract class Traversable2vComposition1<F extends HKT, G extends HKT> {
  HKT3<H, HU, HL, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT3<H, HU, HL, B> Function(A) f) traverse3<H extends HKT3, HU, HL, A, B>(Applicative3<H> a3H);
  HKT3<H, HU, HL, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT3<H, HU, HL, B> Function(A) f) traverse3C<H extends HKT3, HU, HL, A, B>(Applicative3C<H, HU, HL> a3cH);
  HKT2<H, HL, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT2<H, HL, B> Function(A) f) traverse2<H extends HKT2, HL, A, B>(Applicative2<H> a2H);
  HKT2<H, HL, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT2<H, HL, B> Function(A) f) traverse2C<H extends HKT2, HL, A, B>(Applicative2C<H, HL> a2cH);
  HKT<H, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT<H, B> Function(A) f) traverse1<H extends HKT, A, B>(Applicative1<H> a1H);
}

abstract class SequenceComposition1<F extends HKT, G extends HKT> {
  HKT3<H, HU, HL, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT3<H, HU, HL, A>>> fgha) sequence3<H extends HKT3, HU, HL, A>(Applicative3<H> a3H);
  HKT3<H, HU, HL, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT3<H, HU, HL, A>>> fgha) sequence3C<H extends HKT3, HU, HL, A>(Applicative3C<H, HU, HL> a3cH);
  HKT2<H, HL, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT2<H, HL, A>>> fgha) sequence2<H extends HKT2, HL, A>(Applicative2<H> a2H);
  HKT2<H, HL, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT2<H, HL, A>>> fgha) sequence2C<H extends HKT2, HL, A>(Applicative2C<H, HL> a2cH);
  HKT<H, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT<H, A>>> fgha) sequence1<H extends HKT, A>(Applicative1<H> a1H);
}

abstract class Traversable2vComposition11<F extends HKT, G extends HKT> implements Foldable2vComposition11<F, G>, FunctorComposition11<F, G>, Traversable2vComposition1<F, G>, SequenceComposition1<F, G> {}

class _GetTraversableComposition<F extends HKT, G extends HKT> extends Traversable2vComposition11<F, G> {
  final Traversable2v1<F> t2v1F;
  final Traversable2v1<G> t2v1G;
  _GetTraversableComposition(this.t2v1F, this.t2v1G);

  @override
  HKT<H, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT<H, B> Function(A) f) traverse1<H extends HKT, A, B>(Applicative1<H> a1H) {
    return (HKT<F, HKT<G, A>> fga, HKT<H, B> Function(A) f) {
      final traverseF = t2v1F.traverse1(a1H);
      final traverseG = t2v1G.traverse1(a1H);
      return traverseF(fga, (ga) => traverseG(ga, f as dynamic));
    };
  }

  @override
  HKT<H, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT<H, A>>> fgha) sequence1<H extends HKT, A>(Applicative1<H> a1H) {
    return (HKT<F, HKT<G, HKT<H, A>>> fgha) {
      final sequenceF = t2v1F.sequence1(a1H);
      final sequenceG = t2v1G.sequence1(a1H);
      return sequenceF(t2v1F.map(fgha, sequenceG));
    };
  }

  @override
  foldMap<M, A>(Monoid<M> m) {
    return getFoldableComposition11(t2v1F, t2v1G).foldMap(m);
  }

  @override
  B foldr<A, B>(HKT<F, HKT<G, A>> fa, B b, B Function(A a, B b) f) {
    return getFoldableComposition11(t2v1F, t2v1G).foldr(fa, b, f);
  }

  @override
  HKT<F, HKT<G, B>> map<A, B>(HKT<F, HKT<G, A>> fa, B Function(A a) f) {
    return getFunctorComposition(t2v1F, t2v1G).map(fa, f);
  }

  @override
  B reduce<A, B>(HKT<F, HKT<G, A>> fga, B b, B Function(B b, A a) f) {
    return getFoldableComposition11(t2v1F, t2v1G).reduce(fga, b, f);
  }

  @override
  HKT2<H, HL, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT2<H, HL, A>>> fgha) sequence2<H extends HKT2, HL, A>(Applicative2<H> a2H) {
    return (HKT<F, HKT<G, HKT2<H, HL, A>>> fgha) {
      final sequenceF = t2v1F.sequence2(a2H);
      final sequenceG = t2v1G.sequence2(a2H);
      return sequenceF(t2v1F.map(fgha, sequenceG));
    };
  }

  @override
  HKT2<H, HL, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT2<H, HL, A>>> fgha) sequence2C<H extends HKT2, HL, A>(Applicative2C<H, HL> a2cH) {
    return (HKT<F, HKT<G, HKT2<H, HL, A>>> fgha) {
      final sequenceF = t2v1F.sequence2C(a2cH);
      final sequenceG = t2v1G.sequence2C(a2cH);
      return sequenceF(t2v1F.map(fgha, sequenceG));
    };
  }

  @override
  HKT3<H, HU, HL, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT3<H, HU, HL, A>>> fgha) sequence3<H extends HKT3, HU, HL, A>(Applicative3<H> a3H) {
    return (HKT<F, HKT<G, HKT3<H, HU, HL, A>>> fgha) {
      final sequenceF = t2v1F.sequence3(a3H);
      final sequenceG = t2v1G.sequence3(a3H);
      return sequenceF(t2v1F.map(fgha, sequenceG));
    };
  }

  @override
  HKT3<H, HU, HL, HKT<F, HKT<G, A>>> Function(HKT<F, HKT<G, HKT3<H, HU, HL, A>>> fgha) sequence3C<H extends HKT3, HU, HL, A>(Applicative3C<H, HU, HL> a3cH) {
    return (HKT<F, HKT<G, HKT3<H, HU, HL, A>>> fgha) {
      final sequenceF = t2v1F.sequence3C(a3cH);
      final sequenceG = t2v1G.sequence3C(a3cH);
      return sequenceF(t2v1F.map(fgha, sequenceG));
    };
  }

  @override
  HKT2<H, HL, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT2<H, HL, B> Function(A) f) traverse2<H extends HKT2, HL, A, B>(Applicative2<H> a2H) {
    return (HKT<F, HKT<G, A>> fga, HKT2<H, HL, B> Function(A) f) {
      final traverseF = t2v1F.traverse2(a2H);
      final traverseG = t2v1G.traverse2(a2H);
      return traverseF(fga, (ga) => traverseG(ga, f as dynamic));
    };
  }

  @override
  HKT2<H, HL, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT2<H, HL, B> Function(A) f) traverse2C<H extends HKT2, HL, A, B>(Applicative2C<H, HL> a2cH) {
    return (HKT<F, HKT<G, A>> fga, HKT2<H, HL, B> Function(A) f) {
      final traverseF = t2v1F.traverse2C(a2cH);
      final traverseG = t2v1G.traverse2C(a2cH);
      return traverseF(fga, (ga) => traverseG(ga, f as dynamic));
    };
  }

  @override
  HKT3<H, HU, HL, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT3<H, HU, HL, B> Function(A) f) traverse3<H extends HKT3, HU, HL, A, B>(Applicative3<H> a3H) {
    return (HKT<F, HKT<G, A>> fga, HKT3<H, HU, HL, B> Function(A) f) {
      final traverseF = t2v1F.traverse3(a3H);
      final traverseG = t2v1G.traverse3(a3H);
      return traverseF(fga, (ga) => traverseG(ga, f as dynamic));
    };
  }

  @override
  HKT3<H, HU, HL, HKT<F, HKT<G, B>>> Function(HKT<F, HKT<G, A>> fga, HKT3<H, HU, HL, B> Function(A) f) traverse3C<H extends HKT3, HU, HL, A, B>(Applicative3C<H, HU, HL> a3cH) {
    return (HKT<F, HKT<G, A>> fga, HKT3<H, HU, HL, B> Function(A) f) {
      final traverseF = t2v1F.traverse3C(a3cH);
      final traverseG = t2v1G.traverse3C(a3cH);
      return traverseF(fga, (ga) => traverseG(ga, f as dynamic));
    };
  }
}
Traversable2vComposition11<F, G> getTraversableComposition<F extends HKT, G extends HKT>(Traversable2v1<F> t2v1F, Traversable2v1<G> t2v1G) {
  return _GetTraversableComposition(t2v1F, t2v1G);
}
