import 'package:ara_vnext/views/shared/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandedCard extends StatefulWidget {
  final Widget expandedItem;
  final Widget items;

  const ExpandedCard({
    Key key,
    @required this.expandedItem,
    @required this.items,
  }) : super(key: key);
  @override
  _ExpandedCardState createState() => _ExpandedCardState();
}

class _ExpandedCardState extends State<ExpandedCard> {
  final expandedHeight = 192.h;
  final collapedHeight = 72.h;

  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toggleExpanded();
      },
      child: AnimatedContainer(
        height: isExpanded ? expandedHeight : collapedHeight,
        duration: Duration(
          milliseconds: 300,
        ),
        curve: Curves.ease,
        padding: EdgeInsets.fromLTRB(
          17.w,
          13.8.h,
          0,
          18.6.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: AppColors.defaultShadow,
        ),
        child: Column(
          children: [
            widget.items,
            Visibility(
              visible: isExpanded,
              child: widget.expandedItem,
            ),
          ],
        ),
      ),
    );
  }
}
