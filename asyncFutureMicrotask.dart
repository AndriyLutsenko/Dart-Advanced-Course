import "dart:async";

void main() async {
  Future(() {
    scheduleMicrotask(() => print("Microtask 1"));
    print("Future 1");
  }).then((_) {
    print("Future 2");
    scheduleMicrotask(() => print("Microtask 2"));
  });
  Future(() {
    print("Future");
  });
  print("Синхронне завдання");
  scheduleMicrotask(() => print("Microtask"));
  print("Синхронне завдання 1");
  print("Синхронне завдання 2");
}
