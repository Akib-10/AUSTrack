import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  final String fromLocation;
  final String toLocation;
  final String selectedTime;
  final String busName;
  final String driverNumber;
  final List<String> route;

  const ReceiptPage({
    super.key,
    required this.fromLocation,
    required this.toLocation,
    required this.selectedTime,
    required this.busName,
    required this.driverNumber,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final routeString = route.join(" → ");

    return Scaffold(
      backgroundColor: const Color(0xFFB7CED3),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          backgroundColor: const Color(0xFFB7CED3),
          elevation: 0,

          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFF3E6F63),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 18),
            ),
          ),
          title: const Text(
            "Your Receipt",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: Stack(
              children: [
                // White
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(3, 1),
                      ),
                    ],
                  ),
                ),

                SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(25, 35, 25, 30),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFFB7CED3),
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      children: [

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Color(0xFF3E6F63),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Icon(Icons.directions_bus,
                                  color: Colors.white, size: 36),
                              const SizedBox(height: 6),
                              Text(
                                busName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Booking Confirmed",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 13),
                              ),
                            ],
                          ),
                        ),

                        _dottedDivider(),

                        // Details ekhan theeeeke addd
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              _receiptRow(Icons.location_on, "From",
                                  fromLocation),
                              const SizedBox(height: 16),
                              _receiptRow(Icons.location_on_outlined, "To",
                                  toLocation),
                              const SizedBox(height: 16),
                              _receiptRow(Icons.access_time, "Time of Arrival",
                                  selectedTime),
                              const SizedBox(height: 16),
                              _receiptRow(Icons.phone, "Driver Number",
                                  driverNumber),
                              const SizedBox(height: 20),

                              // Route box
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF0F7F5),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(Icons.route,
                                            color: Color(0xFF3E6F63),
                                            size: 18),
                                        SizedBox(width: 6),
                                        Text(
                                          "Route",
                                          style: TextStyle(
                                            color: Color(0xFF3E6F63),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      routeString,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF0F7F5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Please be present timely at your location!",
                              style: TextStyle(
                                color: Color(0xFF3E6F63),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
    );
  }

  Widget _receiptRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF3E6F63), size: 20),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style:
                const TextStyle(color: Colors.black45, fontSize: 12)),
            const SizedBox(height: 2),
            Text(value,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
          ],
        ),
      ],
    );
  }

  Widget _dottedDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: List.generate(
          30,
              (index) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 1.5,
              color: index.isEven
                  ? const Color(0xFFB7CED3)
                  : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}