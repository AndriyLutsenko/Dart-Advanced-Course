import "dart:async";

Future futureMessage() async {
  print('2 БАБАХ мізки вибухнули');
  await Future.delayed(
      Duration(seconds: 3), () => print("9 >>>> Hello Future"));
  print('10>>>> ШМЯК запакувались назад :)');
}

void main() async {
  Future(() {
    print("3 Future 1");
  });
  print("1 Синхронне завдання");
  Future(() {
    print("4 Future Х");
  });
  futureMessage();
  await Future(() {
    print("5 Future Y");
  });
  await Future.delayed(Duration(seconds: 2), () => print("6-->> Future"));
  print("7-->> Синхронне завдання 1");
  print("8-->> Синхронне завдання 2");
}
