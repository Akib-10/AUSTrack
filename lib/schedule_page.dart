import 'package:flutter/material.dart';
import 'bus_selection_page.dart';

class SchedulePage extends StatefulWidget {
  final String fromLocation;
  final String toLocation;

  const SchedulePage({
    super.key,
    required this.fromLocation,
    required this.toLocation,
  });

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<String> schedules = [
    "06 : 00 am",
    "08 : 30 am",
    "01 : 30 pm",
    "03 : 30 pm",
    "05 : 00 pm",
    "06 : 30 pm",
    "08 : 00 pm",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB7CED3),


      appBar: PreferredSize(
        preferredSize:Size.fromHeight(55),
        child: AppBar(
          backgroundColor: Color(0xFFB7CED3),

          leading: GestureDetector(
            onTap: () => Navigator.pop(context),

            child: Container(
              margin: EdgeInsets.all(10),
              decoration:
              BoxDecoration(
                color: Color(0xFF3E6F63),
                shape: BoxShape.circle,
              ),

              child: Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 18),
            ),
          ),

          title:  Text("Transport",
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
          SizedBox(height: 10),
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
                        from: widget.fromLocation,
                        to: widget.toLocation,
                      ),

                      const SizedBox(height: 28),

                       Text(
                        "Choose Schedule",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Expanded(
                        child: ListView.separated(
                          itemCount: schedules.length,
                          separatorBuilder: (_, __) => const Divider(
                            color: Color(0xFFB7CED3),
                            thickness: 1,
                          ),
                          itemBuilder: (context, index) {
                            return _ScheduleItem(
                              time: schedules[index],
                              onSelect: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BusSelectionPage(
                                      fromLocation: widget.fromLocation,
                                      toLocation: widget.toLocation,
                                      selectedTime: schedules[index],
                                    ),
                                  ),
                                );
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
}

class _ScheduleItem extends StatelessWidget {
  final String time;
  final VoidCallback onSelect;

  const _ScheduleItem({required this.time, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.history, size: 30, color: Colors.black54),
          const SizedBox(width: 16),
          Text(
            time,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const Spacer(),

          ElevatedButton(
            onPressed: onSelect,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3E6F63),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding:
              const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            ),
            child: const Text(
              "Select",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Icon(Icons.location_on, color: Colors.white),
              Container(
                height: 100,
                width: 2,
                color: Colors.white54,
              ),
              const Icon(Icons.location_on_outlined, color: Colors.white),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("From",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13
                    )
                ),
                const SizedBox(height: 4),
                _locationBox(from),
                const SizedBox(height: 12),
                Text("To",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13
                    )
                ),
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
      padding:EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF5A8C7E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 15
        ),
      ),
    );
  }
}