import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({super.key});

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  String qrResult = 'Scanned Data Will Appear Here';

  Future<void> scanQR()async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666','Cancle',true,ScanMode.QR);
      if(!mounted) return;
      qrResult = qrCode.toString();
    }on PlatformException{
      qrResult = 'Fail to Read QR Code';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xff407362)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "QR Code Scanner",
            style: TextStyle(
              color: Color(0xff407362),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(qrResult,style: TextStyle(color: Color(0xff407362)),),
              SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 220,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff407362),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20)
                        ),
                        elevation: 5,
                    ),
                    icon: const Icon(Icons.qr_code_scanner, size: 30, color: Colors.white),
                    label: const Text('SCAN CODE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    onPressed: scanQR,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
