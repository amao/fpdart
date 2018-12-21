import 'package:fpdart/Hkt.dart';

abstract class Bifunctor2<F extends HKT2> {
  HKT2<F, M, B> bimap<L, A, M, B>(HKT2<F, L, A> fla, M Function(L) f, B Function(A) g);
}

abstract class Bifunctor3<F extends HKT3> {
  HKT3<F, U, M, B> bimap<U, L, A, M, B>(HKT3<F, U, L, A> fla, M Function(L l) f, B Function(A a) g);
}

abstract class Bifunctor3C<F extends HKT3, U> {
  HKT3<F, U, M, B> bimap<L, A, M, B>(HKT3<F, U, L, A> fla, M Function(L l) f, B Function(A a) g);
}



