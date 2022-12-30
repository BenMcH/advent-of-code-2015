import 'dart:io';

int floor(String input) {
  int floor = 0;

  input.split("").forEach((String element) {
    if (element == ')') {
      floor -= 1;
    } else if (element == '(') {
      floor += 1;
    }
  });

  return floor;
}

int findBasement(String input) {
  var chars = input.split("");

  int level = 0;

  for (int i = 0; i < chars.length; i++) {
    var element = chars[i];

    if (element == ')') {
      level -= 1;
    } else if (element == '(') {
      level += 1;
    }

    if (level < 0) {
      return i + 1;
    }
  }

  throw Exception("Never enters basement");
}

void main() {
  String testInput = File("test-input").readAsStringSync();
  String realInput = File("input").readAsStringSync();

  if (floor(testInput) != 3) {
    throw Exception('Expected 3, got ${floor(testInput)}');
  }

  print(floor(realInput));

  if (findBasement(testInput) != 1) {
    throw Exception('Expected 3, got ${findBasement(testInput)}');
  }

  print(findBasement(realInput));
}
