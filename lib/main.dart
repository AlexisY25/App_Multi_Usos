import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/pages/wordpress.dart';
import 'package:flutter_application_2/src/pages/clima.dart';
import 'package:flutter_application_2/src/pages/datos.dart';
import 'package:flutter_application_2/src/pages/edad.dart';
import 'package:flutter_application_2/src/pages/genero.dart';
import 'package:flutter_application_2/src/pages/home.dart';
import 'package:flutter_application_2/src/pages/universidad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.amber),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Define las rutas para cada página
  final List<Widget> _pages = [
    const HomePage(),
    const Genero(),
    const Edad(),
    const Universidad(),
    const ClimaPage(),
    const Wordpress(),
    const Datos(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Género',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Edad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Universidad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Clima',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Wordpress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
