import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/ViewModel/book_view_model.dart';
import 'package:provider/provider.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, required this.title, required this.bookIndex})
      : super(key: key);

  final String title;
  final int bookIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0xffF2F2F2),
      ),
      width: 362.0.w,
      height: 70.0.h,
      child: Padding(
        padding: EdgeInsets.all(4.0.r),
        child: Row(
          children: [
            Consumer<BookViewModel>(
                builder: (context, value, child) => Image.network(
                    value.book.items?[bookIndex].image.toString() ??
                        "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA0MjZfMTU5%2FMDAxNjgyNTA0MTU5NTQw.LF-cPalh36QjHEHiF9dn-9HXPIoOwGLjJZHXHR2LOqUg.PsG5jgbUB1RcFwOe9qySMG_21RVVBTkffH_S7ywdpVYg.JPEG.hyelstar030%2FIMG_2010.JPG&type=sc960_832",
                    width: 41.0.w,
                    height: 60.0.h)),
            Padding(
              padding: EdgeInsets.only(top: 9.0.h, left: 10.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0.sp,
                        fontFamily: 'LINE Seed Sans KR',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '앤디 위어 | 2021',
                    style: TextStyle(
                      fontSize: 16.0.sp,
                      fontFamily: 'LINE Seed Sans KR',
                      color: const Color(0xff7F7F7F),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
