import 'package:flutter/material.dart';
import 'package:projects/view/home_page.dart';
import 'package:projects/view_model/to_do_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
      child: MaterialApp(
        title: 'MVVM To-Do App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeView(),
      ),
    );
  }
}