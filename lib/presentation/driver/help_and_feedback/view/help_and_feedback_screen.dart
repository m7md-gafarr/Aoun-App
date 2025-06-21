import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpAndFeedbackScreen extends StatelessWidget {
  const HelpAndFeedbackScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: S.of(context).help_feedback_title),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: ListView(
          children: [
            Text(
              S.of(context).help_feedback_faqs_title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            ExpansionTile(
              leading: Icon(
                Icons.help_outline,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                S.of(context).help_feedback_how_to_use_question,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).help_feedback_how_to_use_answer,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              iconColor: Theme.of(context).primaryColor,
              leading: Icon(
                Icons.bug_report_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                S.of(context).help_feedback_report_problem_question,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).help_feedback_report_problem_answer,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.support_agent,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                S.of(context).help_feedback_contact_support_question,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).help_feedback_contact_support_answer,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.language,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                S.of(context).help_feedback_language_theme_question,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).help_feedback_language_theme_answer,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(
                Icons.shield_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                S.of(context).help_feedback_safety_info_question,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    S.of(context).help_feedback_safety_info_answer,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            DividerWidget(),
            Text(
              S.of(context).help_feedback_contact_support_title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(
                Icons.email_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                S.of(context).help_feedback_support_email,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                textDirection: TextDirection.ltr,
                S.of(context).help_feedback_support_phone,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16.sp,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
