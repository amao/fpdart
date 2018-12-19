abstract class HKT<F, A> {}
abstract class HKT2<F, A, B> extends HKT<HKT<F, A>, B> {}
abstract class HKT3<F, A, B, C> extends HKT2<HKT<F, A>, B, C> {}
abstract class HKT4<F, A, B, C, D> extends HKT3<HKT<F, A>, B, C, D> {}