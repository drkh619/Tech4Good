import 'package:deaf_and_project/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
        title: Text('Feedback',style: GoogleFonts.poppins(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We\'d love to hear your feedback!',
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black

              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _feedbackController,
              decoration: InputDecoration(
                labelText: 'Your feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences, // Capitalize first letter of each sentence
              textInputAction: TextInputAction.done, // Change keyboard action to Done
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submitFeedback,
                // Disable the button if feedback submission is not allowed
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade300, // Change button color based on feedback submission allowance
                  elevation: 3, // Add some elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set button border radius
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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



  Future<void> _submitFeedback() async {
    final String url = '$ip_address/Deaf_and_Mute_project/feedback.php';

    // Send the feedback to the server
    final response = await http.post(
      Uri.parse(url),
      body: {
        'feedback': _feedbackController.text,
        'type':'User',
        'user':get_username,
        // Add any additional parameters needed for the API
      },
    );

    if (response.statusCode == 200) {
      // Handle successful feedback submission
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Feedback Submitted'),
            content: Column(
              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildLottieAnimation(),
                SizedBox(height: 16), // Add some space between the animation and text
                Text('Thank you for your feedback!'),
              ],
            ),
            contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 0), // Adjust content padding
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
            insetPadding: EdgeInsets.symmetric(horizontal: 40), // Adjust inset padding
          );
        },
      );
    } else {
      // Handle errors if any
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit feedback. Please try again later.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
Widget buildLottieAnimation() {
  return Container(
    height: 200, // Adjust the height as needed
    width: 200, // Adjust the width as needed
    child: Lottie.asset('assets/thanks.json'),
  );
}