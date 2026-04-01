import 'dart:io';

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void printUsage() {
  print(
    "Доступные команды: 'help', 'version', 'search <НАЗВАНИЕ-СТАТЬИ>'"
  );
}

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print('Пожалуйста, введите название статьи.');
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Ищем статьи о "$articleTitle". Пожалуйста, подождите.');
  print('Вот что нашлось:');
  print('(Здесь будет настоящая статья о "$articleTitle")');
}