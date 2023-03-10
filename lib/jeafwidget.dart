import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///It creates a simple but functional button.
class JeaButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? hoverColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final void Function()? onTap;
  final void Function()? onLongPress;
  const JeaButton({
    super.key,
    required this.text,
    this.onTap,
    this.textColor,
    this.textStyle,
    this.hoverColor,
    this.backgroundColor,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      onLongPress: onLongPress ?? () {},
      hoverColor: hoverColor ?? Colors.blue[800],
      child: Container(
        color: backgroundColor ?? Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 21),
        child: Text(
          text,
          style: textStyle ??
              GoogleFonts.poppins(
                fontSize: 16,
                color: textColor ?? Colors.black,
              ),
        ),
      ),
    );
  }
}

///It creates a very stylish widget with Icon, Title and Text. It also has a clickable feature.
class JeaIconTitleText extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? iconColor;
  final IconData icon;
  final bool clickable;
  final TextStyle? textStyleTitle;
  final TextStyle? textStyleSubtitle;
  final void Function()? event;

  const JeaIconTitleText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.iconColor,
    this.subtitleColor,
    this.titleColor,
    required this.clickable,
    this.textStyleSubtitle,
    this.textStyleTitle,
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: clickable == true ? event ?? () {} : null,
        hoverColor: const Color(0xff1C2735),
        child: Container(
            //margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white24,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            width: 150,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: iconColor ?? Colors.white,
                  size: 25,
                ),
                const SizedBox(height: 13),
                Text(
                  title,
                  style: textStyleTitle ??
                      GoogleFonts.roboto(
                          color: titleColor ?? Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: textStyleSubtitle ??
                      GoogleFonts.roboto(
                        color: subtitleColor ?? Colors.white,
                        fontSize: 12,
                      ),
                ),
              ],
            )),
      ),
    );
  }
}

///If you need a splashScreen or standby screen this is for you!
class JeaLoading extends StatelessWidget {
  final Color? backgroundColor;
  final Color? progressColor;
  final String? logo;
  const JeaLoading({
    super.key,
    this.backgroundColor,
    this.progressColor,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              logo ?? "",
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  logo ?? "",
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/work-in-progress.png",
                      width: 100,
                      height: 100,
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: progressColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Creates a framed [TextField] with everything ready.
class JeaTextField extends StatelessWidget {
  final String labelText;

  /// 1 = normal
  /// </br>2 = parola
  /// </br>3 = email
  /// </br>4 = name
  /// </br>5 = phone
  final int type;
  final TextEditingController textfieldController;
  const JeaTextField({
    super.key,
    required this.textfieldController,
    required this.labelText,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return type == 1
        ? normal()
        : type == 2
            ? password()
            : type == 3
                ? email()
                : type == 4
                    ? name()
                    : type == 5
                        ? phone()
                        : normal();
  }

  Padding normal() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textfieldController,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white30),
          labelText: labelText,
          hintText: labelText,
          labelStyle: const TextStyle(color: Colors.white70),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.white70),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 105, 105, 105)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Padding password() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textfieldController,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
        obscureText: true,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white30),
          labelText: labelText,
          hintText: labelText,
          labelStyle: const TextStyle(color: Colors.white70),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.white70),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 105, 105, 105)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Padding email() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textfieldController,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white30),
          labelText: labelText,
          hintText: labelText,
          labelStyle: const TextStyle(color: Colors.white70),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.white70),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 105, 105, 105)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textfieldController,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white30),
          labelText: labelText,
          hintText: labelText,
          labelStyle: const TextStyle(color: Colors.white70),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.white70),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 105, 105, 105)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  Padding phone() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textfieldController,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white30),
          labelText: labelText,
          hintText: labelText,
          labelStyle: const TextStyle(color: Colors.white70),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.white70),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide:
                BorderSide(width: 1, color: Color.fromARGB(255, 105, 105, 105)),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

///Creates a simple but powerful mouse-selectable [Text] widget.
class JeaText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final double? fontSize;
  final Color? textColor;
  final Color? selectionColor;
  final bool? selectable;
  final TextAlign? textAlign;
  final double? marginAll;
  final TextStyle? style;
  final FontWeight? fontWeight;

  const JeaText({
    super.key,
    required this.text,
    this.selectable,
    this.textAlign,
    this.textColor,
    this.style,
    this.fontSize,
    this.fontWeight,
    this.marginAll,
    this.selectionColor,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    bool selectableText = selectable ?? false;
    return selectableText == false ? nonSelectable() : onSelectable();
  }

  Padding nonSelectable() {
    return Padding(
      padding: EdgeInsets.all(marginAll ?? 0),
      child: Text(
        text,
        maxLines: maxLines,
        selectionColor:
            selectionColor ?? const Color.fromARGB(83, 33, 149, 243),
        textAlign: textAlign ?? TextAlign.left,
        style: style ??
            TextStyle(
              color: textColor ?? Colors.black,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 14,
            ),
      ),
    );
  }

  Padding onSelectable() {
    return Padding(
      padding: EdgeInsets.all(marginAll ?? 0),
      child: SelectableText(
        text,
        maxLines: maxLines,
        cursorColor: selectionColor ?? const Color.fromARGB(83, 33, 149, 243),
        textAlign: textAlign ?? TextAlign.left,
        style: style ??
            TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 14,
            ),
      ),
    );
  }
}

///A stylish horizontal scroll view. This widget makes your kid scrollable in style.
class JeaHorizontalScrollView extends StatelessWidget {
  final Widget child;
  final bool? reverse = false;
  final EdgeInsetsGeometry? padding;
  final bool? primary;

  final ScrollPhysics? physics;
  final ScrollController? controller;
  final Clip clipBehavior = Clip.hardEdge;
  final String? restorationId;

  JeaHorizontalScrollView({
    super.key,
    required this.child,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.restorationId,
  });
  final localeController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return horizontal();
  }

  GestureDetector horizontal() {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        localeController.jumpTo(localeController.offset - details.delta.dx);
      },
      child: SingleChildScrollView(
        controller: controller ?? localeController,
        clipBehavior: clipBehavior,
        padding: padding,
        physics: physics,
        primary: primary,
        restorationId: restorationId,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 10),
            child,
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

///A stylish vertical scroll view. This widget makes your kid scrollable in style.
class JeaVerticalScrollView extends StatelessWidget {
  final Widget child;
  final bool? reverse = false;
  final EdgeInsetsGeometry? padding;
  final bool? primary;

  final ScrollPhysics? physics;
  final ScrollController? controller;
  final Clip clipBehavior = Clip.hardEdge;
  final String? restorationId;

  JeaVerticalScrollView({
    super.key,
    required this.child,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.restorationId,
  });
  final localeController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return vertical();
  }

  GestureDetector vertical() {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        localeController.jumpTo(localeController.offset - details.delta.dy);
      },
      child: SingleChildScrollView(
        controller: controller ?? localeController,
        clipBehavior: clipBehavior,
        padding: padding,
        physics: physics,
        primary: primary,
        restorationId: restorationId,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(height: 10),
            child,
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
