import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Either.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/function.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Option.dart';

abstract class Filterable1<F extends HKT> implements Compactable1AndFunctor1<F>  {
  Separated<HKT<F, RL>, HKT<F, RR>> partitionMap<RL, RR, A>(HKT<F, A> fa, Either<RL, RR> Function(A) f);
  Separated<HKT<F, A>, HKT<F, A>> partition<A>(HKT<F, A> fa, Predicate<A> p);
  HKT<F, B> filterMap<A, B>(HKT<F, A> fa, Option<B> Function(A) f);
  HKT<F, A> filter<A>(HKT<F, A> fa, Predicate<A> p);
}

abstract class Filterable2<F extends HKT2> implements Compactable2AndFunctor2<F> {
  Separated<HKT2<F, L, RL>, HKT2<F, L, RR>> partitionMap<RL, RR, L, A>(HKT2<F, L, A> fa, Either<RL, RR> Function(A) f);
  Separated<HKT2<F, L, A>, HKT2<F, L, A>> partition<L, A>(HKT2<F, L, A> fa, Predicate<A> p);
  HKT2<F, L, B> filterMap<L, A, B>(HKT2<F, L, A> fa, Option<B> Function(A) f);
  HKT2<F, L, A> filter<L, A>(HKT2<F, L, A> fa, Predicate<A> p);
}

abstract class Filterable2C<F extends HKT2, L> implements Compactable2CAndFunctor2C<F, L> {
  Separated<HKT2<F, L, RL>, HKT2<F, L, RR>> partitionMap<RL, RR, A>(HKT2<F, L, A> fa, Either<RL, RR> Function(A) f);
  Separated<HKT2<F, L, A>, HKT2<F, L, A>> partition<A>(HKT2<F, L, A> fa, Predicate<A> p);
  HKT2<F, L, B> filterMap<A, B>(HKT2<F, L, A> fa, Option<B> Function(A) f);
  HKT2<F, L, A> filter<A>(HKT2<F, L, A> fa, Predicate<A> p);
}

abstract class Filterable3<F extends HKT3> implements Functor3<F>, Compactable3<F> {
  Separated<HKT3<F, U, L, RL>, HKT3<F, U, L, RR>> partitionMap<RL, RR, U, L, A>(HKT3<F, U, L, A> fa, Either<RL, RR> Function(A) f);
  Separated<HKT3<F, U, L, A>, HKT3<F, U, L, A>> partition<U, L, A>(HKT3<F, U, L, A> fa, Predicate<A> p);
  HKT3<F, U, L, B> filterMap<U, L, A, B>(HKT3<F, U, L, A> fa, Option<B> Function(A) f);
  HKT3<F, U, L, A> filter<U, L, A>(HKT3<F, U, L, A> fa, Predicate<A> p);
}

abstract class Filterable3C<F extends HKT3, U, L> implements Functor3C<F, U, L>, Compactable3C<F, U, L> {
  Separated<HKT3<F, U, L, RL>, HKT3<F, U, L, RR>> partitionMap<RL, RR, A>(HKT3<F, U, L, A> fa, Either<RL, RR> Function(A) f);
  Separated<HKT3<F, U, L, A>, HKT3<F, U, L, A>> partition<A>(HKT3<F, U, L, A> fa, Predicate<A> p);
  HKT3<F, U, L, B> filterMap<A, B>(HKT3<F, U, L, A> fa, Option<B> Function(A) f);
  HKT3<F, U, L, A> filter<A>(HKT3<F, U, L, A> fa, Predicate<A> p);
}

abstract class FilterableComposition11<F extends HKT, G extends HKT> implements FunctorComposition11<F, G>, CompactableComposition11<F, G> {
  Separated<HKT<F, HKT<G, RL>>, HKT<F, HKT<G, RR>>> partitionMap<RL, RR, A>(HKT<F, HKT<G, A>> fga, Either<RL, RR> Function(A) f);
  Separated<HKT<F, HKT<G, A>>, HKT<F, HKT<G, A>>> partition<A>(HKT<F, HKT<G, A>> fga, Predicate<A> p);
  HKT<F, HKT<G, B>> filterMap<A, B>(HKT<F, HKT<G, A>> fga, Option<B> Function(A) f);
  HKT<F, HKT<G, A>> filter<A>(HKT<F, HKT<G, A>> fga, Predicate<A> p);
}

abstract class FilterableComposition12<F extends HKT, G extends HKT2> implements FunctorComposition12<F, G>, CompactableComposition12<F, G> {
  Separated<HKT<F, HKT2<G, LG, RL>>, HKT<F, HKT2<G, LG, RR>>> partitionMap<LG, RL, RR, A>(HKT<F, HKT2<G, LG, A>> fga, Either<RL, RR> Function(A) f);
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, A>>> partition<LG, A>(HKT<F, HKT2<G, LG, A>> fga, Predicate<A> p);
  HKT<F, HKT2<G, LG, B>> filterMap<LG, A, B>(HKT<F, HKT2<G, LG, A>> fga, Option<B> Function(A) f);
  HKT<F, HKT2<G, LG, A>> filter<LG, A>(HKT<F, HKT2<G, LG, A>> fga, Predicate<A> p);
}

abstract class FilterableComposition12C<F extends HKT, G extends HKT2, LG> implements FunctorComposition12C<F, G, LG>, CompactableComposition12C<F, G, LG> {
  Separated<HKT<F, HKT2<G, LG, RL>>, HKT<F, HKT2<G, LG, RR>>> partitionMap<RL, RR, A>(HKT<F, HKT2<G, LG, A>> fga, Either<RL, RR> Function(A) f);
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, A>>> partition<A>(HKT<F, HKT2<G, LG, A>> fga, Predicate<A> p);
  HKT<F, HKT2<G, LG, B>> filterMap<A, B>(HKT<F, HKT2<G, LG, A>> fga, Option<B> Function(A) f);
  HKT<F, HKT2<G, LG, A>> filter<A>(HKT<F, HKT2<G, LG, A>> fga, Predicate<A> p);
}

abstract class FilterableComposition21<F extends HKT2, G extends HKT> implements FunctorComposition21<F, G>, CompactableComposition21<F, G> {
  Separated<HKT2<F, LF, HKT<G, RL>>, HKT2<F, LF, HKT<G, RR>>> partitionMap<LF, RL, RR, A>(HKT2<F, LF, HKT<G, A>> fga, Either<RL, RR> Function(A) f);
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, A>>> partition<LF, A>(HKT2<F, LF, HKT<G, A>> fga, Predicate<A> p);
  HKT2<F, LF, HKT<G, B>> filterMap<LF, A, B>(HKT2<F, LF, HKT<G, A>> fga, Option<B> Function(A) f);
  HKT2<F, LF, HKT<G, A>> filter<LF, A>(HKT2<F, LF, HKT<G, A>> fga, Predicate<A> p);
}

abstract class FilterableComposition2C1<F extends HKT2, G extends HKT, LF> implements FunctorComposition2C1<F, G, LF>, CompactableComposition2C1<F, G, LF> {
  Separated<HKT2<F, LF, HKT<G, RL>>, HKT2<F, LF, HKT<G, RR>>> partitionMap<RL, RR, A>(HKT2<F, LF, HKT<G, A>> fga, Either<RL, RR> Function(A) f);
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, A>>> partition<A>(HKT2<F, LF, HKT<G, A>> fga, Predicate<A> p);
  HKT2<F, LF, HKT<G, B>> filterMap<A, B>(HKT2<F, LF, HKT<G, A>> fga, Option<B> Function(A) f);
  HKT2<F, LF, HKT<G, A>> filter<A>(HKT2<F, LF, HKT<G, A>> fga, Predicate<A> p);
}

abstract class FilterableComposition22<F extends HKT2, G extends HKT2> implements FunctorComposition22<F, G>, CompactableComposition22<F, G> {
  Separated<HKT2<F, LF, HKT2<G, LG, RL>>, HKT2<F, LF, HKT2<G, LG, RR>>> partitionMap<LF, LG, RL, RR, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, Either<RL, RR> Function(A) f);
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, A>>> partition<LF, LG, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, Predicate<A> p);
  HKT2<F, LF, HKT2<G, LG, B>> filterMap<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, Option<B> Function(A) f);
  HKT2<F, LF, HKT2<G, LG, A>> filter<LF, LG, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, Predicate<A> p);
}

abstract class FilterableComposition22C<F extends HKT2, G extends HKT2, LG> implements FunctorComposition22C<F, G, LG>, CompactableComposition22C<F, G, LG> {
  Separated<HKT2<F, LF, HKT2<G, LG, RL>>, HKT2<F, LF, HKT2<G, LG, RR>>> partitionMap<LF, RL, RR, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, Either<RL, RR> Function(A) f);
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, A>>> partition<LF, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, Predicate<A> p);
  HKT2<F, LF, HKT2<G, LG, B>> filterMap<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, Option<B> Function(A) f);
  HKT2<F, LF, HKT2<G, LG, A>> filter<LF, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, Predicate<A> p);
}

abstract class FilterableComposition3C1<F extends HKT3, G extends HKT, UF, LF> implements FunctorComposition3C1<F, G, UF, LF>, CompactableComposition3C1<F, G, UF, LF> {
  Separated<HKT3<F, UF, LF, HKT<G, RL>>, HKT3<F, UF, LF, HKT<G, RR>>> partitionMap<RL, RR, A>(HKT3<F, UF, LF, HKT<G, A>> fga, Either<RL, RR> Function(A) f);
  Separated<HKT3<F, UF, LF, HKT<G, A>>, HKT3<F, UF, LF, HKT<G, A>>> partition<A>(HKT3<F, UF, LF, HKT<G, A>> fga, Predicate<A> p);
  HKT3<F, UF, LF, HKT<G, B>> filterMap<A, B>(HKT3<F, UF, LF, HKT<G, A>> fga, Option<B> Function(A) f);
  HKT3<F, UF, LF, HKT<G, A>> filter<A>(HKT3<F, UF, LF, HKT<G, A>> fga, Predicate<A> p);
}

class _GetFilterableComposition3C1<F extends HKT3, G extends HKT, UF, LF> extends FilterableComposition3C1<F, G, UF, LF> {
  final Functor3C<F, UF, LF> f3cF;
  final Filterable1<G> f1G;
  _GetFilterableComposition3C1(this.f3cF, this.f1G);

  @override
  HKT3<F, UF, LF, HKT<G, A>> compact<A>(HKT3<F, UF, LF, HKT<G, Option<A>>> fga) {
    return getCompactableComposition3C1(f3cF, f1G).compact(fga);
  }

  @override
  HKT3<F, UF, LF, HKT<G, A>> filter<A>(HKT3<F, UF, LF, HKT<G, A>> fga, p) {
    return f3cF.map(fga, (ga) => f1G.filter(ga, p));
  }

  @override
  HKT3<F, UF, LF, HKT<G, B>> filterMap<A, B>(HKT3<F, UF, LF, HKT<G, A>> fga, Option<B> Function(A) f) {
    return f3cF.map(fga, (ga) => f1G.filterMap(ga, f));
  }

  @override
  HKT3<F, UF, LF, HKT<G, B>> map<A, B>(HKT3<F, UF, LF, HKT<G, A>> fa, B Function(A a) f) {
    return getCompactableComposition3C1(f3cF, f1G).map(fa, f);
  }

  @override
  Separated<HKT3<F, UF, LF, HKT<G, A>>, HKT3<F, UF, LF, HKT<G, A>>> partition<A>(HKT3<F, UF, LF, HKT<G, A>> fga, p) {
    final left = this.filter(fga, (a) => !p(a));
    final right = this.filter(fga, p);
    return Separated(left, right);
  }

  @override
  Separated<HKT3<F, UF, LF, HKT<G, RL>>, HKT3<F, UF, LF, HKT<G, RR>>> partitionMap<RL, RR, A>(HKT3<F, UF, LF, HKT<G, A>> fga, Either<RL, RR> Function(A) f) {
    final left = this.filterMap(fga, (a) => f(a).fold(some, (_) => none));
    final right = this.filterMap(fga, (a) => f(a).fold((_) => none, some));
    return Separated(left, right);
  }

  @override
  Separated<HKT3<F, UF, LF, HKT<G, A>>, HKT3<F, UF, LF, HKT<G, B>>> separate<A, B>(HKT3<F, UF, LF, HKT<G, Either<A, B>>> fge) {
    return getCompactableComposition3C1(f3cF, f1G).separate(fge);
  }
}
FilterableComposition3C1<F, G, UF, LF> getFilterableComposition3C1<F extends HKT3, G extends HKT, UF, LF>(Functor3C<F, UF, LF> f3cF, Filterable1<G> f1G) {
  return _GetFilterableComposition3C1(f3cF, f1G);
}

class _GetFilterableComposition22C<F extends HKT2, G extends HKT2, LG> extends FilterableComposition22C<F, G, LG> {
  final Functor2<F> f2F;
  final Filterable2C<G, LG> f2cG;
  _GetFilterableComposition22C(this.f2F, this.f2cG);

  @override
  HKT2<F, LF, HKT2<G, LG, A>> compact<LF, A>(HKT2<F, LF, HKT2<G, LG, Option<A>>> fga) {
    return getCompactableComposition22C(f2F, f2cG).compact(fga);
  }

  @override
  HKT2<F, LF, HKT2<G, LG, A>> filter<LF, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, p) {
    return f2F.map(fga, (ga) => f2cG.filter(ga, p));
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> filterMap<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, Option<B> Function(A) f) {
    return f2F.map(fga, (ga) => f2cG.filterMap(ga, f));
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return getCompactableComposition22C(f2F, f2cG).map(fa, f);
  }

  @override
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, A>>> partition<LF, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, p) {
    final left = this.filter(fga, (a) => !p(a));
    final right = this.filter(fga, p);
    return Separated(left, right);
  }

  @override
  Separated<HKT2<F, LF, HKT2<G, LG, RL>>, HKT2<F, LF, HKT2<G, LG, RR>>> partitionMap<LF, RL, RR, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, Either<RL, RR> Function(A) f) {
    final left = this.filterMap(fga, (a) => f(a).fold(some, (_) => none));
    final right = this.filterMap(fga, (a) => f(a).fold((_) => none, some));
    return Separated(left, right);
  }

  @override
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, B>>> separate<LF, A, B>(HKT2<F, LF, HKT2<G, LG, Either<A, B>>> fge) {
    return getCompactableComposition22C(f2F, f2cG).separate(fge);
  }
}
FilterableComposition22C<F, G, LG> getFilterableComposition22C<F extends HKT2, G extends HKT2, LG>(Functor2<F> f2F, Filterable2C<G, LG> f2cG) {
  return _GetFilterableComposition22C(f2F, f2cG);
}

class _GetFilterableComposition22<F extends HKT2, G extends HKT2> extends FilterableComposition22<F, G> {
  final Functor2<F> f2F;
  final Filterable2<G> f2G;
  _GetFilterableComposition22(this.f2F, this.f2G);

  @override
  HKT2<F, LF, HKT2<G, LG, A>> compact<LF, LG, A>(HKT2<F, LF, HKT2<G, LG, Option<A>>> fga) {
    return getCompactableComposition22(f2F, f2G).compact(fga);
  }

  @override
  HKT2<F, LF, HKT2<G, LG, A>> filter<LF, LG, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, p) {
    return f2F.map(fga, (ga) => f2G.filter(ga, p));
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> filterMap<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fga, Option<B> Function(A) f) {
    return f2F.map(fga, (ga) => f2G.filterMap(ga, f));
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return getCompactableComposition22(f2F, f2G).map(fa, f);
  }

  @override
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, A>>> partition<LF, LG, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, p) {
    final left = this.filter(fga, (a) => !p(a));
    final right = this.filter(fga, p);
    return Separated(left, right);
  }

  @override
  Separated<HKT2<F, LF, HKT2<G, LG, RL>>, HKT2<F, LF, HKT2<G, LG, RR>>> partitionMap<LF, LG, RL, RR, A>(HKT2<F, LF, HKT2<G, LG, A>> fga, Either<RL, RR> Function(A) f) {
    final left = this.filterMap(fga, (a) => f(a).fold(some, (_) => none));
    final right = this.filterMap(fga, (a) => f(a).fold((_) => none, some));
    return Separated(left, right);
  }

  @override
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, B>>> separate<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, Either<A, B>>> fge) {
    return getCompactableComposition22(f2F, f2G).separate(fge);
  }
}
FilterableComposition22<F, G> getFilterableComposition22<F extends HKT2, G extends HKT2>(Functor2<F> f2F, Filterable2<G> f2G) {
  return _GetFilterableComposition22(f2F, f2G);
}

class _GetFilterableComposition2C1<F extends HKT2, G extends HKT, LF> extends FilterableComposition2C1<F, G, LF> {
  final Functor2C<F, LF> f2cF;
  final Filterable1<G> f1G;
  _GetFilterableComposition2C1(this.f2cF, this.f1G);

  @override
  HKT2<F, LF, HKT<G, A>> compact<A>(HKT2<F, LF, HKT<G, Option<A>>> fga) {
    return getCompactableComposition2C1(f2cF, f1G).compact(fga);
  }

  @override
  HKT2<F, LF, HKT<G, A>> filter<A>(HKT2<F, LF, HKT<G, A>> fga, p) {
    return f2cF.map(fga, (ga) => f1G.filter(ga, p));
  }

  @override
  HKT2<F, LF, HKT<G, B>> filterMap<A, B>(HKT2<F, LF, HKT<G, A>> fga, Option<B> Function(A) f) {
    return f2cF.map(fga, (ga) => f1G.filterMap(ga, f));
  }

  @override
  HKT2<F, LF, HKT<G, B>> map<A, B>(HKT2<F, LF, HKT<G, A>> fa, B Function(A a) f) {
    return getCompactableComposition2C1(f2cF, f1G).map(fa, f);
  }

  @override
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, A>>> partition<A>(HKT2<F, LF, HKT<G, A>> fga, p) {
    final left = this.filter(fga, (a) => !p(a));
    final right = this.filter(fga, p);
    return Separated(left, right);
  }

  @override
  Separated<HKT2<F, LF, HKT<G, RL>>, HKT2<F, LF, HKT<G, RR>>> partitionMap<RL, RR, A>(HKT2<F, LF, HKT<G, A>> fga, Either<RL, RR> Function(A) f) {
    final left = this.filterMap(fga, (a) => f(a).fold(some, (_) => none));
    final right = this.filterMap(fga, (a) => f(a).fold((_) => none, some));
    return Separated(left, right);
  }

  @override
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, B>>> separate<A, B>(HKT2<F, LF, HKT<G, Either<A, B>>> fge) {
    return getCompactableComposition2C1(f2cF, f1G).separate(fge);
  }

}
FilterableComposition2C1<F, G, LF> getFilterableComposition2C1<F extends HKT2, G extends HKT, LF>(Functor2C<F, LF> f2cF, Filterable1<G> f1G) {
  return _GetFilterableComposition2C1(f2cF, f1G);
}

class _GetFilterableComposition21<F extends HKT2, G extends HKT> extends FilterableComposition21<F, G> {
  final Functor2<F> f2F;
  final Filterable1<G> f1G;
  _GetFilterableComposition21(this.f2F, this.f1G);

  @override
  HKT2<F, LF, HKT<G, A>> compact<LF, A>(HKT2<F, LF, HKT<G, Option<A>>> fga) {
    return getCompactableComposition21(f2F, f1G).compact(fga);
  }

  @override
  HKT2<F, LF, HKT<G, A>> filter<LF, A>(HKT2<F, LF, HKT<G, A>> fga, p) {
    return f2F.map(fga, (ga) => f1G.filter(ga, p));
  }

  @override
  HKT2<F, LF, HKT<G, B>> filterMap<LF, A, B>(HKT2<F, LF, HKT<G, A>> fga, Option<B> Function(A) f) {
    return f2F.map(fga, (ga) => f1G.filterMap(ga, f));
  }

  @override
  HKT2<F, LF, HKT<G, B>> map<LF, A, B>(HKT2<F, LF, HKT<G, A>> fa, B Function(A a) f) {
    return getCompactableComposition21(f2F, f1G).map(fa, f);
  }

  @override
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, A>>> partition<LF, A>(HKT2<F, LF, HKT<G, A>> fga, p) {
    final left = this.filter(fga, (a) => !p(a));
    final right = this.filter(fga, p);
    return Separated(left, right);
  }

  @override
  Separated<HKT2<F, LF, HKT<G, RL>>, HKT2<F, LF, HKT<G, RR>>> partitionMap<LF, RL, RR, A>(HKT2<F, LF, HKT<G, A>> fga, Either<RL, RR> Function(A) f) {
    final left = this.filterMap(fga, (a) => f(a).fold(some, (_) => none));
    final right = this.filterMap(fga, (a) => f(a).fold((_) => none, some));
    return Separated(left, right);
  }

  @override
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, B>>> separate<LF, A, B>(HKT2<F, LF, HKT<G, Either<A, B>>> fge) {
    return getCompactableComposition21(f2F, f1G).separate(fge);
  }

}
FilterableComposition21<F, G> getFilterableComposition21<F extends HKT2, G extends HKT>(Functor2<F> f2F, Filterable1<G> f1G) {
  return _GetFilterableComposition21(f2F, f1G);
}

class _GetFilterableComposition12C<F extends HKT, G extends HKT2, LG> extends FilterableComposition12C<F, G, LG> {
  final Functor1<F> f1F;
  final Filterable2C<G, LG> f2cG;
  _GetFilterableComposition12C(this.f1F, this.f2cG);

  @override
  HKT<F, HKT2<G, LG, A>> compact<A>(HKT<F, HKT2<G, LG, Option<A>>> fga) {
    return getCompactableComposition12C(f1F, f2cG).compact(fga);
  }

  @override
  HKT<F, HKT2<G, LG, A>> filter<A>(HKT<F, HKT2<G, LG, A>> fga, p) {
    return f1F.map(fga, (ga) => f2cG.filter(ga, p));
  }

  @override
  HKT<F, HKT2<G, LG, B>> filterMap<A, B>(HKT<F, HKT2<G, LG, A>> fga, Option<B> Function(A) f) {
    return f1F.map(fga, (ga) => f2cG.filterMap(ga, f));
  }

  @override
  HKT<F, HKT2<G, LG, B>> map<A, B>(HKT<F, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return getCompactableComposition12C(f1F, f2cG).map(fa, f);
  }

  @override
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, A>>> partition<A>(HKT<F, HKT2<G, LG, A>> fga, p) {
    final left = this.filter(fga, (a) => !p(a));
    final right = this.filter(fga, p);
    return Separated(left, right);
  }

  @override
  Separated<HKT<F, HKT2<G, LG, RL>>, HKT<F, HKT2<G, LG, RR>>> partitionMap<RL, RR, A>(HKT<F, HKT2<G, LG, A>> fga, Either<RL, RR> Function(A) f) {
    final left = this.filterMap(fga, (a) => f(a).fold(some, (_) => none));
    final right = this.filterMap(fga, (a) => f(a).fold((_) => none, some));
    return Separated(left, right);
  }

  @override
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, B>>> separate<A, B>(HKT<F, HKT2<G, LG, Either<A, B>>> fge) {
    return getCompactableComposition12C(f1F, f2cG).separate(fge);
  }

}
FilterableComposition12C<F, G, LG> getFilterableComposition12C<F extends HKT, G extends HKT2, LG>(Functor1<F> f1F, Filterable2C<G, LG> f2cG) {
  return _GetFilterableComposition12C(f1F, f2cG);
}

class _GetFilterableComposition12<F extends HKT, G extends HKT2> extends FilterableComposition12<F, G> {
  final Functor1<F> f1F;
  final Filterable2<G> f2G;
  _GetFilterableComposition12(this.f1F, this.f2G);

  @override
  HKT<F, HKT2<G, LG, A>> compact<LG, A>(HKT<F, HKT2<G, LG, Option<A>>> fga) {
    return getCompactableComposition12(f1F, f2G).compact(fga);
  }

  @override
  HKT<F, HKT2<G, LG, A>> filter<LG, A>(HKT<F, HKT2<G, LG, A>> fga, p) {
    return f1F.map(fga, (ga) => f2G.filter(ga, p));
  }

  @override
  HKT<F, HKT2<G, LG, B>> filterMap<LG, A, B>(HKT<F, HKT2<G, LG, A>> fga, Option<B> Function(A) f) {
    return f1F.map(fga, (ga) => f2G.filterMap(ga, f));
  }

  @override
  HKT<F, HKT2<G, LG, B>> map<LG, A, B>(HKT<F, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return getCompactableComposition12(f1F, f2G).map(fa, f);
  }

  @override
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, A>>> partition<LG, A>(HKT<F, HKT2<G, LG, A>> fga, p) {
    final left = this.filter(fga, (a) => !p(a));
    final right = this.filter(fga, p);
    return Separated(left, right);
  }

  @override
  Separated<HKT<F, HKT2<G, LG, RL>>, HKT<F, HKT2<G, LG, RR>>> partitionMap<LG, RL, RR, A>(HKT<F, HKT2<G, LG, A>> fga, Either<RL, RR> Function(A) f) {
    final left = this.filterMap(fga, (a) => f(a).fold(some, (_) => none));
    final right = this.filterMap(fga, (a) => f(a).fold((_) => none, some));
    return Separated(left, right);
  }

  @override
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, B>>> separate<LG, A, B>(HKT<F, HKT2<G, LG, Either<A, B>>> fge) {
    return getCompactableComposition12(f1F, f2G).separate(fge);
  }
}
FilterableComposition12<F, G> getFilterableComposition12<F extends HKT, G extends HKT2>(Functor1<F> f1F, Filterable2<G> f2G) {
  return _GetFilterableComposition12(f1F, f2G);
}

class _GetFilterableComposition11<F extends HKT, G extends HKT> extends FilterableComposition11<F, G> {
  final Functor1<F> f1F;
  final Filterable1<G> f1G;
  _GetFilterableComposition11(this.f1F, this.f1G);

  @override
  HKT<F, HKT<G, A>> compact<A>(HKT<F, HKT<G, Option<A>>> fga) {
    return getCompactableComposition11(f1F, f1G).compact(fga);
  }

  @override
  HKT<F, HKT<G, A>> filter<A>(HKT<F, HKT<G, A>> fga, p) {
    return f1F.map(fga, (ga) => f1G.filter(ga, p));
  }

  @override
  HKT<F, HKT<G, B>> filterMap<A, B>(HKT<F, HKT<G, A>> fga, Option<B> Function(A) f) {
    return f1F.map(fga, (ga) => f1G.filterMap(ga, f));
  }

  @override
  HKT<F, HKT<G, B>> map<A, B>(HKT<F, HKT<G, A>> fa, B Function(A a) f) {
    return getCompactableComposition11(f1F, f1G).map(fa, f);
  }

  @override
  Separated<HKT<F, HKT<G, A>>, HKT<F, HKT<G, A>>> partition<A>(HKT<F, HKT<G, A>> fga, p) {
    final left = this.filter(fga, (a) => !p(a));
    final right = this.filter(fga, p);
    return Separated(left, right);
  }

  @override
  Separated<HKT<F, HKT<G, RL>>, HKT<F, HKT<G, RR>>> partitionMap<RL, RR, A>(HKT<F, HKT<G, A>> fga, Either<RL, RR> Function(A) f) {
    final left = this.filterMap(fga, (a) => f(a).fold(some, (_) => none));
    final right = this.filterMap(fga, (a) => f(a).fold((_) => none, some));
    return Separated(left, right);
  }

  @override
  Separated<HKT<F, HKT<G, A>>, HKT<F, HKT<G, B>>> separate<A, B>(HKT<F, HKT<G, Either<A, B>>> fge) {
    return getCompactableComposition11(f1F, f1G).separate(fge);
  }
}
FilterableComposition11<F, G> getFilterableComposition11<F extends HKT, G extends HKT>(Functor1<F> f1F, Filterable1<G> f1G) {
  return _GetFilterableComposition11(f1F, f1G);
}