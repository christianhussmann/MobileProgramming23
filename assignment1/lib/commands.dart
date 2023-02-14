import 'dart:io';

/// "stack" for numbers entered and result of operations
typedef Registry = List<num>;

/// Function to undo a command
typedef UndoFunction = Registry Function(Registry);

/// Application state is a stack of numbers (registry) and stack of undo functions (history)
class State {
  final Registry registry;
  final List<UndoFunction> history;
  const State({required this.registry, required this.history});
  State.empty() : this(registry: [], history: []);
  copy({required Registry registry, required UndoFunction undo}) =>
      State(registry: registry, history: [...history, undo]);
}

/// "interface" for all commands
abstract class Command {
  final String input;
  const Command(String this.input);

  /// Whether the input is valid for the command on given registry
  bool accept(List<num> registry);

  /// Executing the command returns the next application state
  State execute(State state);
}

/// Insert/push a number to the registry
class Enter extends Command {
  final num? number;
  Enter(input)
      : this.number = num.tryParse(input),
        super(input);
  accept(registry) => number != null;
  execute(state) => state.copy(
        registry: [...state.registry, number!],
        undo: (registry) => [...registry.take(registry.length - 1)],
      );
}

/// Clear the registry
class Clear extends Command {
  Clear(super.input);
  accept(registry) => ['clear', 'c'].contains(input);
  execute(state) => state.copy(registry: [], undo: (_) => state.registry);
}

/// Print registry
class Print extends Command {
  Print(super.input);
  accept(registry) => ['print', 'p', ''].contains(input);
  execute(state) {
    print(state.registry);
    return state;
  }
}

/// Exit process
class Exit extends Command {
  Exit(super.input);
  accept(registry) => ['exit', 'quit', 'q'].contains(input);
  execute(state) => exit(1);
}

/// Undo previously executed command using the undo function in history stack
class Undo extends Command {
  Undo(super.input);
  accept(registry) => ['undo', 'u'].contains(input);
  execute(state) => State(
        registry: state.history.last(state.registry),
        history: [...state.history.take(state.history.length - 1)],
      );
}

/// Base class for arithmetic operation consuming two operants from registry
abstract class Operator extends Command {
  Operator(super.input);
  String get name;
  apply(num val1, num val2);
  accept(registry) => registry.length > 1 && input == name;
  execute(state) {
    final arg1 = state.registry.elementAt(state.registry.length - 2);
    final arg2 = state.registry.last;
    final result = apply(arg1, arg2);
    print(result);
    return state.copy(
      registry: [...state.registry.take(state.registry.length - 2), result],
      undo: (registry) => [...registry.take(registry.length - 1), arg1, arg2],
    );
  }
}

/// Addition
class Add extends Operator {
  Add(super.input);
  get name => '+';
  apply(val1, val2) => val1 + val2;
}

/// Subtraction
class Subtract extends Operator {
  Subtract(super.input);
  get name => '-';
  apply(val1, val2) => val1 - val2;
}

/// Multiplication
class Multiply extends Operator {
  Multiply(super.input);
  get name => '*';
  apply(val1, val2) => val1 * val2;
}

/// Division
class Divide extends Operator {
  Divide(super.input);
  get name => '/';
  apply(val1, val2) => val1 / val2;
}

/// Fallback command for when no other accepts the input
class Invalid extends Command {
  Invalid(super.input);
  accept(List<num> registry) => true;
  execute(State state) {
    print('Invalid command "$input"');
    return state;
  }
}
