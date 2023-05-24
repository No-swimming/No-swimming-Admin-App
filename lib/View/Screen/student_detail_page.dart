import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/View/Widget/check_popup_card.dart';
import 'package:no_swimming_admin_app/View/Widget/reading_journal_card.dart';
import 'package:provider/provider.dart';
import 'package:no_swimming_admin_app/ViewModel/journal_view_model.dart';

class StudentDetailPage extends StatelessWidget {
  StudentDetailPage(
      {Key? key,
      required this.studentName,
      required this.gradeNum,
      required this.classNum,
      required this.number,
      required this.profileNum,
      required this.userId})
      : super(key: key);

  String studentName;
  int gradeNum, classNum, number, userId, profileNum;
  late JournalViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<JournalViewModel>(context);
    viewModel.searchJournalList(userId);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 20.0.w, top: 70.0.h, right: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              number > 9
                  ? '$studentName($gradeNum$classNum$number)'
                  : '$studentName($gradeNum${classNum}0$number)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'LINE Seed Sans KR',
                fontSize: 30.0.sp,
              ),
            ),
            Row(
              children: [
                Text(
                  '작성한 독서록',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LINE Seed Sans KR',
                    fontSize: 30.0.sp,
                  ),
                ),
                Text(
                  " ${viewModel.journalList.length}건",
                  style: TextStyle(
                      fontFamily: 'LINE Seed Sans KR',
                      fontSize: 30.0.sp,
                      color: const Color(0xff7F7F7F)),
                ),
              ],
            ),
            SizedBox(height: 20.0.h),
            const Divider(
              thickness: 1.5,
              color: Color(0xffBFBFBF),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: viewModel.journalList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ReadingJournalCard(
                          title: viewModel.journalList[index].title.toString(),
                          readingJournalType: viewModel
                              .journalList[index].readingJournalType
                              .toString(),
                          readingJournalId: viewModel
                              .journalList[index].readingJournalId!
                              .toInt(),
                          name: studentName,
                          profileNum: profileNum,
                        ),
                        SizedBox(height: 12.0.h),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 183.0.w,
        height: 42.0.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
              )),
          onPressed: () {
            checkPopupCard(
              context: context,
              title: '모두 마감으로 표시',
              bodyText: '마감으로 표시된 뒤에는 독서록을 수정할 수 없습니다.',
              func: () {
                List<int> list = List.empty(growable: true);
                for (var a in viewModel.journalList) {
                  list.add(a.readingJournalId!.toInt());
                }
                viewModel.closeUpAllJournalList(list);
              },
            );
          },
          child: Text(
            '모두 마감으로 표시',
            style:
                TextStyle(fontFamily: 'LINE Seed Sans KR', fontSize: 18.0.sp),
          ),
        ),
      ),
    );
  }

  void func() {
    debugPrint('함수 실행');
  }
}
