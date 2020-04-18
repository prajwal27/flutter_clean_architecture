import 'package:architecture/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:architecture/injection_container.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600
      ),
      home: NumberTriviaPage()
    );
  }
}