import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Option.dart';
import 'package:fpdart/Traversable.dart';
import 'package:fpdart/Applicative.dart';
import 'package:fpdart/Either.dart';
import 'package:fpdart/Compactable.dart';
import 'package:fpdart/Filterable.dart';

abstract class Wither1<W extends HKT> {
  HKT3<F, FU, FL, HKT<W, B>> Function(HKT<W, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither13<F extends HKT3, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT<W, B>> Function(HKT<W, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither13C<F extends HKT3, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT<W, B>> Function(HKT<W, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither12<F extends HKT2, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT<W, B>> Function(HKT<W, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither12C<F extends HKT2, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT<W, B>> Function(HKT<W, A> ta, HKT<F, Option<B>> Function(A) f) wither11<F extends HKT, A, B>(Applicative1<F> a1F);
}

abstract class Wither2<W extends HKT2> {
  HKT3<F, FU, FL, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither23<F extends HKT3, WL, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither23C<F extends HKT3, WL, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither22<F extends HKT2, WL, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither22C<F extends HKT2, WL, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT<F, Option<B>> Function(A) f) wither21<F extends HKT, WL, A, B>(Applicative1<F> a1F);
}

abstract class Wither2C<W extends HKT2, WL> {
  HKT3<F, FU, FL, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither2C3<F extends HKT3, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither2C3C<F extends HKT3, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither2C2<F extends HKT2, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither2C2C<F extends HKT2, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT2<W, WL, B>> Function(HKT2<W, WL, A> ta, HKT<F, Option<B>> Function(A) f) wither2C1<F extends HKT, WL, A, B>(Applicative1<F> a1F);
}

abstract class Wither3<W extends HKT3> {
  HKT3<F, FU, FL, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither33<F extends HKT3, WU, WL, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither33C<F extends HKT3, WU, WL, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither32<F extends HKT2, WU, WL, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither32C<F extends HKT2, WU, WL, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT<F, Option<B>> Function(A) f) wither31<F extends HKT, WU, WL, A, B>(Applicative1<F> a1F);
}

abstract class Wither3C<W extends HKT3, WU, WL> {
  HKT3<F, FU, FL, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither3C3<F extends HKT3, FU, FL, A, B>(Applicative3<F> a3F);
  HKT3<F, FU, FL, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT3<F, FU, FL, Option<B>> Function(A) f) wither3C3C<F extends HKT3, FU, FL, A, B>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither3C2<F extends HKT2, FL, A, B>(Applicative2<F> a2F);
  HKT2<F, FL, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT2<F, FL, Option<B>> Function(A) f) wither3C2C<F extends HKT2, FL, A, B>(Applicative2C<F, FL> a2cF);
  HKT<F, HKT3<W, WU, WL, B>> Function(HKT3<W, WU, WL, A> ta, HKT<F, Option<B>> Function(A) f) wither3C1<F extends HKT, A, B>(Applicative1<F> a1F);
}

abstract class Wilt1<W extends HKT> {
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT<W, RR>>> Function(HKT<W, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt13<F extends HKT3, FU, FL, RL, RR, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT<W, RR>>> Function(HKT<W, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt13C<F extends HKT3, FU, FL, RL, RR, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT<W, RR>>> Function(HKT<W, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt12<F extends HKT2, FL, RL, RR, A>(Applicative2<F> a2F);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT<W, RR>>> Function(HKT<W, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt12C<F extends HKT2, FL, RL, RR, A>(Applicative2C<F, FL> a2cF);
  HKT<F, Separated<HKT<W, RL>, HKT<W, RR>>> Function(HKT<W, A> wa, HKT<F, Either<RL, RR>> Function(A) f) wilt11<F extends HKT, RL, RR, A>(Applicative1<F> a1F);
}

abstract class Wilt2<W extends HKT2> {
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt23<F extends HKT3, WL, FU, FL, RL, RR, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt23C<F extends HKT3, WL, FU, FL, RL, RR, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt22<F extends HKT2, WL, FL, RL, RR, A>(Applicative2<F> a2F);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt22C<F extends HKT2, WL, FL, RL, RR, A>(Applicative2C<F, FL> a2cF);
  HKT<F, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT<F, Either<RL, RR>> Function(A) f) wilt21<F extends HKT, WL, RL, RR, A>(Applicative1<F> a1F);
}

abstract class Wilt2C<W extends HKT2, WL> {
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt2C3<F extends HKT3, FU, FL, RL, RR, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt2C3C<F extends HKT3, FU, FL, RL, RR, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt2C2<F extends HKT2, FL, RL, RR, A>(Applicative2<F> a2F);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt2C2C<F extends HKT2, FL, RL, RR, A>(Applicative2C<F, FL> a2cF);
  HKT<F, Separated<HKT<W, RL>, HKT2<W, WL, RR>>> Function(HKT2<W, WL, A> wa, HKT<F, Either<RL, RR>> Function(A) f) wilt2C1<F extends HKT, RL, RR, A>(Applicative1<F> a1F);
}

abstract class Wilt3<W extends HKT3> {
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt33<F extends HKT3, WU, WL, FU, FL, RL, RR, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt33C<F extends HKT3, WU, WL, FU, FL, RL, RR, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt32<F extends HKT2, WU, WL, FL, RL, RR, A>(Applicative2<F> a2F);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt32C<F extends HKT2, WU, WL, FL, RL, RR, A>(Applicative2C<F, FL> a2cF);
  HKT<F, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT<F, Either<RL, RR>> Function(A) f) wilt31<F extends HKT, WU, WL, RL, RR, A>(Applicative1<F> a1F);
}

abstract class Wilt3C<W extends HKT3, WU, WL> {
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt3C3<F extends HKT3, FU, FL, RL, RR, A>(Applicative3<F> a3F);
  HKT3<F, FU, FL, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT3<F, FU, FL, Either<RL, RR>> Function(A) f) wilt3C3C<F extends HKT3, FU, FL, RL, RR, A>(Applicative3C<F, FU, FL> a3cF);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt3C2<F extends HKT2, FL, RL, RR, A>(Applicative2<F> a2F);
  HKT2<F, FL, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT2<F, FL, Either<RL, RR>> Function(A) f) wilt3C2C<F extends HKT2, FL, RL, RR, A>(Applicative2C<F, FL> a2cF);
  HKT<F, Separated<HKT<W, RL>, HKT3<W, WU, WL, RR>>> Function(HKT3<W, WU, WL, A> wa, HKT<F, Either<RL, RR>> Function(A) f) wilt3C1<F extends HKT, RL, RR, A>(Applicative1<F> a1F);
}

abstract class Witherable1<T extends HKT> implements Traversable1<T>, Filterable1<T> {
  Wilt1<T> wilt;
  Wither1<T> wither;
}

abstract class Witherable2<T extends HKT2> implements Traversable2<T>, Filterable2<T> {
  Wilt2<T> wilt;
  Wither2<T> wither;
}

abstract class Witherable2C<T extends HKT2, TL> implements Traversable2C<T, TL>, Filterable2C<T, TL> {
  Wilt2C<T, TL> wilt;
  Wither2C<T, TL> wither;
}

abstract class Witherable3<T extends HKT3> implements Traversable3<T>, Filterable3<T> {
  Wilt3<T> wilt;
  Wither3<T> wither;
}

abstract class Witherable3C<T extends HKT3, TU, TL> implements Traversable3C<T, TU, TL>, Filterable3C<T, TU, TL> {
  Wilt3C<T, TU, TL> wilt;
  Wither3C<T, TU, TL> wither;
}