import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/View/Widget/check_popup_card.dart';
import 'package:no_swimming_admin_app/View/Widget/reading_journal_card.dart';
import 'package:no_swimming_admin_app/ViewModel/book_view_model.dart';
import 'package:provider/provider.dart';
import 'package:no_swimming_admin_app/ViewModel/journal_view_model.dart';

class StudentDetailPage extends StatefulWidget {
  const StudentDetailPage(
      {Key? key,
      required this.studentName,
      required this.gradeNum,
      required this.classNum,
      required this.number,
      required this.profileNum,
      required this.userId})
      : super(key: key);

  final String studentName;
  final int gradeNum, classNum, number, userId, profileNum;

  @override
  State<StudentDetailPage> createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  late JournalViewModel viewModel;
  late BookViewModel bookViewModel;

  @override
  void dispose() {
    super.dispose();
    viewModel.journalList.clear();
    bookViewModel.bookList.clear();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<JournalViewModel>(context, listen: false);
    bookViewModel = Provider.of<BookViewModel>(context, listen: false);
    viewModel.searchJournalList(widget.userId);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(left: 20.0.w, top: 70.0.h, right: 20.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.number > 9
                  ? '${widget.studentName}(${widget.gradeNum}${widget.classNum}${widget.number})'
                  : '${widget.studentName}(${widget.gradeNum}${widget.classNum}0${widget.number})',
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
                Consumer<JournalViewModel>(
                  builder: (context, value, child) => Text(
                    " ${value.journalList.length}건",
                    style: TextStyle(
                        fontFamily: 'LINE Seed Sans KR',
                        fontSize: 30.0.sp,
                        color: const Color(0xff7F7F7F)),
                  ),
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
                child: Consumer<JournalViewModel>(
                  builder: (context, value, child) => ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: value.journalList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ReadingJournalCard(
                            title: value.journalList[index].title.toString(),
                            bookIndex: index,
                            readingJournalType: value
                                .journalList[index].readingJournalType
                                .toString(),
                            readingJournalId: value
                                .journalList[index].readingJournalId!
                                .toInt(),
                            name: widget.studentName,
                            createdAt:
                                value.journalList[index].createdAt.toString(),
                            profileNum: widget.profileNum,
                          ),
                          SizedBox(height: 12.0.h),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 183.0.w,
        height: 42.0.h,
        child: Consumer<JournalViewModel>(
          builder: (context, value, child) => ElevatedButton(
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
                  for (var a in value.journalList) {
                    list.add(a.readingJournalId!.toInt());
                  }
                  value.closeUpAllJournalList(list);
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
      ),
    );
  }

  void func() {
    debugPrint('함수 실행');
  }
}
