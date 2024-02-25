import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:deaf_and_project/quiz_view.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class challenge extends StatefulWidget {
  @override
  _challengeState createState() => _challengeState();
}

class _challengeState extends State<challenge> {
  late Future<List<Map<String, dynamic>>> quizData;

  @override
  void initState() {
    super.initState();
    quizData = fetchQuizData();
  }

  Future<List<Map<String, dynamic>>> fetchQuizData() async {
    final response = await http.get(Uri.parse('$ip_address/Deaf_and_Mute_project/User/challenges.php'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load quiz data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: quizData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  children: snapshot.data!.map((quiz) {
                    return buildQuizCard(quiz);
                  }).toList(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildQuizCard(Map<String, dynamic>? quiz) {
    if (quiz == null) {
      return SizedBox(); // Return an empty container if quiz data is null
    }

    final String? question = quiz['question'];
    final String? image_url = quiz['image_url'];
    final String? option1 = quiz['option1'];
    final String? option2 = quiz['option2'];
    final String? answer = quiz['answer'];

    if (question == null || image_url == null || option1 == null || option2 == null || answer == null) {
      return SizedBox(); // Return an empty container if any essential data is null
    }

    return Column(
      children: [
        Container(
          child: QuizView(
            image: Image.network(image_url,width: 80,height: 80,),
            question: question,
            // options: [answer,option1,option2], // Ensure options are of type String
            onRightAnswer: () {
              // Alert(context: context, title: 'Right').show();
            },
            onWrongAnswer: () {
              Alert(context: context, title: 'Wrong!').show();
            }, height: 390, width: 260, rightAnswer: answer, wrongAnswers: [option1,option2],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

}

// class QuizView extends StatelessWidget {
//   final String question;
//   final List<String> options;
//   final Function()? onRightAnswer;
//   final Function()? onWrongAnswer;
//
//   const QuizView({
//     required this.question,
//     required this.options,
//     this.onRightAnswer,
//     this.onWrongAnswer,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           question,
//           style: TextStyle(color: Colors.white),
//         ),
//         SizedBox(height: 10),
//         Column(
//           children: options.map((option) {
//             return GestureDetector(
//               onTap: () {
//                 if (option == options.last) {
//                   if (onRightAnswer != null) onRightAnswer!();
//                 } else {
//                   if (onWrongAnswer != null) onWrongAnswer!();
//                 }
//               },
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   option,
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
