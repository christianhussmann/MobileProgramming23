import 'package:assignment1/commands.dart';
import 'package:test/test.dart';

void main() {
  group('Enter', () {
    test('.accept() returns true when input can be parsed as an number', () {
      expect(Enter('1').accept([]), true);
      expect(Enter('1.5').accept([]), true);
      expect(Enter('.5').accept([]), true);
    });

    test('.accept() otherwise false', () {
      expect(Enter('').accept([]), false);
      expect(Enter('foobar').accept([]), false);
      expect(Enter('1.five').accept([]), false);
    });

    test('.execute() returns state with number added to registry', () {
      final initState = State(registry: [1, 2], history: []);
      final newState = Enter('3').execute(initState);
      expect(newState.registry, [1, 2, 3]);
    });

    test('.execute() returns state with undo function in history', () {
      final initState = State(registry: [1], history: []);
      final newState = Enter('2').execute(initState);
      expect(newState.history.single(newState.registry), initState.registry);
    });
  });

  group('Clear', () {
    test('.execute() returns state with empty registry', () {
      final initState = State(registry: [1, 2], history: []);
      final newState = Clear('c').execute(initState);
      expect(newState.registry, []);
    });

    test('.execute() returns state with function in history', () {
      final initState = State(registry: [1, 2], history: []);
      final newState = Clear('c').execute(initState);
      expect(newState.history.single(newState.registry), initState.registry);
    });
  });

  group('Print', () {
    test('.execute() returns state untouched', () {
      final initState = State(registry: [1, 2], history: []);
      final newState = Print('').execute(initState);
      expect(newState, initState);
    });
  });

  group('Undo', () {
    test('.execute() returns state with last undo function applied', () {
      final initState = State(
        registry: [1, 2],
        history: [
          (reg) => [2, 3],
          (reg) => [3, 5]
        ],
      );
      final newState = Undo('u').execute(initState);
      expect(newState.registry, [3, 5]);
    });
  });

  group('Operator', () {
    test(
        '.accept() returns true if name match and there are at least two elements in registry',
        () {
      expect(Add('+').accept([1, 2]), true);
      expect(Subtract('-').accept([1, 2, 3]), true);
      expect(Multiply('*').accept([1, 2, 3, 4]), true);
      expect(Divide('/').accept([1, 2, 3, 4, 5]), true);
    });

    test('.accept() returns false when there are less than two elements', () {
      expect(Multiply('*').accept([1]), false);
      expect(Divide('/').accept([]), false);
    });

    test('.accept() returns false when name does not match', () {
      expect(Add('foobar').accept([1, 2]), false);
      expect(Subtract('foobar').accept([1, 2]), false);
      expect(Multiply('foobar').accept([1, 2]), false);
      expect(Divide('foobar').accept([1, 2]), false);
    });

    test('Add', () {});
  });
}
