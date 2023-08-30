import 'package:flutter/material.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(
      {required WidgetBuilder builder,
      bool fullscreenDialog = false,
      RouteSettings? settings})
      : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder? _builder;

  @override
  Color? get barrierColor => Colors.black54;

  @override
  String? get barrierLabel => 'New Task Dialog';

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder!(context);
  }
}
