import 'package:fpdart/Ord.dart';
import 'package:fpdart/Ordering.dart';

abstract class Bounded<A> extends Ord<A> {
  // I have no idea about meanings of `top` and `bottom`.
//  get top => A;
//  get bottom => A;
}

class BoundedNumber extends Bounded<num> {
  final ordNum = ordNumber();

  @override
  Ordering compare(num x, num y) {
    return ordNum.compare(x, y);
  }

  @override
  bool equals(num x, num y) {
    return ordNum.equals(x, y);
  }
}