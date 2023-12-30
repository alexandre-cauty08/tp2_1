import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/providers/ProviderQuestions.dart';
import 'view/QuizzPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderQuestions(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          home:  const QuizzPage(title: 'TP1 HAI912I',),
        )
    );
  }
}