import 'package:app_polirubro/providers/auth_provider.dart';
import 'package:app_polirubro/providers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ScaffoldWithNavbar extends StatefulWidget {
  final Widget child;
  
  const ScaffoldWithNavbar({super.key, required this.child});

  @override
  State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> {
  int _selectedIndex = 0;
  String _title = 'Home';
  String currentScreen = '';

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          _title = 'Home';
          currentScreen = '/home';
          break;
        case 1:
          _title = 'Productos';
          currentScreen = '/products';
          break;
        case 2:
          _title = 'Categorias';
          currentScreen = '/categories';
          break;
      }
    });
    context.go(currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final DarkThemeProvider darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            await authProvider.logout();
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                darkThemeProvider.darkTheme = !darkThemeProvider.darkTheme;
              },
              icon: const Icon(
                Icons.light_mode,
                color: Colors.white,
              ))
        ],
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            label: 'Productos'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias'
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }
}
