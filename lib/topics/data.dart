import '../services/models.dart';

Topic topic1 = Topic(
  description: 'description',
  id: '1',
  img: 'angular.png',
  title: 'Angular',
  quizzes: [
    Quiz(
      description: "Basics",
      id: 'id1',
      questions: [
        Question(
          text: "What is the proper way to refer to the Angular 2+ framework",
          options: [
            Option(
              correct: true,
              detail: 'Angular',
              value: 'value1',
            ),
            Option(
              correct: true,
              detail: "details1",
              value: 'value1',
            ),
          ],
        ),
        Question(text: "What is the next question")
      ],
      title: 'title1',
      topic: 'angular',
      video: 'no video',
    )
  ],
);
Topic topic2 = Topic(
  description: 'description2',
  id: '2',
  img: 'firebase.png',
  title: 'Firebase',
);
