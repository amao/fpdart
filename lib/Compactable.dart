import 'package:fpdart/Either.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Option.dart';
import 'package:fpdart/Functor.dart';

class Separated<A, B> {
  final A left;
  final B right;
  Separated(this.left, this.right);
}

abstract class Compactable1<F extends HKT> {
  HKT<F, A> compact<A>(HKT<F, Option<A>> fa);
  Separated<HKT<F, A>, HKT<F, B>> separate<A, B>(HKT<F, Either<A, B>> fa);
}

abstract class Compactable2<F extends HKT2> {
  HKT2<F, L, A> compact<L, A>(HKT2<F, L, Option<A>> fa);
  Separated<HKT2<F, L, A>, HKT2<F, L, B>> separate<L, A, B>(HKT2<F, L, Either<A, B>> fa);
}

abstract class Compactable2C<F extends HKT2, L> {
  HKT2<F, L, A> compact<A>(HKT2<F, L, Option<A>> fa);
  Separated<HKT2<F, L, A>, HKT2<F, L, B>> separate<A, B>(HKT2<F, L, Either<A, B>> fa);
}

abstract class Compactable3<F extends HKT3> {
  HKT3<F, U, L, A> compact<U, L, A>(HKT3<F, U, L, Option<A>> fa);
  Separated<HKT3<F, U, L, A>, HKT3<F, U, L, B>> separate<U, L, A, B>(HKT3<F, U, L, Either<A, B>> fa);
}

abstract class Compactable3C<F extends HKT3, U, L> {
  HKT3<F, U, L, A> compact<A>(HKT3<F, U, L, Option<A>> fa);
  Separated<HKT3<F, U, L, A>, HKT3<F, U, L, B>> separate<A, B>(HKT3<F, U, L, Either<A, B>> fa);
}

abstract class CompactableComposition11<F extends HKT, G extends HKT> extends FunctorComposition11<F, G> {
  HKT<F, HKT<G, A>> compact<A>(HKT<F, HKT<G, Option<A>>> fga);
  Separated<HKT<F, HKT<G, A>>, HKT<F, HKT<G, B>>> separate<A, B>(HKT<F, HKT<G, Either<A, B>>> fge);
}

abstract class CompactableComposition12<F extends HKT, G extends HKT2> extends FunctorComposition12<F, G> {
  HKT<F, HKT2<G, LG, A>> compact<LG, A>(HKT<F, HKT2<G, LG, Option<A>>> fga);
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, B>>> separate<LG, A, B>(HKT<F, HKT2<G, LG, Either<A, B>>> fge);
}

abstract class CompactableComposition12C<F extends HKT, G extends HKT2, LG> extends FunctorComposition12C<F, G, LG> {
  HKT<F, HKT2<G, LG, A>> compact<A>(HKT<F, HKT2<G, LG, Option<A>>> fga);
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, B>>> separate<A, B>(HKT<F, HKT2<G, LG, Either<A, B>>> fge);
}

abstract class CompactableComposition21<F extends HKT2, G extends HKT> extends FunctorComposition21<F, G> {
  HKT2<F, LF, HKT<G, A>> compact<LF, A>(HKT2<F, LF, HKT<G, Option<A>>> fga);
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, B>>> separate<LF, A, B>(HKT2<F, LF, HKT<G, Either<A, B>>> fge);
}

abstract class CompactableComposition2C1<F extends HKT2, G extends HKT, LF> extends FunctorComposition2C1<F, G, LF> {
  HKT2<F, LF, HKT<G, A>> compact<A>(HKT2<F, LF, HKT<G, Option<A>>> fga);
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, B>>> separate<A, B>(HKT2<F, LF, HKT<G, Either<A, B>>> fge);
}

abstract class CompactableComposition22<F extends HKT2, G extends HKT2> extends FunctorComposition22<F, G> {
  HKT2<F, LF, HKT2<G, LG, A>> compact<LF, LG, A>(HKT2<F, LF, HKT2<G, LG, Option<A>>> fga);
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, B>>> separate<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, Either<A, B>>> fge);
}

abstract class CompactableComposition22C<F extends HKT2, G extends HKT2, LG> extends FunctorComposition22C<F, G, LG> {
  HKT2<F, LF, HKT2<G, LG, A>> compact<LF, A>(HKT2<F, LF, HKT2<G, LG, Option<A>>> fga);
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, B>>> separate<LF, A, B>(HKT2<F, LF, HKT2<G, LG, Either<A, B>>> fge);
}

abstract class CompactableComposition3C1<F extends HKT3, G extends HKT, UF, LF> extends FunctorComposition3C1<F, G, UF, LF> {
  HKT3<F, UF, LF, HKT<G, A>> compact<A>(HKT3<F, UF, LF, HKT<G, Option<A>>> fga);
  Separated<HKT3<F, UF, LF, HKT<G, A>>, HKT3<F, UF, LF, HKT<G, B>>> separate<A, B>(HKT3<F, UF, LF, HKT<G, Either<A, B>>> fge);
}

abstract class Compactable1AndFunctor1<F extends HKT> implements Compactable1<F>, Functor1<F> {}
class _GetCompactableComposition3C1<F extends HKT3, G extends HKT, UF, LF> extends CompactableComposition3C1<F, G, UF, LF> {
  final Functor3C<F, UF, LF> f3c;
  final Compactable1AndFunctor1<G> c1andf1;
  _GetCompactableComposition3C1(this.f3c, this.c1andf1);

  @override
  HKT3<F, UF, LF, HKT<G, A>> compact<A>(HKT3<F, UF, LF, HKT<G, Option<A>>> fga) {
    return f3c.map(fga, c1andf1.compact);
  }

  @override
  Separated<HKT3<F, UF, LF, HKT<G, A>>, HKT3<F, UF, LF, HKT<G, B>>> separate<A, B>(HKT3<F, UF, LF, HKT<G, Either<A, B>>> fge) {
    final FC = getFunctorComposition3C1(f3c, c1andf1);
    final left = this.compact(FC.map(fge, (e) => e.fold(some, () => none)));
    final right = this.compact(FC.map(fge, fromEither));
    return Separated(left, right);
  }

  @override
  HKT3<F, UF, LF, HKT<G, B>> map<A, B>(HKT3<F, UF, LF, HKT<G, A>> fa, B Function(A a) f) {
    final FC = getFunctorComposition3C1(f3c, c1andf1);
    return FC.map(fa, f);
  }
}
CompactableComposition3C1<F, G, UF, LF> getCompactableComposition3C1<F extends HKT3, G extends HKT, UF, LF>(Functor3C<F, UF, LF> f3c, Compactable1AndFunctor1<G> c1andf1) {
  return _GetCompactableComposition3C1(f3c, c1andf1);
}

abstract class Compactable2CAndFunctor2C<F extends HKT2, L> implements Compactable2C<F, L>, Functor2C<F, L> {}
class _GetCompactableComposition22C<F extends HKT2, G extends HKT2, LG> extends CompactableComposition22C<F, G, LG> {
  final Functor2<F> f2;
  final Compactable2CAndFunctor2C<G, LG> c2candf2c;
  _GetCompactableComposition22C(this.f2, this.c2candf2c);

  @override
  HKT2<F, LF, HKT2<G, LG, A>> compact<LF, A>(HKT2<F, LF, HKT2<G, LG, Option<A>>> fga) {
    return f2.map(fga, c2candf2c.compact);
  }

  @override
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, B>>> separate<LF, A, B>(HKT2<F, LF, HKT2<G, LG, Either<A, B>>> fge) {
    final FC = getFunctorComposition22C(f2, c2candf2c);
    final left = this.compact(FC.map(fge, (e) => e.fold(some, () => none)));
    final right = this.compact(FC.map(fge, fromEither));
    return Separated(left, right);
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B Function(A a) f) {
    final FC = getFunctorComposition22C(f2, c2candf2c);
    return FC.map(fa, f);
  }
}
CompactableComposition22C<F, G, LG> getCompactableComposition22C<F extends HKT2, G extends HKT2, LG>(Functor2<F> f2, Compactable2CAndFunctor2C<G, LG> c2candf2c) {
  return _GetCompactableComposition22C(f2, c2candf2c);
}

abstract class Compactable2AndFunctor2<F extends HKT2> implements Compactable2<F>, Functor2<F> {}
class _GetCompactableComposition22<F extends HKT2, G extends HKT2> extends CompactableComposition22<F, G> {
  final Functor2<F> f2;
  final Compactable2AndFunctor2<G> c2andf2;
  _GetCompactableComposition22(this.f2, this.c2andf2);

  @override
  HKT2<F, LF, HKT2<G, LG, A>> compact<LF, LG, A>(HKT2<F, LF, HKT2<G, LG, Option<A>>> fga) {
    return f2.map(fga, c2andf2.compact);
  }

  @override
  Separated<HKT2<F, LF, HKT2<G, LG, A>>, HKT2<F, LF, HKT2<G, LG, B>>> separate<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, Either<A, B>>> fge) {
    final FC = getFunctorComposition22(f2, c2andf2);
    final left = this.compact(FC.map(fge, (e) => e.fold(some, () => none)));
    final right = this.compact(FC.map(fge, fromEither));
    return Separated(left, right);
  }

  @override
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B Function(A a) f) {
    final FC = getFunctorComposition22(f2, c2andf2);
    return FC.map(fa, f);
  }
}
CompactableComposition22<F, G> getCompactableComposition22<F extends HKT2, G extends HKT2>(Functor2<F> f2, Compactable2AndFunctor2<G> c2andf2) {
  return _GetCompactableComposition22(f2, c2andf2);
}

class _GetCompactableComposition2C1<F extends HKT2, G extends HKT, LF> extends CompactableComposition2C1<F, G, LF> {
  final Functor2C<F, LF> f2c;
  final Compactable1AndFunctor1<G> c1andf1;
  _GetCompactableComposition2C1(this.f2c, this.c1andf1);

  @override
  HKT2<F, LF, HKT<G, A>> compact<A>(HKT2<F, LF, HKT<G, Option<A>>> fga) {
    return f2c.map(fga, c1andf1.compact);
  }

  @override
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, B>>> separate<A, B>(HKT2<F, LF, HKT<G, Either<A, B>>> fge) {
    final FC = getFunctorComposition2C1(f2c, c1andf1);
    final left = this.compact(FC.map(fge, (e) => e.fold(some, () => none)));
    final right = this.compact(FC.map(fge, fromEither));
    return Separated(left, right);
  }

  @override
  HKT2<F, LF, HKT<G, B>> map<A, B>(HKT2<F, LF, HKT<G, A>> fa, B Function(A a) f) {
    final FC = getFunctorComposition2C1(f2c, c1andf1);
    return FC.map(fa, f);
  }
}
CompactableComposition2C1<F, G, LF> getCompactableComposition2C1<F extends HKT2, G extends HKT, LF>(Functor2C<F, LF> f2c, Compactable1AndFunctor1<G> c1andf1) {
  return _GetCompactableComposition2C1(f2c, c1andf1);
}

class _GetCompactableComposition21<F extends HKT2, G extends HKT> extends CompactableComposition21<F, G> {
  final Functor2<F> f2;
  final Compactable1AndFunctor1<G> c1andf1;
  _GetCompactableComposition21(this.f2, this.c1andf1);

  @override
  HKT2<F, LF, HKT<G, A>> compact<LF, A>(HKT2<F, LF, HKT<G, Option<A>>> fga) {
    return f2.map(fga, c1andf1.compact);
  }

  @override
  Separated<HKT2<F, LF, HKT<G, A>>, HKT2<F, LF, HKT<G, B>>> separate<LF, A, B>(HKT2<F, LF, HKT<G, Either<A, B>>> fge) {
    final FC = getFunctorComposition21(f2, c1andf1);
    final left = this.compact(FC.map(fge, (e) => e.fold(some, () => none)));
    final right = this.compact(FC.map(fge, fromEither));
    return Separated(left, right);
  }

  @override
  HKT2<F, LF, HKT<G, B>> map<LF, A, B>(HKT2<F, LF, HKT<G, A>> fa, B Function(A a) f) {
    final FC = getFunctorComposition21(f2, c1andf1);
    return FC.map(fa, f);
  }
}
CompactableComposition21<F, G> getCompactableComposition21<F extends HKT2, G extends HKT>(Functor2<F> f2, Compactable1AndFunctor1<G> c1andf1) {
  return _GetCompactableComposition21(f2, c1andf1);
}

class _GetCompactableComposition12C<F extends HKT, G extends HKT2, LG> extends CompactableComposition12C<F, G, LG> {
  final Functor1<F> f1;
  final Compactable2CAndFunctor2C<G, LG> c2candf2c;
  _GetCompactableComposition12C(this.f1, this.c2candf2c);

  @override
  HKT<F, HKT2<G, LG, A>> compact<A>(HKT<F, HKT2<G, LG, Option<A>>> fga) {
    return f1.map(fga, c2candf2c.compact);
  }

  @override
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, B>>> separate<A, B>(HKT<F, HKT2<G, LG, Either<A, B>>> fge) {
    final FC = getFunctorComposition12C(f1, c2candf2c);
    final left = this.compact(FC.map(fge, (e) => e.fold(some, () => none)));
    final right = this.compact(FC.map(fge, fromEither));
    return Separated(left, right);
  }

  @override
  HKT<F, HKT2<G, LG, B>> map<A, B>(HKT<F, HKT2<G, LG, A>> fa, B Function(A a) f) {
    final FC = getFunctorComposition12C(f1, c2candf2c);
    return FC.map(fa, f);
  }
}
CompactableComposition12C<F, G, LG> getCompactableComposition12C<F extends HKT, G extends HKT2, LG>(Functor1<F> f1, Compactable2CAndFunctor2C<G, LG> c2candf2c) {
  return _GetCompactableComposition12C(f1, c2candf2c);
}

class _GetCompactableComposition12<F extends HKT, G extends HKT2> extends CompactableComposition12<F, G> {
  final Functor1<F> f1;
  final Compactable2AndFunctor2<G> c2andf2;
  _GetCompactableComposition12(this.f1, this.c2andf2);

  @override
  HKT<F, HKT2<G, LG, A>> compact<LG, A>(HKT<F, HKT2<G, LG, Option<A>>> fga) {
    return f1.map(fga, c2andf2.compact);
  }

  @override
  Separated<HKT<F, HKT2<G, LG, A>>, HKT<F, HKT2<G, LG, B>>> separate<LG, A, B>(HKT<F, HKT2<G, LG, Either<A, B>>> fge) {
    final FC = getFunctorComposition12(f1, c2andf2);
    final left = this.compact(FC.map(fge, (e) => e.fold(some, () => none)));
    final right = this.compact(FC.map(fge, fromEither));
    return Separated(left, right);
  }

  @override
  HKT<F, HKT2<G, LG, B>> map<LG, A, B>(HKT<F, HKT2<G, LG, A>> fa, B Function(A a) f) {
    final FC = getFunctorComposition12(f1, c2andf2);
    return FC.map(fa, f);
  }
}
CompactableComposition12<F, G> getCompactableComposition12<F extends HKT, G extends HKT2>(Functor1<F> f1, Compactable2AndFunctor2<G> c2andf2) {
  return _GetCompactableComposition12(f1, c2andf2);
}

class _GetCompactableComposition11<F extends HKT, G extends HKT> extends CompactableComposition11<F, G> {
  final Functor1<F> f1;
  final Compactable1AndFunctor1<G> c1andf1;
  _GetCompactableComposition11(this.f1, this.c1andf1);

  @override
  HKT<F, HKT<G, A>> compact<A>(HKT<F, HKT<G, Option<A>>> fga) {
    return f1.map(fga, c1andf1.compact);
  }

  @override
  Separated<HKT<F, HKT<G, A>>, HKT<F, HKT<G, B>>> separate<A, B>(HKT<F, HKT<G, Either<A, B>>> fge) {
    final FC = getFunctorComposition(f1, c1andf1);
    final left = this.compact(FC.map(fge, (e) => e.fold(some, () => none)));
    final right = this.compact(FC.map(fge, fromEither));
    return Separated(left, right);
  }

  @override
  HKT<F, HKT<G, B>> map<A, B>(HKT<F, HKT<G, A>> fa, B Function(A a) f) {
    final FC = getFunctorComposition(f1, c1andf1);
    return FC.map(fa, f);
  }

}
CompactableComposition11<F, G> getCompactableComposition11<F extends HKT, G extends HKT>(Functor1<F> f1, Compactable1AndFunctor1<G> c1andf1) {
  return _GetCompactableComposition11(f1, c1andf1);
}
























