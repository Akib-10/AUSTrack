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

  final List<Map<String, dynamic>> buses = const [
    {
      "name": "Meghna - 1",
      "driverNumber": "+880 1711-000001",
      "route": ["Farmgate", "Bijoy Sarani", "Mohakhali", "Aust"],
    },
    {
      "name": "Meghna - 2",
      "driverNumber": "+880 1711-000002",
      "route": ["Farmgate", "Banani", "Mohakhali", "Aust"],
    },
    {
      "name": "Padma - 1",
      "driverNumber": "+880 1711-000003",
      "route": ["Farmgate", "Bijoy Sarani", "Gulshan", "Aust"],
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _LocationCard(
                        from: fromLocation,
                        to: toLocation,
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
                      Expanded(
                        child: ListView.separated(
                          itemCount: buses.length,
                          separatorBuilder: (_, __) => const Divider(
                            color: Color(0xFFB7CED3),
                            thickness: 1,
                          ),
                          itemBuilder: (context, index) {
                            final bus = buses[index];
                            return _BusItem(
                              busName: bus["name"],
                              onSelect: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ReceiptPage(
                                      fromLocation: fromLocation,
                                      toLocation: toLocation,
                                      selectedTime: selectedTime,
                                      busName: bus["name"],
                                      driverNumber: bus["driverNumber"],
                                      route: List<String>.from(bus["route"]),
                                    ),
                                  ),
                                );
                              },
                              onFullRoute: () {
                                _showRouteDialog(
                                    context, bus["name"], bus["route"]);
                              },
                              onContact: () {
                                _showContactDialog(
                                    context, bus["name"], bus["driverNumber"]);
                              },
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

  void _showRouteDialog(
      BuildContext context, String busName, List<dynamic> route) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(busName,
            style: const TextStyle(
                color: Color(0xFF3E6F63), fontWeight: FontWeight.bold)),
        content: Text(
          route.join(" → "),
          style: const TextStyle(fontSize: 15, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close",
                style: TextStyle(color: Color(0xFF3E6F63))),
          ),
        ],
      ),
    );
  }

  void _showContactDialog(
      BuildContext context, String busName, String number) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text("Driver Contact",
            style: TextStyle(
                color: Color(0xFF3E6F63), fontWeight: FontWeight.bold)),
        content: Text(
          "$busName\n$number",
          style: const TextStyle(fontSize: 15, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close",
                style: TextStyle(color: Color(0xFF3E6F63))),
          ),
        ],
      ),
    );
  }
}

class _BusItem extends StatelessWidget {
  final String busName;
  final VoidCallback onSelect;
  final VoidCallback onFullRoute;
  final VoidCallback onContact;

  const _BusItem({
    required this.busName,
    required this.onSelect,
    required this.onFullRoute,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
          // Buttons
          Expanded(
            child: Column(
              children: [
                _actionButton("Select", onSelect),
                const SizedBox(height: 8),
                _actionButton("Full Route", onFullRoute),
                const SizedBox(height: 8),
                _actionButton("Contact", onContact),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String label, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3E6F63),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}

// Same reusable card — copy from schedule_page.dart or put in a shared file
class _LocationCard extends StatelessWidget {
  final String from;
  final String to;

  const _LocationCard({required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF3E6F63),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const Icon(Icons.location_on, color: Colors.white),
              Container(height: 40, width: 2, color: Colors.white54),
              const Icon(Icons.location_on_outlined, color: Colors.white),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("From",
                    style: TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 4),
                _locationBox(from),
                const SizedBox(height: 12),
                const Text("To",
                    style: TextStyle(color: Colors.white70, fontSize: 13)),
                const SizedBox(height: 4),
                _locationBox(to),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF5A8C7E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(text,
          style: const TextStyle(color: Colors.white, fontSize: 15)),
    );
  }
}