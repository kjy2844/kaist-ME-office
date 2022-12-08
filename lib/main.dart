import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

import 'package:me_office/modules/find_by_document/find_by_document.dart';
import 'package:me_office/modules/find_by_document/find_by_document_detail.dart';
import 'package:me_office/modules/find_by_work/find_by_work.dart';
import 'package:me_office/modules/home/main.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/find-by-document-detail': (context) => const FindByDocumentDetail(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
