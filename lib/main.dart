import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_demo/home.dart';
import 'package:scheduler_demo/store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Store>(
  create: (context) => Store(),
    child: Builder(
      builder: (context) {
        return MaterialApp(
          title: 'Scheduler Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Home_Page(title: 'Scheduler Demo'),
        );
      }
    ),
);
  }
}
