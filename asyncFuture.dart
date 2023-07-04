import "dart:async";

Future futureMessage() async {
  print('БАБАХ мізки вибухнули');
  await Future.delayed(Duration(seconds: 3), () => print(">>>Hello Future"));
  print('ШМЯК запакувались назад :)');
}

void main() async {
  Future(() {
    scheduleMicrotask(() => print("Microtask 1"));
    print("Future 1");
  }).then((_) {
    print("Future 2");
    scheduleMicrotask(() => print("Microtask 2"));
  });
  await Future(() {
    print("Future");
  });
  Future(() {
    print("Future Х");
  });
  print("Синхронне завдання");
  scheduleMicrotask(() => print("Microtask"));
  futureMessage();
  print("Синхронне завдання 1");
  print("Синхронне завдання 2");
}
