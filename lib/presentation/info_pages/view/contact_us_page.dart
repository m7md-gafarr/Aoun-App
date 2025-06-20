import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/info_pages/view_model/contant_us/contant_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppbarWidget(title: S.of(context).contact_us_title),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Email
              TextFormField(
                controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: S.of(context).contact_us_email_hint,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).enter_email;
                  } else if (!RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return S.of(context).enter_valid_email;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Phone
              TextFormField(
                controller: _phoneController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: S.of(context).contact_us_phone_hint,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).contact_us_phone_required;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Address
              TextFormField(
                controller: _addressController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: S.of(context).contact_us_address_hint,
                ),
              ),
              const SizedBox(height: 12),

              // Message
              TextFormField(
                controller: _messageController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: S.of(context).contact_us_message_hint,
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).contact_us_message_required;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Send Button
              BlocConsumer<ContantUsCubit, ContantUsState>(
                listener: (context, state) {
                  if (state is ContantUsSuccess) {
                    DialogHelper(context).showSuccessDialog(
                      message: "Success",
                      title: "Your message was sent successfully!",
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text(S.of(context).ok_AlertDialogt))
                      ],
                    );
                  } else if (state is ContantUsFailure) {
                    DialogHelper(context).showErroeDialog(
                      message:
                          "An unexpected error occurred while sending your message. Please try again later.",
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ContantUsCubit>().sendForm(
                              email: _emailController.text,
                              phone: _phoneController.text,
                              address: _addressController.text,
                              message: _messageController.text,
                            );
                      }
                    },
                    child: state is ContantUsLoading
                        ? SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          )
                        : Text(S.of(context).contact_us_send_button),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
