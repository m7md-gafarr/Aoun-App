import 'package:flutter/material.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Contact Us"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Your Email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (!value.contains("@")) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Phone
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Your Phone",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Address
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  hintText: "Your Address",
                ),
              ),
              const SizedBox(height: 12),

              // Message
              TextFormField(
                controller: _messageController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Your Message...",
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your message";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Send Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Send logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Message sent!")),
                    );
                  }
                },
                child: const Text("Send Message"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
