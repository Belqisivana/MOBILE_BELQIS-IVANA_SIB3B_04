import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/profile_page.dart';
import 'pages/counter_page.dart';
import 'widgets/navigation_bar.dart';

void main() {
  runApp(const MyProfileCounterApp());
}


class MyProfileCounterApp extends StatefulWidget {
  const MyProfileCounterApp({super.key});

  @override
  void initState(){

  }
  State<MyProfileCounterApp> createState() => _MyProfileCounterAppState();
}

class _MyProfileCounterAppState extends State<MyProfileCounterApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ProfilePage(),
    CounterPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  bottomV
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile & Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: CustomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
