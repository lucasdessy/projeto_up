import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ProjectPageSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minSize;
  final double maxSize;
  ProjectPageSliverHeaderDelegate({
    @required this.minSize,
    @required this.maxSize,
    @required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), child: child),
    );
  }

  @override
  double get maxExtent => maxSize;

  @override
  double get minExtent => minSize;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
