import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'lost_found_screen.dart';
import 'missing_notes_page.dart';
import 'scan_qr_code_screen.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios, color: Color(0xff407362)),
        title: const Text("QR SCANNER",
          style: TextStyle(
            color: Color(0xff407362),
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 200,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff407362),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20)
                        )
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScanQrCodeScreen(),
                        ),
                      );
                    },
                    label: const Text('SCAN QR',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900
                      ),
                    )),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,

          selectedItemColor: Colors.green[800],
          unselectedItemColor: Colors.grey,

          showSelectedLabels: false,
          showUnselectedLabels: false,

          currentIndex: 3,

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
            const BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
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
      ),
    );
  }
}

