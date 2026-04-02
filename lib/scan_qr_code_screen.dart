import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCodeScreen extends StatefulWidget {
  const ScanQrCodeScreen({super.key});

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  String qrResult = 'Scanned Data Will Appear Here';

  bool isScanned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff407362)),
          onPressed: () {
            Navigator.pop(context);
          },
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

      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              onDetect: (capture) {
                if (isScanned) return;

                final barcodes = capture.barcodes;
                if (barcodes.isNotEmpty) {
                  final value = barcodes.first.rawValue;

                  setState(() {
                    qrResult = value ?? "No data found";
                    isScanned = true;
                  });
                }
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              qrResult,
              style: const TextStyle(
                color: Color(0xff407362),
                fontSize: 16,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}