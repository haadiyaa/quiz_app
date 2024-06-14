import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ui_task_6/model.dart';
import 'package:ui_task_6/quizprovider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizPro = Provider.of<QuizProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text(
          'Quiz',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height*0.5,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade700,
                ),
                child: Quiz(
                  qindex: quizPro.quizIndex,
                  question: quizPro.quizList,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  Quiz({
    super.key,
    required this.qindex,
    required this.question,
  });
  final int qindex;
  final List<ModelQuiz> question;
  String ans = '';

  @override
  Widget build(BuildContext context) {
    final quizPro = Provider.of<QuizProvider>(context, listen: false);
    return Consumer<QuizProvider>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question[qindex].question,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async {
                        ans = await quizPro.answer(qindex,question[qindex].options[index]);
                      },
                      child: Text(
                        question[qindex].options[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (ans != '')
              Text(
                'answer: $ans',
                style: const TextStyle(color: Colors.white),
              )
          ],
        );
      },
      // child:
    );
  }
}
