typedef Lazy<A> = A Function(dynamic);

A identity<A>(A a) {
  return a;
}

Lazy<A> constant<A>(A a) {
  return (dynamic) => a;
}

