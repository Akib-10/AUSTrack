import 'package:flutter/material.dart';
import 'receipt_page.dart';

class BusSelectionPage extends StatelessWidget {
  final String fromLocation;
  final String toLocation;
  final String selectedTime;

  const BusSelectionPage({
    super.key,
    required this.fromLocation,
    required this.toLocation,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> buses = [
      {
        "name": "Meghna - 1",
        "driverNumber": "+880 1711-000001",
        "route": ["Farmgate", "Bijoy Sarani", "Mohakhali", "Aust"],
      },
      {
        "name": "Jamuna - 2",
        "driverNumber": "+880 1711-000002",
        "route": ["Farmgate", "Banani", "Mohakhali", "Aust"],
      },
      {
        "name": "Padma - 1",
        "driverNumber": "+880 1711-000003",
        "route": ["Farmgate", "Bijoy Sarani", "Gulshan", "Aust"],
      },
    ];

    return Scaffold(
      backgroundColor: Color(0xFFB7CED3),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: const Color(0xFFB7CED3),

          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF3E6F63),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 18),
            ),
          ),
          title: Text(
            "Transport",
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
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

                Padding(
                  padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3E6F63),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.white),
                                Container(
                                    height: 40, width: 2, color: Colors.white54),
                                const Icon(Icons.location_on_outlined,
                                    color: Colors.white),
                              ],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("From",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 13)),
                                  const SizedBox(height: 4),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5A8C7E),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(fromLocation,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15)),
                                  ),
                                  const SizedBox(height: 12),
                                  const Text("To",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 13)),
                                  const SizedBox(height: 4),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF5A8C7E),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(toLocation,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      const Text(
                        "Available Buses:",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Bus list
                      Expanded(
                        child: ListView.separated(
                          itemCount: buses.length,
                          separatorBuilder: (context, index) => const Divider(
                            color: Color(0xFFB7CED3),
                            thickness: 1,
                          ),
                          itemBuilder: (context, index) {
                            String busName = buses[index]["name"];
                            String driverNumber = buses[index]["driverNumber"];
                            List<String> route = List<String>.from(buses[index]["route"]);

                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  // Bus name box
                                  Container(
                                    width: 130,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3E6F63),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      busName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  Expanded(
                                    child: Column(
                                      children: [
                                        // Select button
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReceiptPage(
                                                        fromLocation: fromLocation,
                                                        toLocation: toLocation,
                                                        selectedTime: selectedTime,
                                                        busName: busName,
                                                        driverNumber: driverNumber,
                                                        route: route,
                                                      ),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              const Color(0xFF3E6F63),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                              ),
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10),
                                            ),
                                            child: Text("Select",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // Full Route
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                      title: Text(busName,
                                                          style:  TextStyle(
                                                              color: Color(
                                                                  0xFF3E6F63),
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      content: Text(
                                                        route.join(" → "),
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            height: 1.5),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: const Text("Close",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF3E6F63))),
                                                        ),
                                                      ],
                                                    ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              const Color(0xFF3E6F63),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                              ),
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10),
                                            ),
                                            child: const Text("Full Route",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        // Contact button
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                      title: const Text(
                                                          "Driver Contact",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF3E6F63),
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                      content: Text(
                                                        "$busName\n$driverNumber",
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            height: 1.5),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                          child: const Text("Close",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF3E6F63))),
                                                        ),
                                                      ],
                                                    ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              const Color(0xFF3E6F63),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                              ),
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10),
                                            ),
                                            child: const Text("Contact",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}