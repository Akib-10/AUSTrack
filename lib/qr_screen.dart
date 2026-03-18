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

