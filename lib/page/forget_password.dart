import 'package:flutter/material.dart';
import 'package:lunaflow/widgets/layout/CustomButton.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isSubmitting = false;
  String _statusMessage = '';

  void _resetPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSubmitting = true;
        _statusMessage = '';
      });

      // Simulate a network request (you would call your API here)
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isSubmitting = false;
        _statusMessage = 'Password reset link sent to ${_emailController.text}';
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forgot Password'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back on back button press
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('image/luna.png'),
            const SizedBox(height: 50),
            // Ensure the image is correctly placed
            const Text(
              'Enter your email to reset your password.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  _isSubmitting
                      ? const CircularProgressIndicator()
                      : Custombutton(
                          btnName: 'Reset Password', onPressed: _resetPassword),
                  const SizedBox(height: 20),
                  if (_statusMessage.isNotEmpty)
                    Text(
                      _statusMessage,
                      style: TextStyle(
                        color: _statusMessage.contains('sent')
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
