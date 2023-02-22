# Assignment 1 - RPN Calculator

![](https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/HP-35_Red_Dot.jpg/800px-HP-35_Red_Dot.jpg)

*HP-35, the first pocket calculator from 1972*

## Description 

Implement a simple command line calculator based on Reverse Polish Notation
(RPN).

RPN is also known as postfix notation.

We are used to what is called infix notation where the operator is between the
operands.

With postfix notation the operator follows the operands.

RPN has the advantage of not using parentheses.

[Read more](https://en.wikipedia.org/wiki/Reverse_Polish_notation)

## Implementation

Values entered are stored in a stack.
Base your stack on the [List class](https://api.dart.dev/stable/2.19.0/dart-core/List-class.html).

An operation (+, -, *, / etc) replaces values in the stack with the result.
You can support more operations if you want.

In additional you will need a operation to push a value to the stack.


Operations MUST be implemented using the [Command
pattern](https://www.geeksforgeeks.org/command-pattern/) or variation thereof.

Remember: We use an abstract class in Dart instead of interface as you are used
to from other programming languages.

## Optional

Implement undo functionality by adding an `undo` method to command class and
keep a stack (command history) of executed commands.

## Hand in

Submit a ZIP archive with your source code.