import 'package:app_noti/screens/taps_screen.dart';
import 'package:app_noti/services/news_services.dart';
import 'package:app_noti/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavegacionModel()),
        ChangeNotifierProvider(create: (context) => NewService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Newsify app',
        home: const TapsScreen(),
      ),
    );
  }
}
