import 'dart:io';

import 'package:assignment1/commands.dart';


/// Allow us to lazy iterate over lines entered in console
Iterable<String> readLines() sync* {
  while (true) yield stdin.readLineSync()!;
}

/// Transform current state to next by executing the first command that accepts given input
State transform(State state, String input) => commands
    .map((commandFactory) => commandFactory(input))
    .firstWhere((command) => command.accept(state.registry))
    .execute(state);

void main() {
  // For each line read - apply transform function to get new state for the next iteration.
  readLines().fold(
    State.empty(), // initial state
    transform, // transform state based on input
  );
}
