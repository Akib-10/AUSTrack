import 'package:flutter/material.dart';


class LostFoundPage extends StatefulWidget {
  const LostFoundPage({super.key});

  @override
  State<LostFoundPage> createState() => _LostFoundPageState();
}

class _LostFoundPageState extends State<LostFoundPage> {
  // Logic for category selection
  String selectedCategory = "All";
  final List<String> categories = [
    "All", "Bags", "Bottle", "ID Card", "Umbrella", "Electronics", "Mobile", "Charger", "Others"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 90,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25.0, bottom: 25.0),
          child: Image.asset(
            "assets/Images/app-logo.jpeg",
            height: 80.0,
            width: 80.0,
          ),
        ),
        title: const Text(
          "Lost & Found",
          style: TextStyle(
            color: Color(0xff407362),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // 1. Functioning Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: (value) {
                // Handle search logic here
              },
              decoration: InputDecoration(
                hintText: "Search items...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 2. Category Row (Guaranteed Scrollable)
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedCategory == categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(categories[index]),
                    selected: isSelected,
                    selectedColor: const Color(0xff407362),
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),

          // 3. Body List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                ItemCard(name: "Backpack", date: "27 Feb 2025", color: "Black", room: "7A06"),
                ItemCard(name: "Bottle", date: "25 Jan 2025", color: "Blue", room: "4C02"),
                ItemCard(name: "ID Card", date: "15 Apr 2024", color: "N/A", room: "N/A"),
                ItemCard(name: "Umbrella", date: "15 Apr 2024", color: "Grey", room: "N/A"),
                ItemCard(name: "Charger", date: "10 Mar 2025", color: "White", room: "Library"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String name, date, color, room;
  const ItemCard({super.key, required this.name, required this.date, required this.color, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0XFFC9F2D9).withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.inventory_2_outlined, color: Color(0xff407362), size: 30),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff2D4F44))),
                const SizedBox(height: 4),
                Text("📅 Found: $date", style: const TextStyle(fontSize: 12)),
                Text("🎨 Color: $color", style: const TextStyle(fontSize: 12)),
                Text("📍 Room: $room", style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xff407362),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text("Details", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}