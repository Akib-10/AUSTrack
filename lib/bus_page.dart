import 'package:flutter/material.dart';
import 'schedule_page.dart';


class BusPage extends StatelessWidget {
  const BusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB7CED3),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: Colors.white,

          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color(0xff407362)),
            onPressed: () => Navigator.pop(context),
          ),

          title: Text("Transport",
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
          Image.asset("assets/images/bus_expanded.png",
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
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(50),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(3, 1),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 30,
                  left: 35,
                  right: 35,
                  child: LocationCard(),
                ),
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
    "Mirpur", "Ansar Camp","Technical","Kalyanpur", "Shyamoli","Ring Road","Shia Mashjid",
    "Mohammadpur","Asadgate","Manik Mia","Khamar Bari","Farmgate"];

  String? selectedFrom;
  String? selectedTo;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(height: 10.0),
              const Icon(Icons.location_on, color: Colors.white),
              Container(height: 100, width: 2, color: Colors.white70),
              const Icon(Icons.location_on_outlined, color: Colors.white),
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
                    Future.microtask(() => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SchedulePage(
                          fromLocation: selectedFrom!,
                          toLocation: value,
                        ),
                      ),
                    ));
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
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF5A8C7E),
            borderRadius: BorderRadius.circular(30),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            hint: const Text(
              "Select location",
              style: TextStyle(color: Colors.white60, fontSize: 14),
            ),
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor: const Color(0xFF3E6F63),
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            style: const TextStyle(color: Colors.white, fontSize: 14),
            items: places.map((place) {
              return DropdownMenuItem<String>(
                value: place,
                child: Text(place),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}