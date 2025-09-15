import 'package:flutter/material.dart';
import 'package:jfp/ui/loged_in/home_screen.dart';

class RetailerRegistration extends StatefulWidget {
  const RetailerRegistration({super.key});

  static const String name = '/Customer_Register';

  @override
  State<RetailerRegistration> createState() => _CustomerRegister();
}

class _CustomerRegister extends State<RetailerRegistration> {
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _frstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _tinController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      if(_passwordTEcontroller.value == _rePasswordController.value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Registration Successful! Name: ${_frstNameController.text}',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:Text("Please match the passwords",
                  style: const TextStyle(color: Colors.redAccent))
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Retailer Registration",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text("Join with us", style: textTheme.titleLarge),
                SizedBox(height: 30),
                TextFormField(
                  controller: _emailTEcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email',
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'E-mail is required';
                    }
                    final RegExp emailRegex =
                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value!)) {
                      return "Enter a valid email";
                    }
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _frstNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(labelText: 'First Name',
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your name';
                    }
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _lastNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(labelText: 'Last Name',
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Phone Number ',
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                    ),

                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter a valid Phone Number';
                    }
                    if (!RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$').hasMatch(value!)) {
                      return "Enter a valid Bangladeshi mobile number";
                    }
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _tinController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'TIN Number',
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal:10 ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Your Address';
                    }
                    if (!RegExp(r'^\d{12}$').hasMatch(value!)) {
                      return "TIN must be 12 digits";
                    }
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: _passwordTEcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(labelText: 'Password',
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Password';
                    }
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _rePasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(labelText: 'Confirm Password',
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Retype password';
                    }
                  },
                ),
                SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
