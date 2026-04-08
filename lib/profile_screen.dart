import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: profile(),
));

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String name = "Abrar Fahad Bin Patwary";
  String profilePic = 'Assets/Images/ProfilePic.jpeg';

  TextEditingController EditControlling = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        leading: IconButton(onPressed:(){},
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0XFF45735D),
        ),
        title: Text("Profile",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0XFF45735D),
          ),
        ),
        actions: [
          IconButton(
            onPressed: EditWindow, // Connect the function here
            icon: Icon(Icons.edit, color: Color(0XFF45735D)),
          )
        ],
        //centerTitle: true,
      ),
      body: SingleChildScrollView(child: DetailsCard()),
    );
  }

  Widget DetailsCard() => Center(
    child: SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          //1.The Main Boxes(Green+White)
          Column(
            children: [
              // Green Box
              Container(
                height: 400,
                width: double.infinity,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFF45735D),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              const SizedBox(height: 10),
              //White Box
              WhiteBox(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expantionable(Icons.assignment_outlined, "ACADEMIC INFO", [
                      Text("Current CGPA: 3.2", style: TextStyle(fontSize: 16)),
                      Text("Credits Completed: 59.75", style: TextStyle(fontSize: 16)),
                    ]),
                    Divider(color: Color(0xFF45735D), thickness: 1, indent: 10, endIndent: 10),

                    Expantionable(Icons.folder_open_outlined, "MATERIALS", [
                      Text("Lecture_Notes.pdf", style: TextStyle(fontSize: 16)),
                    ]),
                    Divider(color: Color(0xFF45735D), thickness: 1, indent: 10, endIndent: 10),

                    Expantionable(Icons.assessment_outlined, "RESULTS", [
                      Text("Spring 2024: Published", style: TextStyle(fontSize: 16)),
                    ]),
                    Divider(color: Color(0xFF45735D), thickness: 1, indent: 10, endIndent: 10),

                    Expantionable(Icons.payments_outlined, "FEES & PAYMENTS", [
                      Text("Spring 2025, Status: Paid", style: TextStyle(fontSize: 16)),
                      Text("Fall 2024, Status: Paid", style: TextStyle(fontSize: 16)),
                      Text("Spring 2024, Status: Paid", style: TextStyle(fontSize: 16)),
                    ]),
                  ],
                ),
              ),
              //const SizedBox(height: 50), // Extra space at bottom for scrolling
            ],
          ),

          // 2. THE PROFILE PICTURE
          Positioned(
            top: 120,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage('Assets/Images/ProfilePic.jpeg'), // Use the variable
              ),
            ),
          ),

          // 3. THE NAME BOX
          Positioned(
            top: 380,
            left: 45,
            right: 45,
            //height: 100,
            //width: double.infinity,
            child: Container(
              //width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF67A185), // Lighter Green
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Center(
                child: Text(
                  name, // Use the variable
                  style: TextStyle(
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

  Widget WhiteBox() {
    return Container(
      margin: EdgeInsets.all(15),
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFFF5F7F6),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ColumnForInfo("ID", "106"),
          ColumnForInfo("Dept", "CSE"),
          ColumnForInfo("Year/Sem", "2/1"),
          ColoumnForDetails("Details"),
        ],
      ),
    );
  }

  Widget ColumnForInfo(String label, String info) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: TextStyle(color: Color(0XFF45735D), fontSize: 18)),
        const SizedBox(height: 4),
        Text(info, style: const TextStyle(
          color: Color(0xFF45735D), // Dark green-ish color from your image
          fontWeight: FontWeight.bold,
          fontSize: 24,
        )),
      ],
    );
  }

  Widget ColoumnForDetails(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: Color(0XFF45735D), fontSize: 18)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.more_horiz, size: 24, color: Color(0XFF45735D)),
        ),
      ],
    );
  }

  Widget Expantionable(IconData icon, String title, List<Widget> children) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: Icon(icon, color: Color(0xFF45735D), size: 28),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF45735D),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            color: Color(0xFF67A185), // Green circle
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
        ),
        childrenPadding: const EdgeInsets.only(left: 70, bottom: 20),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  void EditWindow() {
    EditControlling.text = name;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: EditControlling,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 10),
            Text("To change the photo, paste a new image URL below:", style: TextStyle(fontSize: 12)),
            TextField(
              onChanged: (value) => profilePic = value,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = EditControlling.text;
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}



