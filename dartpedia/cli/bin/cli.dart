import 'dart:io';
import 'package:http/http.dart' as http;

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'wikipedia') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void printUsage() {
  print(
    "Доступные команды: 'help', 'version', 'wikipedia <НАЗВАНИЕ-СТАТЬИ>'"
  );
}

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print('Пожалуйста, введите название статьи.');
    final inputFromStdin = stdin.readLineSync();
    if (inputFromStdin == null || inputFromStdin.isEmpty) {
      print('Название статьи не введено. Выход.');
      return;
    }
    articleTitle = inputFromStdin;
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Ищем статью о "$articleTitle". Пожалуйста, подождите.');
  final articleContent = await getWikipediaArticle(articleTitle);
  print(articleContent);
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$articleTitle',
  );
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body; // JSON строка
  }
  return 'Ошибка: не удалось загрузить статью "$articleTitle". Код статуса: ${response.statusCode}';
}