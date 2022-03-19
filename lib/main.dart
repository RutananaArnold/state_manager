import 'package:flutter/material.dart';
import 'package:state_manager/dashboard.dart';
import 'package:state_manager/index.dart';
import 'package:state_manager/model/ui.dart';
import 'package:state_manager/reports.dart';
import 'package:state_manager/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UI(),
        )
      ],
      child: MaterialApp(
        title: 'State Manager',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/index",
        routes: {
          '/index': (context) => const Index(),
          '/dashboard': (context) => Dashboard(),
          '/reports': (context) => Reports(),
          '/settings': (context) => Settings(),
        },
      ),
    );
  }
}
