import 'package:flutter/material.dart';

void main() {
  runApp(const EthioEducationApp());
}

class EthioEducationApp extends StatelessWidget {
  const EthioEducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.menu_book_rounded, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                "የ9-12 ማጠቃለያ App",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                "አጫጭር ኖቶች እና የኤንትራንስ ፈተናዎች",
                style: TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GradeSelectionScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text("ትምህርት ጀምር", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradeSelectionScreen extends StatelessWidget {
  const GradeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ክፍልዎን ይምረጡ"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildGradeButton(context, "9ኛ ክፍል", Icons.looks_one),
            const SizedBox(height: 15),
            _buildGradeButton(context, "10ኛ ክፍል", Icons.looks_two),
            const SizedBox(height: 15),
            _buildGradeButton(context, "11ኛ ክፍል", Icons.looks_3),
            const SizedBox(height: 15),
            _buildGradeButton(context, "12ኛ ክፍል", Icons.looks_4),
          ],
        ),
      ),
    );
  }

  Widget _buildGradeButton(BuildContext context, String gradeTitle, IconData iconData) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContentMenuScreen(gradeTitle: gradeTitle)),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueAccent,
        side: const BorderSide(color: Colors.blueAccent, width: 2),
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 30),
          const SizedBox(width: 15),
          Text(gradeTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ContentMenuScreen extends StatelessWidget {
  final String gradeTitle;
  const ContentMenuScreen({super.key, required this.gradeTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gradeTitle),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "ምን ማጥናት ይፈልጋሉ?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 25),
            _buildMenuCard(context, "አጫጭር ማጠቃለያዎች (Short Notes)", Icons.menu_book, Colors.orange, const NoteReadingScreen()),
            const SizedBox(height: 15),
            _buildMenuCard(context, "የቪዲዮ ማብራሪያዎች (Video Lessons)", Icons.play_circle_fill, Colors.red, null),
            const SizedBox(height: 15),
            _buildMenuCard(context, "የመግቢያ ፈተና ጥያቄዎች (Entrance Exams)", Icons.assignment, Colors.green, null),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color iconColor, Widget? targetScreen) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        leading: Icon(icon, size: 40, color: iconColor),
        title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          if (targetScreen != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("ይህ ክፍል በቅርቡ ይለቀቃል!")),
            );
          }
        },
      ),
    );
  }
}

class NoteReadingScreen extends StatelessWidget {
  const NoteReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ፊዚክስ ማጠቃለያ - ምዕራፍ 1"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Chapter 1: Physics and Measurement",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const Divider(height: 30, thickness: 2),
            const Text(
              "1.1 Introduction to Physics",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            const Text(
              "Physics is the branch of science that studies matter, energy, and their interactions. It helps us understand how the universe behaves.",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            const Text(
              "1.2 Physical Quantities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            const Text(
              "A physical quantity is a property of a material or system that can be quantified by measurement. They are divided into two:\n\n"
              "1. Fundamental Quantities: Length, Mass, Time, Temperature, Electric Current, Amount of Substance, and Luminous Intensity.\n\n"
              "2. Derived Quantities: Quantities expressed in terms of fundamental quantities (e.g., Velocity, Area, Force).",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black54),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.amber),
              ),
              child: const Row(
                children: [
                  Icon(Icons.security, color: Colors.amber),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      "ማሳሰቢያ፦ ይህንን ኖት ኮፒ ማድረግ ወይም ስክሪንሾት ማንሳት አይቻልም፤ የቅጂ መብቱ የተጠበቀ ነው።",
                      style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
