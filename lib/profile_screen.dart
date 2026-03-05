import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String name = "Shahriar Hamim";
  //bool isImage1 = true;

  List<bool> isExpanded = [false, false, false, false];

  void toggleSection(int index) {
    setState(() {
      isExpanded[index] = !isExpanded[index];
    });
  }

  void editProfile() {
    showDialog(
      context: context, builder: (context) {
      return AlertDialog(
        title: const Text("Edit Profile"),
        content: const Text("Not Editable."),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Close"),
          )
        ],
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color green = const Color(0xff4f7c6a);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Color(0xff407362)),
        title: const Text("Profile",
          style: TextStyle(
            color: Color(0xff407362),
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xff407362)),
            onPressed: editProfile,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// TOP CARD
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.fromLTRB(70,10,70,10),
              decoration: BoxDecoration(
                color: Color(0xff407362),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // How much the shadow spreads
                    blurRadius: 7, // How blurred the shadow is
                    offset: Offset(0, 3), // Horizontal and vertical offset
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage("assets/images/hamim2.jpg"),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // How much the shadow spreads
                    blurRadius: 7, // How blurred the shadow is
                    offset: Offset(0, 3), // Horizontal and vertical offset
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("ID"),
                      SizedBox(height: 5),
                      Text("106",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Dept"),
                      SizedBox(height: 5),
                      Text("CSE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Year/Sem"),
                      SizedBox(height: 5),
                      Text("2/1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.more_horiz,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),


            /// EXPANDABLE SECTIONS
            buildSection(0, "ACADEMIC INFO", green),
            buildSection(1, "MATERIALS", green),
            buildSection(2, "RESULTS", green),
            buildSection(3, "FEES & PAYMENTS", green),
          ],
        ),
      ),
    );
  }

  Widget buildSection(int index, String title, Color color) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.event_note_rounded),
          title: Text(title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold)),
          trailing: AnimatedRotation(
            turns: isExpanded[index] ? 0.25 : 0,
            duration: const Duration(milliseconds: 300),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () => toggleSection(index),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded[index] ? 80 : 0,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: isExpanded[index]
              ? const Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "Info not given yet."),
          )
              : null,
        ),
        const Divider()
      ],
    );
  }
}