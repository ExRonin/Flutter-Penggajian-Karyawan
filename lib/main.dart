import 'package:flutter/material.dart';
import 'package:penggajian/screens/DetailGajiScreen.dart';
import 'package:penggajian/screens/ListGajiScreen.dart';
import 'screens/LoginScreen.dart';
import 'screens/HomeScreen.dart';

void main() => runApp(MyApp());

var data;

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Aplikasi Gaji Karyawan",
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/' : (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ListGajiScreen.routeName: (context) => ListGajiScreen(),
        DetailGajiScreen.routeName: (context) => DetailGajiScreen(),
      },
    );
  }
}