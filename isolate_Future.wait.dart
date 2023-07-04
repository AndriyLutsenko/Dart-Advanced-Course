import 'dart:async';
import 'dart:isolate';

void main() async {
  final maxIsolates = 10000;
  final isolates = <Isolate>[];
  final completers = List<Completer<void>>.generate(
    maxIsolates,
    (_) => Completer<void>(),
  );

  // Функція, яка буде виконуватися в ізоляті
  Future<void> myIsolateFunction(SendPort sendPort) async {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    await for (var message in receivePort) {
      final index = message as int;
      print('Isolate $index started');
      // Виконуємо асинхронну операцію
      await Future.delayed(Duration(seconds: 10));
      // print('Isolate $index completed');
      sendPort.send('Isolate $index completed');
    }
  }

  // Створюємо ізоляти та додаємо їх до списку
  for (var i = 0; i < maxIsolates; i++) {
    final receivePort = ReceivePort();
    final isolate =
        await Isolate.spawn(myIsolateFunction, receivePort.sendPort);
    isolates.add(isolate);

    receivePort.listen((message) {
      if (message is SendPort) {
        message.send(i); // Відправляємо індекс до ізолятів
      } else {
        print(message);
        receivePort
            .close(); // Закриваємо receivePort після отримання повідомлення
        completers[i].complete(); // Помічаємо завершення ізоляту
      }
    });
  }

  // Очікуємо завершення всіх ізолятів
  await Future.wait(completers.map((completer) => completer.future));

  for (var isolate in isolates) {
    isolate.kill();
  }

  print('All isolates completed');
}
