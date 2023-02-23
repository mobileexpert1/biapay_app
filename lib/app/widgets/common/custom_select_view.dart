import 'package:auto_size_text/auto_size_text.dart';

import '../export_file.dart';

class CustomSelectView extends StatelessWidget {
  String? label, hint;
  TextEditingController? controller;
  Function? onTab;
  EdgeInsets? padding;

  CustomSelectView({this.padding,this.label, this.hint, this.controller, this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTab!();
      },
      child: itemSelectWidet(),
    );
  }

  itemSelectWidet() {
    return Container(
      padding: padding??EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5.r)),
      child: Row(
        children: [
          Expanded(
              child: Text(
            label ?? "",
            maxLines: 1,
            style: TextStyle(
                color: Colors.black,
                fontSize: 19.sp,
                fontWeight: FontWeight.w400),
          )),
          Icon(
            Icons.arrow_drop_down_sharp,
            size: 25.h,
          )
        ],
      ),
    );
  }
}
