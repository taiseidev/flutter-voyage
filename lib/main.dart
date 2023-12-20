import 'package:flutter/material.dart';
import 'package:flutter_voyage/features/sample/home_page.dart';

void main() async {
  // await Supabase.initialize(
  //   url: 'https://syjlcxhgkzcspdxbwitx.supabase.co',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN5amxjeGhna3pjc3BkeGJ3aXR4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU4MjE4NTEsImV4cCI6MjAxMTM5Nzg1MX0.cUB5k-PwkqNTgwjF9x-KNVV3b7G_5Gx11T8LUkMmZvU',
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
        home: HomePage());
  }
}
