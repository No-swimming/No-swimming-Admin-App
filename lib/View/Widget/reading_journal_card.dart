import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/View/Screen/review_page.dart';
import 'package:no_swimming_admin_app/View/Widget/book_card.dart';
import 'package:no_swimming_admin_app/View/Widget/custom_button.dart';
import 'package:no_swimming_admin_app/View/Widget/check_popup_card.dart';
import 'package:no_swimming_admin_app/ViewModel/book_view_model.dart';
import 'package:no_swimming_admin_app/ViewModel/journal_view_model.dart';
import 'package:provider/provider.dart';

class ReadingJournalCard extends StatelessWidget {
  ReadingJournalCard(
      {Key? key,
      required this.title,
      required this.readingJournalType,
      required this.readingJournalId,
      required this.name,
      required this.profileNum,
      required this.bookIndex,
      required this.createdAt})
      : super(key: key);

  final String title, readingJournalType, name, createdAt;
  final int readingJournalId, profileNum, bookIndex;

  late BookViewModel viewModel;
  late JournalViewModel journalViewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<BookViewModel>(context, listen: false);
    journalViewModel = Provider.of<JournalViewModel>(context, listen: false);
    viewModel.getStudentChoiceBook(title);
    return Consumer<BookViewModel>(
      builder: (context, value, child) {
        return journalViewModel.journalList.length == value.bookList.length
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: const Color(0xffF2F2F2)),
                  color: Colors.white,
                ),
                width: 380.0.w,
                height: 205.0.h,
                child: Container(
                  margin: EdgeInsets.all(9.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BookCard(
                        title: title,
                        bookIndex: bookIndex,
                        author: value.bookList[bookIndex].items!.first.author
                            .toString(),
                        pubDate: value.bookList[bookIndex].items!.first.pubDate
                            .toString(),
                      ),
                      SizedBox(height: 8.0.h),
                      Row(
                        children: [
                          Text('제출일',
                              style: TextStyle(
                                  fontFamily: 'LINE Seed Sans KR',
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            ' $createdAt',
                            style: TextStyle(
                                fontFamily: 'LINE Seed Sans KR',
                                fontSize: 16.0.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0.h),
                      Row(
                        children: [
                          Text('제출 상태',
                              style: TextStyle(
                                  fontFamily: 'LINE Seed Sans KR',
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            "  $readingJournalType",
                            style: TextStyle(
                              fontFamily: 'LINE Seed Sans KR',
                              fontSize: 16.0.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0.h),
                      Row(
                        children: [
                          CustomButtom(
                            buttonText: '내용 열기',
                            width: 95.0,
                            height: 33.0,
                            backgroundColor: Colors.black,
                            fontSize: 14.0,
                            textColor: Colors.white,
                            func: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReviewPage(
                                  title: title,
                                  profileNum: profileNum,
                                  name: name,
                                  readingJournalId: readingJournalId,
                                  bookIndex: bookIndex,
                                  author: value
                                      .bookList[bookIndex].items!.first.author
                                      .toString(),
                                  pubDate: value
                                      .bookList[bookIndex].items!.first.pubDate
                                      .toString(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0.w),
                          CustomButtom(
                            buttonText: '마감으로 표시',
                            width: 120.0,
                            height: 33.0,
                            backgroundColor: const Color(0xffF2F2F2),
                            fontSize: 14.0,
                            textColor: Colors.black,
                            func: () => checkPopupCard(
                              context: context,
                              title: '마감으로 표시',
                              bodyText: '마감으로 표시된 뒤에는 독서록을 수정할 수 없습니다.',
                              func: () {
                                journalViewModel
                                    .closeUpJournal(readingJournalId);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}

void func() => debugPrint('함수 실행');
