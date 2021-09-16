import 'package:ara_vnext/views/shared/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Home Widget
class SearchInput extends StatelessWidget {
  const SearchInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45.h,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'search',
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                alignLabelWithHint: true,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        InkWell(
          child: Image.asset(
            AppImages.adjust,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
