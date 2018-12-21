import 'package:fpdart/Applicative.dart';
import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Plus.dart';

abstract class Alternative1<F extends HKT> extends Applicative1<F> implements Plus1<F> {}

abstract class Alternative2<F extends HKT2> extends Applicative2<F> implements Plus2<F> {}

abstract class Alternative3<F extends HKT3> extends Applicative3<F> implements Plus3<F> {}

abstract class Alternative2C<F extends HKT2, L> extends Applicative2C<F, L> implements Plus2C<F, L> {}

abstract class Alternative3C<F extends HKT3, U, L> extends Applicative3C<F, U, L> implements Plus3C<F, U, L> {}