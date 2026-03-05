import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'missing_notes_page.dart';
import 'qr_screen.dart';

class LostFoundPage extends StatelessWidget {
  const LostFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lost & Found"),
        backgroundColor: Colors.green[300],
      ),

      // Bottom Navigation Bar (UI Only)
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,

        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        currentIndex: 4,

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
          BottomNavigationBarItem(
            icon: InkWell(child: const Icon(Icons.note_alt_sharp),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MissingNotesPage(),
                  ),
                );
              },
            ),
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
          const BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "Lost",
          ),
        ],
      ),

      body: Column(
        children: [

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Proper Scrollable Category Row
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: const [
                CategoryChip("All"),
                CategoryChip("Bags"),
                CategoryChip("Bottle"),
                CategoryChip("ID Card"),
                CategoryChip("Umbrella"),
                CategoryChip("Electronics"),
                CategoryChip("Others"),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Scrollable Item List
          Expanded(
            child: ListView(
              children: const [
                ItemCard(
                  name: "Backpack",
                  date: "27 Feb 2025",
                  color: "Black",
                  room: "7A06",
                ),
                ItemCard(
                  name: "Bottle",
                  date: "25 Jan 2025",
                  color: "Blue",
                  room: "4C02",
                ),
                ItemCard(
                  name: "ID Card",
                  date: "15 Apr 2024",
                  color: "N/A",
                  room: "N/A",
                ),
                ItemCard(
                  name: "Umbrella",
                  date: "15 Apr 2024",
                  color: "Grey",
                  room: "N/A",
                ),
                ItemCard(
                  name: "Umbrella",
                  date: "15 Apr 2024",
                  color: "Grey",
                  room: "N/A",
                ),
                ItemCard(
                  name: "Umbrella",
                  date: "15 Apr 2024",
                  color: "Grey",
                  room: "N/A",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// Category Widget
class CategoryChip extends StatelessWidget {
  final String text;

  const CategoryChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Chip(
        label: Text(text),
        backgroundColor: Colors.green[200],
      ),
    );
  }
}


// Item Card Widget
class ItemCard extends StatelessWidget {
  final String name;
  final String date;
  final String color;
  final String room;

  const ItemCard({
    super.key,
    required this.name,
    required this.date,
    required this.color,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [

          // Image Placeholder
          Container(
            width: 70,
            height: 70,
            color: Colors.white,
            child: const Icon(Icons.image),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),

                Text("Found: $date"),
                Text("Color: $color"),
                Text("Room: $room"),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Details"),
          )
        ],
      ),
    );
  }
}