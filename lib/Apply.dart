import 'package:fpdart/Hkt.dart';
import 'package:fpdart/Functor.dart';
import 'package:fpdart/function.dart';
import 'package:fpdart/Semigroup.dart';

abstract class Apply1<F extends HKT> extends Functor1<F> {
  HKT<F, B> ap<A, B>(HKT<F, B Function(A)> fab, HKT<F, A> fa);
}

abstract class Apply2<F extends HKT2> extends Functor2<F> {
  HKT2<F, L, B> ap<L, A, B>(HKT2<F, L, B Function(A)> fab, HKT2<F, L, A> fa);
}

abstract class Apply3<F extends HKT3> extends Functor3<F> {
  HKT3<F, U, L, B> ap<U, L, A, B>(HKT3<F, U, L, B Function(A)> fab, HKT3<F, U, L, A> fa);
}

abstract class Apply2C<F extends HKT2, L> extends Functor2C<F, L> {
  HKT2<F, L, B> ap<A, B>(HKT2<F, L, B Function(A)> fab, HKT2<F, L, A> fa);
}

abstract class Apply3C<F extends HKT3, U, L> extends Functor3C<F, U, L> {
  HKT3<F, U, L, B> ap<A, B>(HKT3<F, U, L, B Function(A)> fab, HKT3<F, U, L, A> fa);
}

//applyFirst

HKT3<F, U, L, A> Function(HKT3<F, U, L, A> fa, HKT3<F, U, L, B> fb) applyFirst3<F extends HKT3, U, L, A, B>(Apply3<F> apply) {
  return (HKT3<F, U, L, A> fa, HKT3<F, U, L, B> fb) => apply.ap(apply.map(fa, constant), fb);
}

HKT3<F, U, L, A> Function(HKT3<F, U, L, A> fa, HKT3<F, U, L, B> fb) applyFirst3C<F extends HKT3, U, L, A, B>(Apply3C<F, U, L> apply) {
  return (HKT3<F, U, L, A> fa, HKT3<F, U, L, B> fb) => apply.ap(apply.map(fa, constant), fb);
}

HKT2<F, L, A> Function(HKT2<F, L, A> fa, HKT2<F, L, B> fb) applyFirst2<F extends HKT2, L, A, B>(Apply2<F> apply) {
  return (HKT2<F, L, A> fa, HKT2<F, L, B> fb) => apply.ap(apply.map(fa, constant), fb);
}

HKT2<F, L, A> Function(HKT2<F, L, A> fa, HKT2<F, L, B> fb) applyFirst2C<F extends HKT2, L, A, B>(Apply2C<F, L> apply) {
  return (HKT2<F, L, A> fa, HKT2<F, L, B> fb) => apply.ap(apply.map(fa, constant), fb);
}

HKT<F, A> Function(HKT<F, A> fa, HKT<F, B> fb) applyFirst<F extends HKT, A, B>(Apply1<F> apply) {
  return (HKT<F, A> fa, HKT<F, B> fb) => apply.ap(apply.map(fa, constant), fb);
}

// applySecond

HKT3<F, U, L, B> Function(HKT3<F, U, L, A> fa, HKT3<F, U, L, B> fb) applySecond3<F extends HKT3, U, L, A, B>(Apply3<F> apply) {
  return (HKT3<F, U, L, A> fa, HKT3<F, U, L, B> fb) => apply.ap(apply.map(fa, (_) => (B b) => b), fb);
}

HKT3<F, U, L, B> Function(HKT3<F, U, L, A> fa, HKT3<F, U, L, B> fb) applySecond3C<F extends HKT3, U, L, A, B>(Apply3C<F, U, L> apply) {
  return (HKT3<F, U, L, A> fa, HKT3<F, U, L, B> fb) => apply.ap(apply.map(fa, (_) => (B b) => b), fb);
}

HKT2<F, L, B> Function(HKT2<F, L, A> fa, HKT2<F, L, B> fb) applySecond2<F extends HKT2, L, A, B>(Apply2<F> apply) {
  return (HKT2<F, L, A> fa, HKT2<F, L, B> fb) => apply.ap(apply.map(fa, (_) => (B b) => b), fb);
}

HKT2<F, L, B> Function(HKT2<F, L, A> fa, HKT2<F, L, B> fb) applySecond2C<F extends HKT2, L, A, B>(Apply2C<F, L> apply) {
  return (HKT2<F, L, A> fa, HKT2<F, L, B> fb) => apply.ap(apply.map(fa, (_) => (B b) => b), fb);
}

HKT<F, B> Function(HKT<F, A> fa, HKT<F, B> fb) applySecond<F extends HKT, A, B>(Apply1<F> apply) {
  return (HKT<F, A> fa, HKT<F, B> fb) => apply.ap(apply.map(fa, (_) => (B b) => b), fb);
}

// liftA2

HKT3<F, U, L, C> Function(HKT3<F, U, L, B>) Function(HKT3<F, U, L, A>) Function(Curried2<A, B, C>) liftA23<F extends HKT3, U, L, A, B, C>(Apply3<F> apply) {
  return (Curried2<A, B, C> f) => (HKT3<F, U, L, A> fa) => (HKT3<F, U, L, B> fb) => apply.ap(apply.map(fa, f), fb);
}

HKT3<F, U, L, C> Function(HKT3<F, U, L, B>) Function(HKT3<F, U, L, A>) Function(Curried2<A, B, C>) liftA23C<F extends HKT3, U, L, A, B, C>(Apply3C<F, U, L> apply) {
  return (Curried2<A, B, C> f) => (HKT3<F, U, L, A> fa) => (HKT3<F, U, L, B> fb) => apply.ap(apply.map(fa, f), fb);
}

HKT2<F, L, C> Function(HKT2<F, L, B>) Function(HKT2<F, L, A>) Function(Curried2<A, B, C>) liftA22<F extends HKT2, L, A, B, C>(Apply2<F> apply) {
  return (Curried2<A, B, C> f) => (HKT2<F, L, A> fa) => (HKT2<F, L, B> fb) => apply.ap(apply.map(fa, f), fb);
}

HKT2<F, L, C> Function(HKT2<F, L, B>) Function(HKT2<F, L, A>) Function(Curried2<A, B, C>) liftA22C<F extends HKT2, L, A, B, C>(Apply2C<F, L> apply) {
  return (Curried2<A, B, C> f) => (HKT2<F, L, A> fa) => (HKT2<F, L, B> fb) => apply.ap(apply.map(fa, f), fb);
}

HKT<F, C> Function(HKT<F, B>) Function(HKT<F, A>) Function(Curried2<A, B, C>) liftA21<F extends HKT, A, B, C>(Apply1<F> apply) {
  return (Curried2<A, B, C> f) => (HKT<F, A> fa) => (HKT<F, B> fb) => apply.ap(apply.map(fa, f), fb);
}

// liftA3

HKT3<F, U, L, D> Function(HKT3<F, U, L, C>) Function(HKT3<F, U, L, B>) Function(HKT3<F, U, L, A>) Function(Curried3<A, B, C, D>) liftA33<F extends HKT3, U, L, A, B, C, D>(Apply3<F> apply) {
  return (Curried3<A, B, C, D> f) => (HKT3<F, U, L, A> fa) => (HKT3<F, U, L, B> fb) => (HKT3<F, U, L, C> fc) => apply.ap(apply.ap(apply.map(fa, f), fb), fc);
}

HKT3<F, U, L, D> Function(HKT3<F, U, L, C>) Function(HKT3<F, U, L, B>) Function(HKT3<F, U, L, A>) Function(Curried3<A, B, C, D>) liftA33C<F extends HKT3, U, L, A, B, C, D>(Apply3C<F, U, L> apply) {
  return (Curried3<A, B, C, D> f) => (HKT3<F, U, L, A> fa) => (HKT3<F, U, L, B> fb) => (HKT3<F, U, L, C> fc) => apply.ap(apply.ap(apply.map(fa, f), fb), fc);
}

HKT2<F, L, D> Function(HKT2<F, L, C>) Function(HKT2<F, L, B>) Function(HKT2<F, L, A>) Function(Curried3<A, B, C, D>) liftA32<F extends HKT2, L, A, B, C, D>(Apply2<F> apply) {
  return (Curried3<A, B, C, D> f) => (HKT2<F, L, A> fa) => (HKT2<F, L, B> fb) => (HKT2<F, L, C> fc) => apply.ap(apply.ap(apply.map(fa, f), fb), fc);
}

HKT2<F, L, D> Function(HKT2<F, L, C>) Function(HKT2<F, L, B>) Function(HKT2<F, L, A>) Function(Curried3<A, B, C, D>) liftA32C<F extends HKT2, L, A, B, C, D>(Apply2C<F, L> apply) {
  return (Curried3<A, B, C, D> f) => (HKT2<F, L, A> fa) => (HKT2<F, L, B> fb) => (HKT2<F, L, C> fc) => apply.ap(apply.ap(apply.map(fa, f), fb), fc);
}

HKT<F, D> Function(HKT<F, C>) Function(HKT<F, B>) Function(HKT<F, A>) Function(Curried3<A, B, C, D>) liftA31<F extends HKT, A, B, C, D>(Apply1<F> apply) {
  return (Curried3<A, B, C, D> f) => (HKT<F, A> fa) => (HKT<F, B> fb) => (HKT<F, C> fc) => apply.ap(apply.ap(apply.map(fa, f), fb), fc);
}

//liftA4

HKT3<F, U, L, E> Function(HKT3<F, U, L, D>) Function(HKT3<F, U, L, C>) Function(HKT3<F, U, L, B>) Function(HKT3<F, U, L, A>) Function(Curried4<A, B, C, D, E>) liftA43<F extends HKT3, U, L, A, B, C, D, E>(Apply3<F> apply) {
  return (Curried4<A, B, C, D, E> f) => (HKT3<F, U, L, A> fa) => (HKT3<F, U, L, B> fb) => (HKT3<F, U, L, C> fc) => (HKT3<F, U, L, D> fd) => apply.ap(apply.ap(apply.ap(apply.map(fa, f), fb), fc), fd);
}

HKT3<F, U, L, E> Function(HKT3<F, U, L, D>) Function(HKT3<F, U, L, C>) Function(HKT3<F, U, L, B>) Function(HKT3<F, U, L, A>) Function(Curried4<A, B, C, D, E>) liftA43C<F extends HKT3, U, L, A, B, C, D, E>(Apply3C<F, U, L> apply) {
  return (Curried4<A, B, C, D, E> f) => (HKT3<F, U, L, A> fa) => (HKT3<F, U, L, B> fb) => (HKT3<F, U, L, C> fc) => (HKT3<F, U, L, D> fd) => apply.ap(apply.ap(apply.ap(apply.map(fa, f), fb), fc), fd);
}

HKT2<F, L, E> Function(HKT2<F, L, D>) Function(HKT2<F, L, C>) Function(HKT2<F, L, B>) Function(HKT2<F, L, A>) Function(Curried4<A, B, C, D, E>) liftA42<F extends HKT2, L, A, B, C, D, E>(Apply2<F> apply) {
  return (Curried4<A, B, C, D, E> f) => (HKT2<F, L, A> fa) => (HKT2<F, L, B> fb) => (HKT2<F, L, C> fc) => (HKT2<F, L, D> fd) => apply.ap(apply.ap(apply.ap(apply.map(fa, f), fb), fc), fd);
}

HKT2<F, L, E> Function(HKT2<F, L, D>) Function(HKT2<F, L, C>) Function(HKT2<F, L, B>) Function(HKT2<F, L, A>) Function(Curried4<A, B, C, D, E>) liftA42C<F extends HKT2, L, A, B, C, D, E>(Apply2C<F, L> apply) {
  return (Curried4<A, B, C, D, E> f) => (HKT2<F, L, A> fa) => (HKT2<F, L, B> fb) => (HKT2<F, L, C> fc) => (HKT2<F, L, D> fd) => apply.ap(apply.ap(apply.ap(apply.map(fa, f), fb), fc), fd);
}

HKT<F, E> Function(HKT<F, D>) Function(HKT<F, C>) Function(HKT<F, B>) Function(HKT<F, A>) Function(Curried4<A, B, C, D, E>) liftA41<F extends HKT, A, B, C, D, E>(Apply1<F> apply) {
  return (Curried4<A, B, C, D, E> f) => (HKT<F, A> fa) => (HKT<F, B> fb) => (HKT<F, C> fc) => (HKT<F, D> fd) => apply.ap(apply.ap(apply.ap(apply.map(fa, f), fb), fc), fd);
}

//HKT3<F, U, L, C> Function(HKT3<F, U, L, B>) Function(HKT3<F, U, L, A>) Function(Curried2<A, B, C>) liftA23<F extends HKT3, U, L, A, B, C>(Apply3<F> apply) {
//  return (Curried2<A, B, C> f) => (HKT3<F, U, L, A> fa) => (HKT3<F, U, L, B> fb) => apply.ap(apply.map(fa, f), fb);
//}

class GetSemigroup3<F extends HKT3, U, L, A> extends Semigroup<HKT3<F, U, L, A>> {
  final Apply3<F> _apply;
  final Semigroup<A> _S;
  GetSemigroup3(this._apply, this._S);

  @override
  HKT3<F, U, L, A> concat(HKT3<F, U, L, A> x, HKT3<F, U, L, A> y) {
    final concatLifted = liftA23(_apply)((a) => (b) => _S.concat(a, b));
    return concatLifted(x)(y);
  }
}

Semigroup<HKT3<F, U, L, A>> Function() getSemigroup3<F extends HKT3, U, L, A>(Apply3<F> apply, Semigroup<A> S) {
  return () => GetSemigroup3(apply, S);
}

class GetSemigroup3C<F extends HKT3, U, L, A> extends Semigroup<HKT3<F, U, L, A>> {
  final Apply3C<F, U, L> _apply;
  final Semigroup<A> _S;
  GetSemigroup3C(this._apply, this._S);

  @override
  HKT3<F, U, L, A> concat(HKT3<F, U, L, A> x, HKT3<F, U, L, A> y) {
    final concatLifted = liftA23C(_apply)((a) => (b) => _S.concat(a, b));
    return concatLifted(x)(y);
  }
}

Semigroup<HKT3<F, U, L, A>> Function() getSemigroup3C<F extends HKT3, U, L, A>(Apply3C<F, U, L> apply, Semigroup<A> S) {
  return () => GetSemigroup3C(apply, S);
}

class GetSemigroup2<F extends HKT3, L, A> extends Semigroup<HKT2<F, L, A>> {
  final Apply2<F> _apply;
  final Semigroup<A> _S;
  GetSemigroup2(this._apply, this._S);

  @override
  HKT2<F, L, A> concat(HKT2<F, L, A> x, HKT2<F, L, A> y) {
    final concatLifted = liftA22(_apply)((a) => (b) => _S.concat(a, b));
    return concatLifted(x)(y);
  }
}

Semigroup<HKT2<F, L, A>> Function() getSemigroup2<F extends HKT2, L, A>(Apply2<F> apply, Semigroup<A> S) {
  return () => GetSemigroup2(apply, S);
}

class GetSemigroup2C<F extends HKT2, L, A> extends Semigroup<HKT2<F, L, A>> {
  final Apply2C<F, L> _apply;
  final Semigroup<A> _S;
  GetSemigroup2C(this._apply, this._S);

  @override
  HKT2<F, L, A> concat(HKT2<F, L, A> x, HKT2<F, L, A> y) {
    final concatLifted = liftA22C(_apply)((a) => (b) => _S.concat(a, b));
    return concatLifted(x)(y);
  }
}

Semigroup<HKT2<F, L, A>> Function() getSemigroup2C<F extends HKT2, L, A>(Apply2C<F, L> apply, Semigroup<A> S) {
  return () => GetSemigroup2C(apply, S);
}

class GetSemigroup1<F extends HKT, A> extends Semigroup<HKT<F, A>> {
  final Apply1<F> _apply;
  final Semigroup<A> _S;
  GetSemigroup1(this._apply, this._S);

  @override
  HKT<F, A> concat(HKT<F, A> x, HKT<F, A> y) {
    final concatLifted = liftA21(_apply)((a) => (b) => _S.concat(a, b));
    return concatLifted(x)(y);
  }
}

Semigroup<HKT<F, A>> Function() getSemigroup1<F extends HKT, A>(Apply1<F> apply, Semigroup<A> S) {
  return () => GetSemigroup1(apply, S);
}

abstract class SequenceT3<F extends HKT3> {
  HKT3<F, U, L, List<dynamic>> sequenceT3<U, L, A, B, C, D, E>(HKT3<F, U, L, A> a, [HKT3<F, U, L, B> b, HKT3<F, U, L, C> c, HKT3<F, U, L, D> d, HKT3<F, U, L, E> e]);
}

abstract class SequenceT3C<F extends HKT3, U, L> {
  HKT3<F, U, L, List<dynamic>> sequenceT3C<A, B, C, D, E>(HKT3<F, U, L, A> a, [HKT3<F, U, L, B> b, HKT3<F, U, L, C> c, HKT3<F, U, L, D> d, HKT3<F, U, L, E> e]);
}

abstract class SequenceT2<F extends HKT2> {
  HKT2<F, L, List<dynamic>> sequenceT2<L, A, B, C, D, E>(HKT2<F, L, A> a, [HKT2<F, L, B> b, HKT2<F, L, C> c, HKT2<F, L, D> d, HKT2<F, L, E> e]);
}

abstract class SequenceT2C<F extends HKT2, L> {
  HKT2<F, L, List<dynamic>> sequenceT2C<A, B, C, D, E>(HKT2<F, L, A> a, [HKT2<F, L, B> b, HKT2<F, L, C> c, HKT2<F, L, C> d, HKT2<F, L, E> e]);
}

abstract class SequenceT1<F> {
  HKT<F,List<dynamic>> sequenceT1<A, B, C, D, E>(HKT<F, A> a, [HKT<F, B> b, HKT<F, C> c, HKT<F, D> d, HKT<F, E> e]);
}

class SequenceT3Class<F extends HKT3> extends SequenceT3<F> {
  final Apply3<F> _apply;
  SequenceT3Class(this._apply);

  @override
  HKT3<F, U, L, List> sequenceT3<U, L, A, B, C, D, E>(HKT3<F, U, L, A> a, [HKT3<F, U, L, B> b, HKT3<F, U, L, C> c, HKT3<F, U, L, D> d, HKT3<F, U, L, E> e]) {
    final args = b != null ? (c != null ? (d != null ? (e != null ? [a, b, c, d, e] : [a, b, c, d]) : [a, b, c]) : [a, b]) : [a];
    final len = args.length;
    final f = curried((args) => args, len - 1, []);
    var r = _apply.map(args[0], f);
    for (var i = 1; i < len; i++) {
      r = _apply.ap(r, args[i]);
    }
    return r;
  }
}

SequenceT3<F> sequenceT3<F extends HKT3, U, L>(Apply3<F> apply) {
  return SequenceT3Class(apply);
}

class SequenceT3CClass<F extends HKT3, U, L> extends SequenceT3C<F, U, L> {
  final Apply3C<F, U, L> _apply;
  SequenceT3CClass(this._apply);

  @override
  HKT3<F, U, L, List> sequenceT3C<A, B, C, D, E>(HKT3<F, U, L, A> a, [HKT3<F, U, L, B> b, HKT3<F, U, L, C> c, HKT3<F, U, L, D> d, HKT3<F, U, L, E> e]) {
    final args = b != null ? (c != null ? (d != null ? (e != null ? [a, b, c, d, e] : [a, b, c, d]) : [a, b, c]) : [a, b]) : [a];
    final len = args.length;
    final f = curried((args) => args, len - 1, []);
    var r = _apply.map(args[0], f);
    for (var i = 1; i < len; i++) {
      r = _apply.ap(r, args[i]);
    }
    return r;
  }
}

SequenceT3C<F, U, L> sequenceT3C<F extends HKT3, U, L>(Apply3C<F, U, L> apply) {
  return SequenceT3CClass(apply);
}

class SequenceT2Class<F extends HKT2> extends SequenceT2<F> {
  final Apply2<F> _apply;
  SequenceT2Class(this._apply);

  @override
  HKT2<F, L, List> sequenceT2<L, A, B, C, D, E>(HKT2<F, L, A> a, [HKT2<F, L, B> b, HKT2<F, L, C> c, HKT2<F, L, D> d, HKT2<F, L, E> e]) {
    final args = b != null ? (c != null ? (d != null ? (e != null ? [a, b, c, d, e] : [a, b, c, d]) : [a, b, c]) : [a, b]) : [a];
    final len = args.length;
    final f = curried((args) => args, len - 1, []);
    var r = _apply.map(args[0], f);
    for (var i = 1; i < len; i++) {
      r = _apply.ap(r, args[i]);
    }
    return r;
  }
}

SequenceT2<F> sequenceT2<F extends HKT2, L>(Apply2<F> apply) {
  return SequenceT2Class(apply);
}

class SequenceT2CClass<F extends HKT3, L> extends SequenceT2C<F, L> {
  final Apply2C<F, L> _apply;
  SequenceT2CClass(this._apply);

  @override
  HKT2<F, L, List> sequenceT2C<A, B, C, D, E>(HKT2<F, L, A> a, [HKT2<F, L, B> b, HKT2<F, L, C> c, HKT2<F, L, C> d, HKT2<F, L, E> e]) {
    final args = b != null ? (c != null ? (d != null ? (e != null ? [a, b, c, d, e] : [a, b, c, d]) : [a, b, c]) : [a, b]) : [a];
    final len = args.length;
    final f = curried((args) => args, len - 1, []);
    var r = _apply.map(args[0], f);
    for (var i = 1; i < len; i++) {
      r = _apply.ap(r, args[i]);
    }
    return r;
  }
}

SequenceT2C<F, L> sequenceT2C<F extends HKT2, L>(Apply2C<F, L> apply) {
  return SequenceT2CClass(apply);
}

class SequenceT1Class<F extends HKT> extends SequenceT1<F> {
  final Apply1<F> _apply;
  SequenceT1Class(this._apply);

  @override
  HKT<F, List> sequenceT1<A, B, C, D, E>(HKT<F, A> a, [HKT<F, B> b, HKT<F, C> c, HKT<F, D> d, HKT<F, E> e]) {
    final args = b != null ? (c != null ? (d != null ? (e != null ? [a, b, c, d, e] : [a, b, c, d]) : [a, b, c]) : [a, b]) : [a];
    final len = args.length;
    final f = curried((args) => args, len - 1, []);
    var r = _apply.map(args[0], f);
    for (var i = 1; i < len; i++) {
      r = _apply.ap(r, args[i]);
    }
    return r;
  }
}

SequenceT1<F> sequenceT1<F extends HKT>(Apply1<F> apply) {
  return SequenceT1Class(apply);
}











