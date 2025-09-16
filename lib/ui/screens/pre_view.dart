
import 'package:flutter/material.dart';
import 'package:jfp/ui/screens/customer_register.dart';
import 'package:jfp/ui/screens/guest_register.dart';
import 'package:jfp/ui/screens/retailer_registration.dart';
import '../../utility/registration_option_card.dart';

class PreView extends StatelessWidget {
  const PreView({super.key});
  static const String name='/preview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,

        title:  Text(
          "Welcome to JFP ",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body:
          Positioned(
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // First Card: Overseas Buyer
                      RegistrationOptionCard(
                        icon: Icons.person_pin,
                        iconColor: Colors.blue,
                        title: 'Guest',
                        subtitle: 'Need to verify',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const GuestRegister()),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      // Second Card: Domestic Buyer
                      RegistrationOptionCard(
                        icon: Icons.person_pin,
                        iconColor: Colors.red,
                        title: 'Customer',
                        subtitle: 'A valid Registration is required.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CustomerRegister()),
                          );
                        },
                      ),
                      const SizedBox(height: 40),
                      // Third Card: Purchasing Agent
                      RegistrationOptionCard(
                        icon: Icons.person_pin,
                        iconColor: Colors.green,
                        title: 'Retailer',
                        subtitle: 'A valid registration of your organization is required',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RetailerRegistration()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}

