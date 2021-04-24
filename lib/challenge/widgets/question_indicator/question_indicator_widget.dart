import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  QuestionIndicatorWidget(
      {Key? key, required this.currentPage, required this.totalPages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Questão $currentPage", style: AppTextStyles.body),
            Text("de $totalPages", style: AppTextStyles.body)
          ],
        ),
        SizedBox(
          height: 16,
        ),
        ProgressIndicatorWidget(value: currentPage / totalPages)
      ]),
    );
  }
}
