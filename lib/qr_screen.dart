import 'package:flutter/material.dart';
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
          centerTitle: false,
          title: Text(
            "QR SCANNER",
            style: TextStyle(
              color:  Color(0xff407362),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 100,
            width: 200,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff407362),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(20)
                    ),
                    elevation: 5,
                ),
                icon: const Icon(Icons.qr_code_scanner, size: 35,color: Colors.white,),
                label:  Text('SCAN QR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScanQrCodeScreen(),
                    ),
                  );
                },
            ),
          ),
        ),
      ),
    );
  }
}

