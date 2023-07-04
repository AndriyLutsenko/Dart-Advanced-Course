import 'dart:io';

void main() {
  print('Привіт! Як тебе звати?');
  var name = stdin.readLineSync();

  print('Приємно познайомитись, $name! Як я можу тобі допомогти?');

  while (true) {
    var input = stdin.readLineSync()!;

    if (input.toLowerCase() == 'пока') {
      print('До побачення, $name!');
      break;
    } else {
      var response = getResponse(input);
      print(response);
    }
  }
}

String getResponse(String input) {
  var lowercaseInput = input.toLowerCase();

  if (lowercaseInput.contains('привіт')) {
    return 'Привіт! Як я можу тобі допомогти?';
  } else if (lowercaseInput.contains('як справи')) {
    return 'У мене все добре, дякую! А у тебе?';
  } else if (lowercaseInput.contains('дякую')) {
    return 'Не за що! З радістю допоможу ще раз.';
  } else {
    return 'На жаль, не розумію твого запиту. Можеш пояснити детальніше?';
  }
}
