import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import '../services/auth.dart';
import '../services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Reads all documments from the topics collection
  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var topics = data.map((d) => Topic.fromJson(d));
    return topics.toList();
  }

  /// Retrieves a single quiz document
  Future<Quiz> getQuiz(String quizId) async {
    var ref = _db.collection('quizzes').doc(quizId);
    var snapshot = await ref.get();
    return Quiz.fromJson(snapshot.data() ?? {});
  }

  Future<Quiz> getUserQuiz(String quizId) async {
    var user = AuthService().user!;
    var ref = _db
        .collection('userQuizzes')
        .doc(user.uid)
        .collection('quizzes')
        .doc(quizId);
    var snapshot = await ref.get();
    return Quiz.fromJson(snapshot.data() ?? {});
  }

  Future<Quiz> getUserQuizWithQuestion(String quizId) async {
    var user = AuthService().user!;
    var ref = _db
        .collection('userQuizzes')
        .doc(user.uid)
        .collection('quizzes')
        .doc(quizId);
    var snapshot = await ref.get();

    return Quiz.fromJson(snapshot.data() ?? {});
  }

  Future<void> createUserQuiz(Quiz quiz) async {
    var user = AuthService().user!;
    var ref = _db
        .collection('userQuizzes')
        .doc(user.uid)
        .collection('quizzes')
        .doc(quiz.id);
    var data = quiz.toJson();

    ref.set(data, SetOptions(merge: false));
  }

// work in this method later now using create quize method
  Future<void> addQuestionsToUserQuiz(
      String quiz_id, String text, List<Map<String, dynamic>> options) async {
    var user = AuthService().user!;
    var ref = _db
        .collection('userQuizzes')
        .doc(user.uid)
        .collection('quizzes')
        .doc(quiz_id);

    // print(questions_map.toString());

    // questions_map.forEach((e) => print(e));

    // var ds = {
    //   'text': text,
    //   'options': FieldValue.arrayUnion([options]),
    // };
    var qs = {
      'text': text,
      'options': options,
    };

    var data = {
      'questions': FieldValue.arrayUnion([qs]),
    };

    ref.set(data, SetOptions(merge: true));
  }

  /// Listens to current user's report document in Firestore
  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  Future<void> createTopic(Topic topic, String topic_id) async {
    var user = AuthService().user!;
    var ref = _db
        .collection('Usertopics')
        .doc(user.uid)
        .collection('tp')
        .doc(topic_id);

    var data = topic.toJson();
    ref.set(data, SetOptions(merge: false));
  }

  Future<void> updateUserTopic(Topic topic, Quiz quize) async {
    var user = AuthService().user!;
    var ref = _db
        .collection('Usertopics')
        .doc(user.uid)
        .collection('tp')
        .doc(topic.id);

    var QuizInfo = {
      "title": quize.title,
      "description": quize.description,
      "id": quize.id,
    };

    var data = {
      'quizzes': FieldValue.arrayUnion([QuizInfo])
    };
    ref.set(data, SetOptions(merge: true));
  }

  Future<List<Topic>> getUserTopic() async {
    var user = AuthService().user!;
    var ref = _db.collection('Usertopics').doc(user.uid).collection('tp');
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var topics = data.map((d) => Topic.fromJson(d));
    return topics.toList();
  }

  /// Updates the current user's report document after completing quiz
  Future<void> updateUserReport(Quiz quiz) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {
      'total': FieldValue.increment(1),
      'topics': {
        quiz.topic: FieldValue.arrayUnion([quiz.id])
      }
    };

    return ref.set(data, SetOptions(merge: true));
  }
}
