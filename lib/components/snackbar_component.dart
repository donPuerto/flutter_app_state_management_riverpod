import 'package:flutter/material.dart';

class SnackbarComponent extends SnackBar {
  SnackbarComponent({
    Key? key,
    required String content,
    Duration? duration,
    SnackBarAction? action,
    SnackBarBehavior? behavior,
  }) : super(
          key: key,
          content: Text(content),
          duration: duration ?? const Duration(seconds: 3),
          action: action,
          behavior: behavior ?? SnackBarBehavior.floating,
        );
}
