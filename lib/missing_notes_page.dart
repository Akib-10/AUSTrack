import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'lost_found_screen.dart';
import 'qr_screen.dart';

class MissingNotesPage extends StatelessWidget {
  const MissingNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryGreen = const Color(0xFF3E6F5E);
    Color lightGrey = const Color(0xFFF2F2F2);

    return Scaffold(
      backgroundColor: lightGrey,
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,

        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        currentIndex: 2,

        items: [
          BottomNavigationBarItem(
            icon: InkWell(child: const Icon(Icons.home),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ),
                );
              },
            ),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: "Bus",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_sharp),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: InkWell(child: const Icon(Icons.qr_code),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrScreen(),
                  ),
                );
              },
            ),
            label: "QR",
          ),
          BottomNavigationBarItem(
            icon: InkWell(child: const Icon(Icons.inventory),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LostFoundPage(),
                  ),
                );
              },
            ),
            label: "Lost",
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFF3E6F5E),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "Missing Notes",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            // By Date / By Course Toggle
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          "By Date",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text(
                          "By Course",
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Scrollable Date Row
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  dateCard("08", "Wed", false),
                  dateCard("09", "Thu", true),
                  dateCard("10", "Fri", false),
                  dateCard("11", "Sat", false),
                  dateCard("12", "Sun", false),
                  dateCard('13', 'Mon', false),
                  dateCard('14', 'tue', false),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Scrollable Notes List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  noteCard(
                    title: "EEE 2141",
                    teacher: "Adnan Amin Siddique",
                    topic: "Clipper & Clamper",
                    available: true,
                  ),
                  const SizedBox(height: 16),
                  noteCard(
                    title: "CSE 2104",
                    teacher: "Md. Siam Ansary",
                    topic: "Doubly Link Lists",
                    available: false,
                  ),
                  const SizedBox(height: 16),
                  noteCard(
                    title: "Data Structure 2111",
                    teacher: "Siam Ansary",
                    topic: "Clipper & Clamper",
                    available: true,
                  ),
                  const SizedBox(height: 16),
                  noteCard(
                    title: "HUM 2100",
                    teacher: "Mosammat Shamima Nasrain",
                    topic: "Clipper & Clamper",
                    available: true,
                  ),
                  const SizedBox(height: 16),
                  noteCard(
                    title: "Math 2108",
                    teacher: "Al Hasib Mahmud",
                    topic: "Clipper & Clamper",
                    available: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Date Card Widget
  Widget dateCard(String date, String day, bool selected) {
    Color primaryGreen = const Color(0xFF3E6F5E);

    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: selected ? primaryGreen : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : primaryGreen,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            day,
            style: TextStyle(
              color: selected ? Colors.white : primaryGreen,
            ),
          ),
        ],
      ),
    );
  }

  // Note Card Widget
  Widget noteCard({
    required String title,
    required String teacher,
    required String topic,
    required bool available,
  }) {
    Color primaryGreen = const Color(0xFF3E6F5E);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: available ? primaryGreen : Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  available ? "Available" : "Not Available",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text("Course Teacher: $teacher"),
          Text("Topic: $topic"),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                icon: const Icon(Icons.note, color: Colors.white),
                label: const Text("Request Notes",
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye, color: Colors.white),
                label: const Text("Details",
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),
            ],
          )
        ],
      ),
    );
  }
}