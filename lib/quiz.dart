import 'package:flutter/material.dart';
import 'dart:math';

class QuizScreen extends StatefulWidget {

  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizStarted = false;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Berlin', 'Madrid'],
      'answer': 'Paris',
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Mars', 'Earth', 'Jupiter', 'Venus'],
      'answer': 'Mars',
    },
    {
      'question': 'Which element has the chemical symbol H?',
      'options': ['Helium', 'Hydrogen', 'Iron', 'Oxygen'],
      'answer': 'Hydrogen',
    },
    {
      'question': 'What is the largest ocean on Earth?',
      'options': ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
      'answer': 'Pacific Ocean',
    },
    {
      'question': 'Who wrote "To Kill a Mockingbird"?',
      'options': ['Harper Lee', 'Mark Twain', 'Ernest Hemingway', 'J.K. Rowling'],
      'answer': 'Harper Lee',
    },
    {
      'question': 'What is the hardest natural substance on Earth?',
      'options': ['Gold', 'Iron', 'Diamond', 'Platinum'],
      'answer': 'Diamond',
    },
    {
      'question': 'What is the chemical symbol for gold?',
      'options': ['Au', 'Ag', 'Pb', 'Fe'],
      'answer': 'Au',
    },
    {
      'question': 'Which planet is known as the “Morning Star”?',
      'options': ['Venus', 'Mercury', 'Mars', 'Saturn'],
      'answer': 'Venus',
    },
    {
      'question': 'What is the smallest unit of matter?',
      'options': ['Atom', 'Molecule', 'Electron', 'Proton'],
      'answer': 'Atom',
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'options': ['Leonardo da Vinci', 'Vincent van Gogh', 'Pablo Picasso', 'Claude Monet'],
      'answer': 'Leonardo da Vinci',
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'options': ['Jupiter', 'Saturn', 'Uranus', 'Neptune'],
      'answer': 'Jupiter',
    },
    {
      'question': 'Which element is represented by the symbol O?',
      'options': ['Oxygen', 'Gold', 'Silver', 'Iron'],
      'answer': 'Oxygen',
    },
    {
      'question': 'In which year did the Titanic sink?',
      'options': ['1912', '1914', '1916', '1918'],
      'answer': '1912',
    },
    {
      'question': 'What is the largest mammal in the world?',
      'options': ['Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus'],
      'answer': 'Blue Whale',
    },
    {
      'question': 'Who is known as the father of modern physics?',
      'options': ['Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Niels Bohr'],
      'answer': 'Albert Einstein',
    },
    {
      'question': 'What is the capital of Japan?',
      'options': ['Tokyo', 'Kyoto', 'Osaka', 'Hiroshima'],
      'answer': 'Tokyo',
    },
    {
      'question': 'Which planet is closest to the sun?',
      'options': ['Mercury', 'Venus', 'Earth', 'Mars'],
      'answer': 'Mercury',
    },
  ];


  void _startQuiz() {
    setState(() {
      _quizStarted = true;
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  void _checkAnswer(String selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }

    setState(() {
      _currentQuestionIndex++;
    });

    if (_currentQuestionIndex >= min(10, _questions.length)) {
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Quiz Completed!'),
        content: Text('You scored $_score out of 10.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: Text('OK',style: TextStyle(fontSize: 20,color: Colors.black),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
         'Start Quiz',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        leading: Image.asset('assets/images/appbar-icon.png'),
        backgroundColor: Color(0xFF142A70),

      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: _quizStarted
            ? _currentQuestionIndex < min(10, _questions.length)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${_currentQuestionIndex + 1}. ${_questions[_currentQuestionIndex]['question'] as String}',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      ...(_questions[_currentQuestionIndex]['options']
                              as List<String>)
                          .map((option) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black,width: 1),
                                borderRadius: BorderRadius.circular(12),
                              )
                            )
                          ),
                          onPressed: () => _checkAnswer(option),
                          child: Text(option,style: TextStyle(fontSize: 15,color: Colors.black),),
                        );
                      }).toList(),
                    ],
                  )
                : Center(
                    child: Text(
                      'Quiz Completed!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  )
            : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://media.licdn.com/dms/image/C4E12AQF4dS37JFTB_w/article-inline_image-shrink_400_744/0/1573382382599?e=1727308800&v=beta&t=lG8f3Wk7HPDph3NKRfvFqQPpY_EKxmFS5MGeLPcSR7U',
                      width: 250,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _startQuiz,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green.shade800),
                      ),
                      child: Text('Start Now!',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
            ),
      ),
    );
  }
}
