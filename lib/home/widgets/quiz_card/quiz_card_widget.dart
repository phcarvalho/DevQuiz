import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final int totalQuestions;
  final int questionsAnswered;
  final VoidCallback onTap;

  QuizCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.totalQuestions,
    required this.questionsAnswered,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
        height: 177,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(image),
            ),
            Text(title, style: AppTextStyles.heading15),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text("${questionsAnswered} de ${totalQuestions}",
                      style: AppTextStyles.body11),
                ),
                Expanded(
                  flex: 3,
                  child: ProgressIndicatorWidget(
                      value: questionsAnswered / totalQuestions),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
