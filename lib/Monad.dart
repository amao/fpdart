import 'package:fpdart/Applicative.dart';
import 'package:fpdart/Chain.dart';
import 'package:fpdart/Hkt.dart';

abstract class Monad1<F extends HKT> extends Applicative1<F> implements Chain1<F>{}
abstract class Monad2<F extends HKT2> extends Applicative2<F> implements Chain2<F>{}
abstract class Monad3<F extends HKT3> extends Applicative3<F> implements Chain3<F>{}
abstract class Monad2C<F extends HKT2, L> extends Applicative2C<F, L> implements Chain2C<F, L>{}
abstract class Monad3C<F extends HKT3, U, L> extends Applicative3C<F, U, L> implements Chain3C<F, U, L>{}