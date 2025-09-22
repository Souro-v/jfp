import 'package:flutter/material.dart';
import 'package:jfp/ui/screens/first_screen.dart';

class HellowScreen extends StatefulWidget {
  const HellowScreen({super.key});

  @override
  State<HellowScreen> createState() => _HellowScreenState();
}

class _HellowScreenState extends State<HellowScreen> {
  final PageController _controller = PageController();
  @override
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/images/customer_service.webp",
      "title": "One app for all services.",
      "subtitle": "Get a ride, food, parcel and much more, at your fingertips.",
    },
    {
      "image": "assets/images/img.png",
      "title": "Fast and reliable.",
      "subtitle": "Enjoy quick and secure services anytime, anywhere.",
    },
    {
      "image": "assets/images/img_1.png",
      "title": "Track everything easily.",
      "subtitle": "Keep an eye on your orders and rides in real time.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                }
                );
              },
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(page["image"]!, height: 250),
                      const SizedBox(height: 40),
                      Text(
                        page["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        page["subtitle"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(microseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.red : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          // Get started button (always visible)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Get started",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
