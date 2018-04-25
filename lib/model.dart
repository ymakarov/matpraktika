import 'dart:math';

Random _random = new Random.secure();

abstract class ProblemXY {
  int x;
  int y;
  String op;

  bool right(int answer);

  int answer();

}

class AddProblem extends ProblemXY {

  static Function createFn(int max) {
    return () =>
      new AddProblem()
        ..op = "+"
        ..x = _random.nextInt(max) + 1
        ..y = _random.nextInt(max) + 1;
  }

  @override
  bool right(int answer) {
    return answer == this.answer();
  }

  int answer() {
    return x + y;
  }

}

class MultiplyProblem extends ProblemXY {

  static Function createFn(int max) {
    return () =>
    new MultiplyProblem()
      ..op = "*"
      ..x = _random.nextInt(max - 1) + 2
      ..y = _random.nextInt(max - 1) + 2;
  }

  @override
  bool right(int answer) {
    return answer == this.answer();
  }

  int answer() {
    return x * y;
  }

}

class DivideProblem extends ProblemXY {

  static DivideProblem create () {
    int a = _random.nextInt(8) + 2;
    int b = _random.nextInt(8) + 2;
    return new DivideProblem()
      ..op = ":"
      ..x = a * b
      ..y = b;
  }

  @override
  bool right(int answer) {
    return answer == this.answer();
  }

  int answer() {
    return x ~/ y;
  }

}

class SquareProblem extends ProblemXY {

  static SquareProblem create () {
    int a = _random.nextInt(99) + 1;
    return new SquareProblem()
      ..op = "*"
      ..x = a
      ..y = a;
  }

  @override
  bool right(int answer) {
    return answer == this.answer();
  }

  @override
  int answer() {
    return x * y;
  }

}

class SubProblem extends ProblemXY {

  static SubProblem create () {
    int x = _random.nextInt(8) + 2;
    return new SubProblem()
      ..op = "-"
      ..x = x
      ..y = _random.nextInt(x - 1) + 1;
  }

  @override
  bool right(int answer) {
    return answer == this.answer();
  }

  @override
  int answer() {
    return x - y;
  }
}

class ProblemFactory {
  static List<List<Function>> _problemConstructors =
    [ [AddProblem.createFn(9), SubProblem.create],
      [MultiplyProblem.createFn(9), DivideProblem.create],
      [SquareProblem.create],
      [AddProblem.createFn(10000)],
      [MultiplyProblem.createFn(100)]];

  create (int level) {
    List<Function> constructors = _problemConstructors[level - 1];
    return constructors[_random.nextInt(constructors.length)]();
  }

}


class Result {
  int right = 0;
  int wrong = 0;
}