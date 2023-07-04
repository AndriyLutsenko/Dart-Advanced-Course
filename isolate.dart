import 'dart:async';
import 'dart:isolate';

void main() async {
  final maxIsolates = 10;
  final isolates = <Isolate>[];

  // Функція, яка буде виконуватися в ізоляті
  Future<void> myIsolateFunction(SendPort sendPort) async {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    await for (var message in receivePort) {
      final index = message as int;
      print('Isolate $index started');
      // Виконуємо асинхронну операцію
      await Future.delayed(Duration(seconds: 10)).then((_) {
        print('Isolate $index completed');
      });
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
      }
    });
  }

  // Очікуємо завершення всіх ізолятів
  await Future.delayed(Duration(seconds: 15));

  for (var isolate in isolates) {
    isolate.kill();
  }

  print('All isolates completed');
}
