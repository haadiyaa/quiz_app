class ModelQuiz {
  final String question;
  final List<String> options;
  final String answer;

  ModelQuiz({
    required this.question,
    required this.options,
    required this.answer,
  });
}

List<ModelQuiz> data = [
  ModelQuiz(
      question: '1. What is the capital of France?',
      options: ['Paris', 'London', 'Berlin', 'Madrid'],
      answer: 'Paris'),
  ModelQuiz(
      question: '2. What is the largest planet in our solar system?',
      options: ['Earth', 'Jupiter', 'Mars', 'Venus'],
      answer: 'Jupiter'),
  ModelQuiz(
      question: '3. What is the smallest country in the world?',
      options: ['Monaco', 'Vatican City', 'Maldives', 'Nauru'],
      answer: 'Vatican City'),
];
