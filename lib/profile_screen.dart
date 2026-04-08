import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Abrar Fahad Bin Patwary";
  String profilePic = 'Assets/Images/ProfilePic.jpeg';

  TextEditingController editControlling = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // FIXED: This takes you back to Homepage
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: const Color(0XFF45735D),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0XFF45735D),
          ),
        ),
        actions: [
          IconButton(
            onPressed: editWindow,
            icon: const Icon(Icons.edit, color: Color(0XFF45735D)),
          )
        ],
      ),
      body: SingleChildScrollView(child: detailsCard()),
    );
  }

  Widget detailsCard() => Center(
    child: SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFF45735D),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              const SizedBox(height: 10),
              whiteBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    expantionable(Icons.assignment_outlined, "ACADEMIC INFO", [
                      const Text("Current CGPA: 3.2", style: TextStyle(fontSize: 16)),
                      const Text("Credits Completed: 59.75", style: TextStyle(fontSize: 16)),
                    ]),
                    const Divider(color: Color(0xFF45735D), thickness: 1, indent: 10, endIndent: 10),
                    expantionable(Icons.folder_open_outlined, "MATERIALS", [
                      const Text("Lecture_Notes.pdf", style: TextStyle(fontSize: 16)),
                    ]),
                    const Divider(color: Color(0xFF45735D), thickness: 1, indent: 10, endIndent: 10),
                    expantionable(Icons.assessment_outlined, "RESULTS", [
                      const Text("Spring 2024: Published", style: TextStyle(fontSize: 16)),
                    ]),
                    const Divider(color: Color(0xFF45735D), thickness: 1, indent: 10, endIndent: 10),
                    expantionable(Icons.payments_outlined, "FEES & PAYMENTS", [
                      const Text("Spring 2025, Status: Paid", style: TextStyle(fontSize: 16)),
                    ]),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 120,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const CircleAvatar(
                radius: 100,
                // Note: Ensure this asset is defined in pubspec.yaml
                backgroundImage: AssetImage('Assets/Images/ProfilePic.jpeg'),
              ),
            ),
          ),
          Positioned(
            top: 380,
            left: 45,
            right: 45,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF67A185),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget whiteBox() {
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7F6),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            offset: const Offset(0,1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          columnForInfo("ID", "106"),
          columnForInfo("Dept", "CSE"),
          columnForInfo("Year/Sem", "2/1"),
          coloumnForDetails("Details"),
        ],
      ),
    );
  }

  Widget columnForInfo(String label, String info) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: Color(0XFF45735D), fontSize: 18)),
        const SizedBox(height: 4),
        Text(info, style: const TextStyle(color: Color(0xFF45735D), fontWeight: FontWeight.bold, fontSize: 24)),
      ],
    );
  }

  Widget coloumnForDetails(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: Color(0XFF45735D), fontSize: 18)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
          child: const Icon(Icons.more_horiz, size: 24, color: Color(0XFF45735D)),
        ),
      ],
    );
  }

  Widget expantionable(IconData icon, String title, List<Widget> children) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: Icon(icon, color: const Color(0xFF45735D), size: 28),
        title: Text(title, style: const TextStyle(color: Color(0xFF45735D), fontWeight: FontWeight.bold, fontSize: 24)),
        trailing: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(color: Color(0xFF67A185), shape: BoxShape.circle),
          child: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
        ),
        childrenPadding: const EdgeInsets.only(left: 70, bottom: 20),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  void editWindow() {
    editControlling.text = name;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: editControlling, decoration: const InputDecoration(labelText: "Name")),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              setState(() => name = editControlling.text);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}