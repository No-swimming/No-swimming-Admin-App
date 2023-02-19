import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:no_swimming_admin_app/provider/school_list_provider.dart';
import 'package:provider/provider.dart';

class SchoolRoomButton extends StatefulWidget {
  SchoolRoomButton({Key? key, required this.category}) : super(key: key);

  String category;

  @override
  State<SchoolRoomButton> createState() => _SchoolRoomButtonState();
}

class _SchoolRoomButtonState extends State<SchoolRoomButton> {
  @override
  Widget build(BuildContext context) {
    SchoolListProvider schoolListProvider =
        Provider.of<SchoolListProvider>(context, listen: true);

    return InkWell(
      onTap: () {
        setState(() {
          schoolListProvider.emptyRoomList();
          schoolListProvider.addSelectedRoomList(widget.category);
        });
      },
      child: Container(
        width: 50.0.w,
        height: 38.0.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(57)),
          border: Border.all(
              width: schoolListProvider.selectedRoom.contains(widget.category)
                  ? 2
                  : 1,
              color: schoolListProvider.selectedRoom.contains(widget.category)
                  ? Colors.black
                  : Colors.black12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                widget.category.toString(),
                style: TextStyle(
                    fontFamily: 'LINE Seed Sans KR',
                    color: schoolListProvider.selectedRoom
                            .contains(widget.category)
                        ? Colors.black
                        : const Color(0xff7F7F7F),
                    fontSize: 16.0.sp,
                    fontWeight: schoolListProvider.selectedRoom
                            .contains(widget.category)
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
