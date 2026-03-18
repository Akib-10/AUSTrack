import 'package:flutter/material.dart';

class MissingNotesPage extends StatelessWidget {
  const MissingNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryGreen =  Color(0xFF3E6F5E);
    Color lightGrey =  Color(0xFFF2F2F2);

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color:  Color(0xff407362)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            "Missing Notes",
            style: TextStyle(
              color:  Color(0xff407362),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [

            Container(
              margin:  EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:  EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:  Center(
                        child: Text(
                          "By Date",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                   Expanded(
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

             SizedBox(height: 16),

            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:  EdgeInsets.symmetric(horizontal: 16),
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

             SizedBox(height: 10),

            Expanded(
              child: ListView(
                padding:  EdgeInsets.all(16),
                children: [
                  noteCard(
                    title: "EEE 2141",
                    teacher: "Adnan Amin Siddique",
                    topic: "Clipper & Clamper",
                    available: true,
                  ),
                   SizedBox(height: 16),
                  noteCard(
                    title: "CSE 2104",
                    teacher: "Md. Siam Ansary",
                    topic: "Doubly Link Lists",
                    available: false,
                  ),
                   SizedBox(height: 16),
                  noteCard(
                    title: "Data Structure 2111",
                    teacher: "Siam Ansary",
                    topic: "Clipper & Clamper",
                    available: true,
                  ),
                   SizedBox(height: 16),
                  noteCard(
                    title: "HUM 2100",
                    teacher: "Mosammat Shamima Nasrain",
                    topic: "Clipper & Clamper",
                    available: true,
                  ),
                   SizedBox(height: 16),
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


  Widget dateCard(String date, String day, bool selected) {
    Color primaryGreen =  Color(0xFF3E6F5E);

    return Container(
      width: 70,
      margin:  EdgeInsets.only(right: 12),
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
           SizedBox(height: 5),
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
    Color primaryGreen =  Color(0xFF3E6F5E);

    return Container(
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        boxShadow:  [
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
                style:  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding:
                 EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: available ? primaryGreen : Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  available ? "Available" : "Not Available",
                  style:  TextStyle(
                      color: Colors.white,
                      fontSize: 12),
                ),
              )
            ],
          ),
           SizedBox(height: 8),
          Text("Course Teacher: $teacher"),
          Text("Topic: $topic"),
           SizedBox(height: 16),

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
                icon:  Icon(Icons.note, color: Colors.white),
                label:  Text("Request Notes",
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
                icon:  Icon(Icons.remove_red_eye, color: Colors.white),
                label:  Text("Details",
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