import 'dart:io';

import 'commands.dart';
import 'stack.dart';

final commands = [
  Enter(),
  Print(),
  Exit(),
  Clear(),
  Add(),
  Subtract(),
  Multiply(),
  Noop()
];

void main() {
  final stack = Stack<num>();
  String? input;
  while (true) {
    print('Type a command:');
    input = stdin.readLineSync();
    if (input == null) continue;
    commands
        .firstWhere((command) => command.accept(stack, input!))
        .execute(stack, input);
  }
}
