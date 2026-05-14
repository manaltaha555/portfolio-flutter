import 'package:flutter/material.dart';
import 'package:portfolio/data/models/form_model.dart';
import 'package:portfolio/presentation/widgets/social_widget.dart';
import 'package:portfolio/services/form_service.dart';
import '../../core/core.dart';
import '../widgets/hover_button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController message = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    message.dispose();
    super.dispose();
  }

  void clearAll() {
    name.clear();
    email.clear();
    message.clear();
  }

  Future<void> sendMessage(BuildContext context, FormModel formModel) async {
    final service = FormService();

    try {
      final response = await service.sendMessage(formModel);

      if (!context.mounted) return;

      if (response != null && response.statusCode == 200) {
        clearAll();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 10),
                const Expanded(child: Text("Message sent successfully 🚀")),
              ],
            ),
            backgroundColor: AppColors.accent,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.all(16),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.white),
                const SizedBox(width: 10),
                const Expanded(child: Text("Failed to send message ❌")),
              ],
            ),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.all(16),
          ),
        );
      }
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.wifi_off, color: Colors.white),
              const SizedBox(width: 10),
              const Expanded(child: Text("No internet connection 😢")),
            ],
          ),
          backgroundColor: Colors.deepOrange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.all(16),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _formSection(theme, true),
                SizedBox(height: 24),
                _infoSection(theme),
              ],
            ),
          );
        }

        return Row(
          children: [
            Expanded(child: _formSection(theme,false)),
            SizedBox(width: 32),
            Expanded(child: _infoSection(theme)),
          ],
        );
      },
    );
  }

  Widget _formSection(ThemeData theme, isColumn) {
    return Container(
      padding: EdgeInsets.all(isColumn? 16 :32),
      decoration: BoxDecoration(
        color: AppColors.bgGlass,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name", style: theme.textTheme.displayLarge),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: TextFormField(
                controller: name,
                validator: (value) =>
                    value == null || value.isEmpty ? "Please enter your name" : null,
              ),
            ),

            Text("Email", style: theme.textTheme.displayLarge),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: TextFormField(
                controller: email,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Please enter your email";
                  const emailRegex =
                      r"""^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$""";
                  if (!RegExp(emailRegex).hasMatch(value.trim())) {
                    return "Please enter valid email";
                  }
                  return null;
                },
              ),
            ),

            Text("Message", style: theme.textTheme.displayLarge),
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 16),
              child: TextFormField(
                controller: message,
                maxLines: 4,
                validator: (value) =>
                    value == null || value.isEmpty ? "Please enter your message" : null,
              ),
            ),

            HoverButton(
              text: "Send Message",
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final formModel = FormModel(
                    name: name.text,
                    email: email.text,
                    message: message.text,
                  );
                  await sendMessage(context, formModel);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            "Connect With Me",
            style: theme.textTheme.displayLarge,
          ),
        ),

        Text(
          "Feel free to reach out through any of these platforms. I'm always open to discussing new opportunities and collaborations!",
          style: theme.textTheme.bodyMedium,
        ),

        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Row(
            children: [
              SocialWidget(
                imgPath: "assets/icons/github.svg",
                socialLink: "https://github.com/manaltaha555",
              ),
              SocialWidget(
                imgPath: "assets/icons/linkedin.svg",
                socialLink:
                    "https://www.linkedin.com/in/manal-taha-sabry/",
              ),
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 32),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bgGlass,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Contact Information",
                  style: theme.textTheme.displayLarge,
                ),
              ),
              Text("📧 mnalth544@gmail.com", style: theme.textTheme.bodyMedium),
              Text("📱 +201060584564 - +201201526391",
                  style: theme.textTheme.bodyMedium),
              Text("📍 Alexandria, Egypt",
                  style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}