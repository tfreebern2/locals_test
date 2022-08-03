import 'package:flutter/material.dart';
import 'package:locals_test/screens/login.dart';
import 'package:locals_test/screens/post_list_view.dart';
import 'package:locals_test/theme/primary_theme.dart';

void main() async {
  runApp(const LocalsApp());
}

class LocalsApp extends StatelessWidget {
  const LocalsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Locals Test',
      theme: PrimaryTheme.primary,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/login': (context) => const Login(),
        '/posts': (context) => const PostListView()
      },
    );
  }
}
