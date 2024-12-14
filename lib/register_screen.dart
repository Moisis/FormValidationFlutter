import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;

  void _resetForm() {
    setState(() {
      _controllerName.clear();
      _controllerEmail.clear();
      _controllerPhone.clear();
      _controllerPassword.clear();
      _errorMessage = null;
    });
  }

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errorMessage = null;
      });
      Fluttertoast.showToast(msg: "Registration completed successfully!" , gravity: ToastGravity.SNACKBAR);
    } else {
      setState(() {
        _errorMessage = "Please fix the errors above.";

      });
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name cannot be empty";
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value == null || !emailRegex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.length != 10 || !RegExp(r'^\d{10}$').hasMatch(value)) {
      return "Phone number must be exactly 10 digits";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.1),
                    topRight: Radius.circular(MediaQuery.of(context).size.width * 0.1),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                          // Name Field
                          TextFormField(
                            controller: _controllerName,
                            decoration: const InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(),
                            ),
                            validator: _validateName,
                          ),
                          const SizedBox(height: 20),
                          // Email Field
                          TextFormField(
                            controller: _controllerEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(),
                            ),
                            validator: _validateEmail,
                          ),
                          const SizedBox(height: 20),
                          // Phone Number Field
                          TextFormField(
                            controller: _controllerPhone,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Phone Number",
                              border: OutlineInputBorder(),
                              prefixText: "+20 ",
                            ),
                            validator: _validatePhone,
                          ),
                          const SizedBox(height: 20),
                          // Password Field
                          TextFormField(
                            controller: _controllerPassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(),
                            ),
                            validator: _validatePassword,
                          ),
                          const SizedBox(height: 20),
                          // Error Message Display
                          if (_errorMessage != null)
                            Text(
                              _errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          const SizedBox(height: 20),
                          // Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: _validateAndSubmit,
                                child: const Text("Register"),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                              ElevatedButton(
                                onPressed: _resetForm,
                                child: const Text("Reset"),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/login', (route) => false);
                                },
                                child: const Text(
                                  "Log In",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
