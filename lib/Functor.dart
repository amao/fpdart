import 'package:fpdart/Hkt.dart';
import 'package:fpdart/function.dart';

abstract class Functor1<F extends HKT> {
  HKT<F, B> map<A, B>(HKT<F, A> fa, B f(A a));
}

abstract class Functor2<F extends HKT2> {
  HKT2<F, L, B> map<L, A, B>(HKT2<F, L, A> fa, B f(A a));
}

abstract class Functor3<F extends HKT3> {
  HKT3<F, U, L, B> map<U, L, A, B>(HKT3<F, U, L, A> fa, B f(A a));
}

abstract class Functor4<F extends HKT4> {
  HKT4<F, X, U, L, B> map<X, U, L, A, B>(HKT4<F, X, U, L, A> fa, B f(A a));
}

abstract class Functor2C<F extends HKT2, L> {
  HKT2<F, L, B> map<A, B>(HKT2<F, L, A> fa, B f(A a));
}

abstract class Functor3C<F extends HKT3, U, L> {
  HKT3<F, U, L, B> map<A, B>(HKT3<F, U, L, A> fa, B f(A a));
}

abstract class FunctorComposition11<F extends HKT, G extends HKT> {
  HKT<F, HKT<G, B>> map<A, B>(HKT<F, HKT<G, A>> fa, B f(A a));
}

abstract class FunctorComposition12<F extends HKT, G extends HKT2> {
  HKT<F, HKT2<G, LG, B>> map<LG, A, B>(HKT<F, HKT2<G, LG, A>> fa, B f(A a));
}

abstract class FunctorComposition12C<F extends HKT, G extends HKT2, LG> {
  HKT<F, HKT2<G, LG, B>> map<A, B>(HKT<F, HKT2<G, LG, A>> fa, B f(A a));
}

abstract class FunctorComposition21<F extends HKT2, G extends HKT> {
  HKT2<F, LF, HKT<G, B>> map<LF, A, B>(HKT2<F, LF, HKT<G, A>> fa, B f(A a));
}

abstract class FunctorComposition2C1<F extends HKT2, G extends HKT, LF> {
  HKT2<F, LF, HKT<G, B>> map<A, B>(HKT2<F, LF, HKT<G, A>> fa, B f(A a));
}

abstract class FunctorComposition22<F extends HKT2, G extends HKT2> {
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B f(A a));
}

abstract class FunctorComposition22C<F extends HKT2, G extends HKT2, LG> {
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B f(A a));
}

abstract class FunctorComposition3C1<F extends HKT3, G extends HKT, UF, LF> {
  HKT3<F, UF, LF, HKT<G, B>> map<A, B>(HKT3<F, UF, LF, HKT<G, A>> fa, B f(A a));
}

HKT3<F, U, L, B> Function(HKT3<F, U, L, A>) Function(B Function(A)) lift3<F extends HKT3, U, L, A, B>(Functor3<F> functor) {
  return (B Function(A) f) => (HKT3<F, U, L, A> fa) => functor.map(fa, f);
}

HKT3<F, U, L, B> Function(HKT3<F, U, L, A>) Function(B Function(A)) lift3C<F extends HKT3, U, L, A, B>(Functor3C<F, U, L> functor) {
  return (B Function(A) f) => (HKT3<F, U, L, A> fa) => functor.map(fa, f);
}

HKT2<F, L, B> Function(HKT2<F, L, A>) Function(B Function(A)) lift2<F extends HKT2, L, A, B>(Functor2<F> functor) {
  return (B Function(A) f) => (HKT2<F, L, A> fa) => functor.map(fa, f);
}

HKT2<F, L, B> Function(HKT2<F, L, A>) Function(B Function(A)) lift2C<F extends HKT2, L, A, B>(Functor2C<F, L> functor) {
  return (B Function(A) f) => (HKT2<F, L, A> fa) => functor.map(fa, f);
}

HKT<F, B> Function(HKT<F, A>) Function(B Function(A)) lift<F extends HKT, A, B>(Functor1<F> functor) {
  return (B Function(A) f) => (HKT<F, A> fa) => functor.map(fa, f);
}

//voidRight

HKT3<F, U, L, A> Function(A, HKT3<F, U, L, B>) voidRight3<F extends HKT3, U, L, A, B>(Functor3<F> functor) {
  return (A a, HKT3<F, U, L, B> fb) => functor.map(fb, constant(a));
}

HKT3<F, U, L, A> Function(A, HKT3<F, U, L, B>) voidRight3C<F extends HKT3, U, L, A, B>(Functor3C<F, U, L> functor) {
  return (A a, HKT3<F, U, L, B> fb) => functor.map(fb, constant(a));
}

HKT2<F, L, A> Function(A, HKT2<F, L, B>) voidRight2<F extends HKT2, L, A, B>(Functor2<F> functor) {
  return (A a, HKT2<F, L, B> fb) => functor.map(fb, constant(a));
}

HKT2<F, L, A> Function(A, HKT2<F, L, B>) voidRight2C<F extends HKT3, L, A, B>(Functor2C<F, L> functor) {
  return (A a, HKT2<F, L, B> fb) => functor.map(fb, constant(a));
}

HKT<F, A> Function(A, HKT<F, B>) voidRight<F extends HKT, A, B>(Functor1<F> functor) {
  return (A a, HKT<F, B> fb) => functor.map(fb, constant(a));
}

//voidLeft

HKT3<F, U, L, B> Function(HKT3<F, U, L, A>, B) voidLeft3<F extends HKT3, U, L, A, B>(Functor3<F> functor) {
  return (HKT3<F, U, L, A> fa, B b) => functor.map(fa, constant(b));
}

HKT3<F, U, L, B> Function(HKT3<F, U, L, A>, B) voidLeft3C<F extends HKT3, U, L, A, B>(Functor3C<F, U, L> functor) {
  return (HKT3<F, U, L, A> fa, B b) => functor.map(fa, constant(b));
}

HKT2<F, L, B> Function(HKT2<F, L, A>, B) voidLeft2<F extends HKT2, L, A, B>(Functor2<F> functor) {
  return (HKT2<F, L, A> fa, B b) => functor.map(fa, constant(b));
}

HKT2<F, L, B> Function(HKT2<F, L, A>, B) voidLeft2C<F extends HKT3, L, A, B>(Functor2C<F, L> functor) {
  return (HKT2<F, L, A> fa, B b) => functor.map(fa, constant(b));
}

HKT<F, B> Function(HKT<F, A>, B) voidLeft<F extends HKT, A, B>(Functor1<F> functor) {
  return (HKT<F, A> fa, B b) => functor.map(fa, constant(b));
}

//flap

HKT3<F, U, L, B> Function(A, HKT3<F, U, L, B Function(A)>) flap3<F extends HKT3, U, L, A, B>(Functor3<F> functor) {
  return (A a, HKT3<F, U, L, B Function(A)> ff) => functor.map(ff, (B Function(A) f) => f(a));
}

HKT3<F, U, L, B> Function(A, HKT3<F, U, L, B Function(A)>) flap3C<F extends HKT3, U, L, A, B>(Functor3C<F, U, L> functor) {
  return (A a, HKT3<F, U, L, B Function(A)> ff) => functor.map(ff, (B Function(A) f) => f(a));
}

HKT2<F, L, B> Function(A, HKT2<F, L, B Function(A)>) flap2<F extends HKT2, L, A, B>(Functor2<F> functor) {
  return (A a, HKT2<F, L, B Function(A)> ff) => functor.map(ff, (B Function(A) f) => f(a));
}

HKT2<F, L, B> Function(A, HKT2<F, L, B Function(A)>) flap2C<F extends HKT3, L, A, B>(Functor2C<F, L> functor) {
  return (A a, HKT2<F, L, B Function(A)> ff) => functor.map(ff, (B Function(A) f) => f(a));
}

HKT<F, B> Function(A, HKT<F, B Function(A)>) flap<F extends HKT, A, B>(Functor1<F> functor) {
  return (A a, HKT<F, B Function(A)> ff) => functor.map(ff, (B Function(A) f) => f(a));
}

//getFunctorComposition

class Fc3C1<F extends HKT3, G extends HKT, UF, LF> with FunctorComposition3C1<F, G, UF, LF> {
  final Functor3C<F, UF, LF> _functorF;
  final Functor1<G> _functorG;
  Fc3C1(this._functorF, this._functorG);

  @override
  HKT3<F, UF, LF, HKT<G, B>> map<A, B>(HKT3<F, UF, LF, HKT<G, A>> fa, B Function(A a) f) {
    return this._functorF.map(fa, (HKT<G, A> ga) => this._functorG.map(ga, f));
  }
}

FunctorComposition3C1<F, G, UF, LF> getFunctorComposition3C1<F extends HKT3, G extends HKT, UF, LF>(Functor3C<F, UF, LF> functorF, Functor1<G> functorG) {
  final result = Fc3C1(functorF, functorG);
  return result;
}

class Fc22C<F extends HKT2, G extends HKT2, LG> with FunctorComposition22C<F, G, LG> {
  final Functor2<F> _functorF;
  final Functor2C<G, LG> _functorG;
  Fc22C(this._functorF, this._functorG);

  @override
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return this._functorF.map(fa, (HKT2<G, LG, A> ga) => this._functorG.map(ga, f));
  }
}

FunctorComposition22C<F, G, LG> getFunctorComposition22C<F extends HKT2, G extends HKT2, LG>(Functor2<F> functorF, Functor2C<G, LG> functorG) {
  final result = Fc22C(functorF, functorG);
  return result;
}

class Fc22<F extends HKT2, G extends HKT2> with FunctorComposition22<F, G> {
  final Functor2<F> _functorF;
  final Functor2<G> _functorG;
  Fc22(this._functorF, this._functorG);

  @override
  HKT2<F, LF, HKT2<G, LG, B>> map<LF, LG, A, B>(HKT2<F, LF, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return this._functorF.map(fa, (HKT2<G, LG, A> ga) => this._functorG.map(ga, f));
  }
}

FunctorComposition22<F, G> getFunctorComposition22<F extends HKT2, G extends HKT2>(Functor2<F> functorF, Functor2<G> functorG) {
  final result = Fc22(functorF, functorG);
  return result;
}

class Fc2C1<F extends HKT2, G extends HKT, LF> with FunctorComposition2C1<F, G, LF> {
  final Functor2C<F, LF> _functorF;
  final Functor1<G> _functorG;
  Fc2C1(this._functorF, this._functorG);

  @override
  HKT2<F, LF, HKT<G, B>> map<A, B>(HKT2<F, LF, HKT<G, A>> fa, B Function(A a) f) {
    return this._functorF.map(fa, (HKT<G, A> ga) => this._functorG.map(ga, f));
  }
}

FunctorComposition2C1<F, G, LF> getFunctorComposition2C1<F extends HKT2, G extends HKT, LF>(Functor2C<F, LF> functorF, Functor1<G> functorG) {
  final result = Fc2C1(functorF, functorG);
  return result;
}

class Fc21<F extends HKT2, G extends HKT> with FunctorComposition21<F, G> {
  final Functor2<F> _functorF;
  final Functor1<G> _functorG;
  Fc21(this._functorF, this._functorG);

  @override
  HKT2<F, LF, HKT<G, B>> map<LF, A, B>(HKT2<F, LF, HKT<G, A>> fa, B Function(A a) f) {
    return this._functorF.map(fa, (HKT<G, A> ga) => this._functorG.map(ga, f));
  }
}

FunctorComposition21<F, G> getFunctorComposition21<F extends HKT2, G extends HKT>(Functor2<F> functorF, Functor1<G> functorG) {
  final result = Fc21(functorF, functorG);
  return result;
}

class Fc12C<F extends HKT, G extends HKT2, LG> with FunctorComposition12C<F, G, LG> {
  final Functor1<F> _functorF;
  final Functor2C<G, LG> _functorG;
  Fc12C(this._functorF, this._functorG);

  @override
  HKT<F, HKT2<G, LG, B>> map<A, B>(HKT<F, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return this._functorF.map(fa, (HKT2<G, LG, A> ga) => this._functorG.map(ga, f));
  }
}

FunctorComposition12C<F, G, LG> getFunctorComposition12C<F extends HKT, G extends HKT2, LG>(Functor1<F> functorF, Functor2C<G, LG> functorG) {
  final result = Fc12C(functorF, functorG);
  return result;
}

class Fc12<F extends HKT, G extends HKT2> with FunctorComposition12<F, G> {
  final Functor1<F> _functorF;
  final Functor2<G> _functorG;
  Fc12(this._functorF, this._functorG);

  @override
  HKT<F, HKT2<G, LG, B>> map<LG, A, B>(HKT<F, HKT2<G, LG, A>> fa, B Function(A a) f) {
    return this._functorF.map(fa, (HKT2<G, LG, A> ga) => this._functorG.map(ga, f));
  }
}

FunctorComposition12<F, G> getFunctorComposition12<F extends HKT, G extends HKT2>(Functor1<F> functorF, Functor2<G> functorG) {
  final result = Fc12(functorF, functorG);
  return result;
}

class Fc11<F extends HKT, G extends HKT> with FunctorComposition11<F, G> {
  final Functor1<F> _functorF;
  final Functor1<G> _functorG;

  Fc11(this._functorF, this._functorG);

  @override
  HKT<F, HKT<G, B>> map<A, B>(HKT<F, HKT<G, A>> fa, B Function(A a) f) {
    return this._functorF.map(fa, (HKT<G, A> ga) => this._functorG.map(ga, f));
  }
}

FunctorComposition11<F, G> getFunctorComposition<F extends HKT, G extends HKT>(Functor1<F> functorF, Functor1<G> functorG) {
  final result = Fc11(functorF, functorG);
  return result;
}




