import 'package:flutter/material.dart';
import 'schedule_page.dart';

class BusPage extends StatelessWidget {
  const BusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB7CED3),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(95.0),
        child: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 95.0,
          leadingWidth: 75.0,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0, bottom: 25.0),
            child: Image.asset(
              "assets/images/app-logo.png",
              height: 80.0,
              width: 80.0,
            ),
          ),
          centerTitle: false,
          title: const Text(
            "Transport",
            style: TextStyle(
              color: Color(0xff407362),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          Image.asset(
            "assets/images/bus_expanded.png",
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Container(height: 7.0, color: Colors.white),
          const SizedBox(height: 25),

          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
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

                Positioned(top: 30, left: 35, right: 35, child: LocationCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LocationCard extends StatefulWidget {
  const LocationCard({super.key});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  final List<String> places = [
    "Mirpur",
    "Ansar Camp",
    "Technical",
    "Kalyanpur",
    "Shyamoli",
    "Ring Road",
    "Shia Mashjid",
    "Mohammadpur",
    "Asadgate",
    "Manik Mia",
    "Khamar Bari",
    "Farmgate",
  ];

  String? selectedFrom;
  String? selectedTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3E6F63),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              //SizedBox(height: 10.0),
              Icon(Icons.location_on, color: Colors.white),
              Container(height: 100, width: 2, color: Colors.white70),
              Icon(Icons.location_on_outlined, color: Colors.white),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                _buildDropdown("From", selectedFrom, (value) {
                  setState(() => selectedFrom = value);
                }),
                const SizedBox(height: 16),
                _buildDropdown("To", selectedTo, (value) {
                  setState(() => selectedTo = value);
                  if (selectedFrom != null && value != null) {
                    Future.microtask(
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SchedulePage(
                            fromLocation: selectedFrom!,
                            toLocation: value,
                          ),
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 14)),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFF5A8C7E),
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            hint: Text(
              "Select location",
              style: TextStyle(color: Colors.white60, fontSize: 14),
            ),
            isExpanded: true,
            underline: SizedBox(),

            dropdownColor: const Color(0xFF3E6F63),

            icon:  Icon(Icons.keyboard_arrow_down, color: Colors.white),
            style: TextStyle(color: Colors.white, fontSize: 14),
            items: [
              for (String place in places)
                DropdownMenuItem<String>(
                  value: place,
                  child: Text(place),
                ),
            ],
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
