# Improper Exception Handling in Asynchronous Dart Code

This repository demonstrates a common error in Dart: inadequate exception handling within asynchronous operations. The initial `bug.dart` file showcases the problematic code.  The improved version, `bugSolution.dart`, provides a more robust approach.

## Problem

The `fetchData` function attempts to fetch data from an API.  The `try-catch` block handles exceptions, but its error handling is insufficient.  Simply printing the error message isn't helpful for debugging or providing informative feedback to the user.

## Solution

The solution improves error handling by:

1.  Providing more specific error handling based on the type of exception.
2.  Re-throwing exceptions with more context to aid debugging.
3.  Implementing better error reporting mechanisms (e.g., logging).