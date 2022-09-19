import 'package:flutter/cupertino.dart';

import '../../services/services.dart';

class QuestionState with ChangeNotifier {
  final PageController controller = PageController();

  void nextPage() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
