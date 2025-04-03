import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _feedbackType;

  @override
  void dispose() {
    _feedbackController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      // Here you would typically send the feedback to your backend
      toast("Thank you for your feedback!");

      // Reset form
      _feedbackController.clear();
      _emailController.clear();
      setState(() {
        _feedbackType = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Send Feedback",
      appnavcolor: primaryColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "We'd love to hear from you!",
                style: boldTextStyle(size: 22),
              ),
              10.height,
              Text(
                "Your feedback helps us improve the app",
                style: secondaryTextStyle(),
              ),
              30.height,

              // Feedback Type Selection
              Text("Type of Feedback", style: boldTextStyle()),
              10.height,
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  "Suggestion",
                  "Bug Report",
                  "Complaint",
                  "Compliment",
                  "Other"
                ].map((type) {
                  return ChoiceChip(
                    label: Text(type),
                    selected: _feedbackType == type,
                    selectedColor: primaryColor,
                    labelStyle: TextStyle(
                      color: _feedbackType == type ? Colors.white : null,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        _feedbackType = selected ? type : null;
                      });
                    },
                  );
                }).toList(),
              ),
              20.height,

              // Feedback Field
              TextFormField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Your Feedback*",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your feedback';
                  }
                  return null;
                },
              ),
              20.height,

              // Email Field (Optional)
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email (Optional)",
                  hintText: "If you'd like us to follow up",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor),
                  ),
                ),
              ),
              30.height,

              // Submit Button
              AppButton(
                text: "SUBMIT FEEDBACK",
                textColor: Colors.white,
                color: primaryColor,
                onTap: _submitFeedback,
                width: context.width(),
              ),
              20.height,

              // Option to Rate in Play Store
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Love our app?"),
                  5.width,
                  GestureDetector(
                    onTap: () {
                      // Launch Play Store URL
                      // Example: "https://play.google.com/store/apps/details?id=your.package.name"
                      toast("Redirecting to Play Store");
                    },
                    child: Text(
                      "Rate us on Play Store",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}