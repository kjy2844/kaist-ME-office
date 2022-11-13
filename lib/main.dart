import 'package:flutter/material.dart';
import 'package:me_office/modules/find_by_document/find_by_document.dart';
import 'package:me_office/modules/find_by_work/find_by_work.dart';
import 'package:me_office/modules/home/main.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KAIST ME OFFICE',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/find-by-work': (context) => const FindByWork(),
        '/find-by-document': (context) => const FindByDocument(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
      ),
    );
  }
}
