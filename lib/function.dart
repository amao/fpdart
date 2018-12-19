typedef Lazy<A> = A Function(dynamic);

A identity<A>(A a) {
  return a;
}

Lazy<A> constant<A>(A a) {
  return (dynamic) => a;
}

typedef Function1<A, B> = B Function(A);
typedef Function2<A, B, C> = C Function(A, B);
typedef Function3<A, B, C, D> = D Function(A, B, C);
typedef Function4<A, B, C, D, E> = E Function(A, B, C, D);
typedef Function5<A, B, C, D, E, F> = F Function(A, B, C, D, E);
typedef Function6<A, B, C, D, E, F, G> = G Function(A, B, C, D, E, F);
typedef Function7<A, B, C, D, E, F, G, H> = H Function(A, B, C, D, E, F, G);
typedef Function8<A, B, C, D, E, F, G, H, I> = I Function(A, B, C, D, E, F, G, H);
typedef Function9<A, B, C, D, E, F, G, H, I, J> = J Function(A, B, C, D, E, F, G, H, I);

typedef Curried2<A, B, C> = C Function(B) Function(A);
typedef Curried3<A, B, C, D> = D Function(C) Function(B) Function(A);
typedef Curried4<A, B, C, D, E> = E Function(D) Function(C) Function(B) Function(A);
typedef Curried5<A, B, C, D, E, F> = F Function(E) Function(D) Function(C) Function(B) Function(A);
typedef Curried6<A, B, C, D, E, F, G> = G Function(F) Function(E) Function(D) Function(C) Function(B) Function(A);
typedef Curried7<A, B, C, D, E, F, G, H> = H Function(G) Function(F) Function(E) Function(D) Function(C) Function(B) Function(A);
typedef Curried8<A, B, C, D, E, F, G, H, I> = I Function(H) Function(G) Function(F) Function(E) Function(D) Function(C) Function(B) Function(A);
typedef Curried9<A, B, C, D, E, F, G, H, I, J> = J Function(I) Function(H) Function(G) Function(F) Function(E) Function(D) Function(C) Function(B) Function(A);