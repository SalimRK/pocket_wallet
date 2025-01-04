import 'package:flutter/material.dart';
import 'package:pocket_wallets/pages/addtransaction/AddTransactionWidget.dart'
    as AddTransaction;
import 'package:pocket_wallets/pages/home/homepagewidget.dart' as HomePage;
import 'package:pocket_wallets/style.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.system;

  VoidCallback get toggleTheme => _toggleTheme;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pocket Wallets',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      initialRoute: 'HomePage',
      routes: {
        'HomePage': (context) => HomePage.Homepagewidget(
              onToggleTheme: _toggleTheme,
            ),
        'AddTransaction': (context) => AddTransaction.AddTransactionWidget()
      },
    );
  }
}
