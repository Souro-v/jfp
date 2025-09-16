import 'package:flutter/material.dart';

import '../screens/pre_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home_outlined, color: Colors.grey),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search for exhibitors',
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_scanner_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // JFP Global Share Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8B2556), Color(0xFFC44A72)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'JFP Global Share',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.local_florist,
                          color: Color(0xFFC9F7F5),
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.local_florist,
                          color: Color(0xFFC9F7F5),
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.local_florist,
                          color: Color(0xFFC9F7F5),
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Quick Access Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickAccessIcon(Icons.badge, 'Buyer\nBadge'),
                  _buildQuickAccessIcon(
                    Icons.calendar_month,
                    'Itinerary\nPlan',
                  ),
                  _buildQuickAccessIcon(
                    Icons.preview_sharp,
                    'Attendance\nGuide',
                  ),
                  _buildQuickAccessIcon(Icons.map, 'Floor\nPlan'),
                ],
              ),
              const SizedBox(height: 20),
              // Exhibitors & Products Section
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PreView()),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Exhibitors & Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildExhibitorListTile('Phase 1'),
              const Divider(),
              _buildExhibitorListTile('Phase 2'),
              const Divider(),
              _buildExhibitorListTile('Phase 3'),
              const SizedBox(height: 20),

              // News & Events Section
              const Text(
                'News & Events',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _buildColoredContainer(Colors.teal),
                  const SizedBox(width: 10),
                  _buildColoredContainer(Colors.red),
                  const SizedBox(width: 10),
                  _buildColoredContainer(Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Own'),
        ],
      ),
    );
  }

  Widget _buildQuickAccessIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[300]!, width: 1.5),
          ),
          child: Icon(icon, size: 30, color: Colors.pink),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey[800]),
        ),
      ],
    );
  }

  Widget _buildExhibitorListTile(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Handle tap
      },
    );
  }

  Widget _buildColoredContainer(Color color) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
