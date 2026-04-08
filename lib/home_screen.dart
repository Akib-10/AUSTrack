import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_screen.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95.0),
        child: AppBar(
          toolbarHeight: 95.0,
          leadingWidth: 75.0,

          leading: Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0, bottom: 25.0),
            child: Image.asset(
              "assets/images/app-logo.png",
              height: 80.0,
              width: 80.0,
            ),
          ),

          title: Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 25.0),
            child: Text(
                "Hello\nWelcome Abrar!",
                style: GoogleFonts.trispace(
                    fontSize: 18,
                    color: Colors.black87
                )
            ),
          ),

          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const profile(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.person_pin,
                  color: Color(0xff3F7862),
                  size: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 22.0,
              top: 10.0,
              right: 22.0,
              bottom: 20.0,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 75,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 15),
                              Text(
                                '10',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3F7862),
                                ),
                              ),
                              Text(
                                'AM',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3F7862),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Container(
                            height: 58,
                            decoration: BoxDecoration(
                              color: Color(0xFF3F7862),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "9 DEC",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Color(0xFFC1EDDA),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 5),
                              ],
                            ),
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(top: 10, right: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 9,
                                  backgroundColor: Color(0xFF3F7862),
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 10),
                                Text(
                                  'Fahim Siddique',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3F7862),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ClipPath(
                            clipper: HiglightsCard(),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Color(0xFF3F7862),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: EdgeInsets.all(15),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4.0),
                                    width: 85.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.hourglass_bottom,
                                          size: 12,
                                          color: Color(0xFF3F7862),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Upcoming',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Color(0xFF3F7862),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(height: 4.0),

                                  Text(
                                    'EEE Quiz 2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    'Room No: 7A06',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Divider(color: Colors.white30, height: 20),

                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Tap to view lecture details',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.0),

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.0),
                      height: 30.0,
                      width: 75.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF3F7862),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Day",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 20.0),
                    Text(
                      "Week",
                      style: TextStyle(
                        color: Color(0xff3F7862),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.search_rounded,
                        color: Color(0xff3F7862),
                        shadows: [
                          Shadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 2.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                SizedBox(
                  height: 70,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: 60.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "5",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Sat",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10.0),

                        Container(
                          height: 60.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "6",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Sun",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10.0),

                        Container(
                          height: 60.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Color(0xff3F7862),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "7",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Mon",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10.0),

                        Container(
                          height: 60.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "8",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Tue",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10.0),

                        Container(
                          height: 60.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "9",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Wed",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10.0),

                        Container(
                          height: 60.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Thu",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10.0),

                        Container(
                          height: 60.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "11",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Fri",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10.0),

                        Container(
                          height: 60.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 3),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "12",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Sat",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff3F7862),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.0),

                Routine(
                  time: "10:40",
                  period: "AM",
                  title: "EEE Theory Class",
                  teacher: "Siam Ansary",
                  room: "Room No: 7A04",
                ),

                SizedBox(height: 20),

                Routine(
                  time: "12:30",
                  period: "PM",
                  title: "EEE Lab",
                  teacher: "Fahim Siddique",
                  room: "Room No: 7A06",
                ),

                SizedBox(height: 20),

                Routine(
                  time: "01:40",
                  period: "PM",
                  title: "DLD Lab",
                  teacher: "Fahim Alam",
                  room: "Room No: 9A09",
                ),

                SizedBox(height: 20),

                Routine(
                  time: "03:00",
                  period: "PM",
                  title: "HUM Theory Class",
                  teacher: "Fahim Alam",
                  room: "Room No: 7A06",
                ),

                SizedBox(height: 20),

                Routine(
                  time: "03:00",
                  period: "PM",
                  title: "EEE Theory Class",
                  teacher: "Abrar Alam",
                  room: "Room No: 7A06",
                ),

                SizedBox(height: 20),

                Routine(
                  time: "05:00",
                  period: "PM",
                  title: "Math Quiz",
                  teacher: "Md. Mustafizur Rahman",
                  room: "Room No: 7A06",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Routine extends StatelessWidget {
  final String time, period, title, teacher, room;

  const Routine({
    super.key,
    required this.time,
    required this.period,
    required this.title,
    required this.teacher,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 75,
          height: 93,
          decoration: BoxDecoration(
            color: Color(0xFF3F7862),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                period,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 12),

        Expanded(
          child: Container(
            height: 93,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 3),
                    Row(
                      children: [
                        Icon(Icons.person, size: 13, color: Colors.black54),
                        SizedBox(width: 6),
                        Text(teacher, style: TextStyle(fontSize: 12)),
                      ],
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 6),
                        Text(room, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),

                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HiglightsCard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;
    double r = 15.0;
    double cutoffDepth = 45.0;
    double cutoffWidth = 120.0;
    double curveStart = w - cutoffWidth - 40;

    path.moveTo(r, 0);
    path.lineTo(curveStart, 0);
    path.cubicTo(
      curveStart + 15,
      0,
      curveStart + 25,
      cutoffDepth,
      curveStart + 55,
      cutoffDepth,
    );
    path.lineTo(w - r, cutoffDepth);
    path.quadraticBezierTo(w, cutoffDepth, w, cutoffDepth + r);
    path.lineTo(w, h - r);
    path.quadraticBezierTo(w, h, w - r, h);
    path.lineTo(r, h);
    path.quadraticBezierTo(0, h, 0, h - r);
    path.lineTo(0, r);
    path.quadraticBezierTo(0, 0, r, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}