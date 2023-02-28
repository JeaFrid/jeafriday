import 'package:flutter/material.dart';

class JeaImageNetwork extends StatelessWidget {
  final String src;
  final double? height;
  final double? width;
  final Color? progressColor;
  const JeaImageNetwork({
    super.key,
    this.progressColor,
    required this.src,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      width: width ?? 100,
      height: height ?? 100,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          "assets/error.png",
          width: width ?? 100,
          height: height ?? 100,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        return SizedBox(
          width: width ?? 100,
          height: height ?? 100,
          child: CircularProgressIndicator(
            color: progressColor ?? Colors.amber,
          ),
        );
      },
    );
  }
}
