import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class XMargin extends StatelessWidget {
  const XMargin(
    this.x,
  );

  final double x;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x.w);
  }
}

class YMargin extends StatelessWidget {
  final double y;
  const YMargin(this.y, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y.h);
  }
}
