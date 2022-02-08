import 'package:flutter/cupertino.dart';

class ListItemExposeManager {
  bool isExpose = false;
  GlobalKey listItemViewKey;
  GlobalKey scrollViewKey;
  Function(bool isExpose) exposeChangeCallback;
  ScrollController scrollViewController;

  /// Be attention, not every widget will mapping to RenderObject, Element.
  /// Sometime the widget is just constraint, Change another widget to set key if RenderObject is null.
  ListItemExposeManager(this.listItemViewKey, this.scrollViewKey,
      this.scrollViewController, this.exposeChangeCallback) {
    scrollViewController.addListener(() => updateStatus());
    WidgetsBinding.instance?.addPostFrameCallback((_) => updateStatus());
  }

  void updateStatus() {
    RenderObject? renderObject =
        listItemViewKey.currentContext?.findRenderObject();
    if (renderObject is! RenderBox) {
      return;
    }
    RenderBox listItemRenderBox = renderObject;
    Offset listItemPosition = listItemRenderBox.localToGlobal(Offset.zero);
    Size listItemSize = listItemRenderBox.size;
    if (listItemPosition == null || listItemSize == null) {
      return;
    }

    RenderObject? scrollViewRenderObject =
        scrollViewKey.currentContext?.findRenderObject();
    if (scrollViewRenderObject is! RenderBox) {
      return;
    }
    RenderBox scrollViewRenderBox = scrollViewRenderObject;
    Offset scrollViewPosition = scrollViewRenderBox.localToGlobal(Offset.zero);
    Size scrollViewSize = scrollViewRenderBox.size;
    if (scrollViewPosition == null || scrollViewSize == null) {
      return;
    }

    double minScrollDy = listItemPosition.dy +
        listItemSize.height -
        scrollViewPosition.dy -
        scrollViewSize.height;

    bool afterListView = minScrollDy > 0;
    bool beforeListView = listItemPosition.dy + listItemSize.height < scrollViewPosition.dy;
    bool currentIsExpose = !beforeListView && !afterListView;

    if (currentIsExpose != isExpose) {
      exposeChangeCallback(currentIsExpose);
    }
    isExpose = currentIsExpose;
  }

}
