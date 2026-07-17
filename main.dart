import 'package:flutter/material.dart';

void main() => runApp(FutureXApp());

class FutureXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF0B0E14),
        primaryColor: Color(0xFF00E5FF),
      ),
      home: MainDashboard(),
    );
  }
}

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("የትምህርት መደቦች ይዘረዘራሉ", style: TextStyle(color: Colors.white))),
    Center(child: Text("ቻት ክፍል", style: TextStyle(color: Colors.white))),
    Center(child: Text("የውድድር ሰሌዳ", style: TextStyle(color: Colors.white))),
    Center(child: Text("AI መካሪ", style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FUTURE X-EDU", style: TextStyle(color: Color(0xFF00E5FF), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF1C1F26),
        selectedItemColor: Color(0xFF00E5FF),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "ትምህርት"),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "ቻት"),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: "ውድድር"),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: "AI"),
        ],
      ),
    );
  }
}
