import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:speedtest_kh/app/shared/themes/color_theme.dart';
import 'package:speedtest_kh/app/shared/themes/styles/button_style.dart';
import 'package:speedtest_kh/app/shared/widgets/text_widget.dart';
import 'package:speedtest_kh/constants/constant.dart';
import 'package:speedtest_kh/constants/enums/text_enum.dart';

class ButtonWidget {
  ButtonWidget._();

  static Widget text(
    String text, {
    Function()? onPressed,
    Color? textColor,
    double margin = 0,
    bool? isBold,
  }) {
    textColor ??= ColorTheme.grey900;
    isBold ??= false;
    return Padding(
      padding: EdgeInsets.all(margin),
      child: TextButton(
        onPressed: onPressed,
        child: TextWidget.body(
          text,
          color: textColor,
          isBold: isBold,
        ),
      ),
    );
  }

  static Widget outline(
    String text, {
    Function()? onPressed,
    Color? textColor,
    Color? backgroundColor,
    Color? borderColor,
    double margin = 0,
    TextSizeEnum fontSize = TextSizeEnum.subtitle,
    bool isFull = false,
    bool isBold = false,
    double borderRadius = Const.borderRadius,
    EdgeInsets? padding,
    bool isActive = false,
    Widget? icon,
  }) {
    borderColor ??= isActive ? ColorTheme.tertiary : ColorTheme.grey300;
    textColor ??= isActive ? ColorTheme.tertiary : ColorTheme.grey900;

    final textMapper = {
      TextSizeEnum.subtitle: TextWidget.subtitle,
      TextSizeEnum.title: TextWidget.title,
      TextSizeEnum.caption: TextWidget.caption,
      TextSizeEnum.body: TextWidget.body,
    };

    final Widget textWidget =
        textMapper[fontSize]!(text, color: textColor, isBold: isBold);

    return Padding(
      padding: EdgeInsets.only(
        left: margin,
        top: margin,
        bottom: margin,
        right: margin,
      ),
      child: icon == null
          ? TextButton(
              onPressed: onPressed,
              style: PtButtonStyle.outlineStyle(
                isFull: isFull,
                backgroundColor:
                    isActive ? ColorTheme.tertiaryLight : backgroundColor,
                borderColor: borderColor,
                borderRadius: borderRadius,
                padding: padding,
              ),
              child: textWidget,
            )
          : TextButton.icon(
              onPressed: onPressed,
              icon: isActive
                  ? const HeroIconTheme(
                      style: HeroIconStyle.solid,
                      child: HeroIcon(HeroIcons.star))
                  : icon,
              style: PtButtonStyle.outlineStyle(
                iconColor: ColorTheme.grey900,
                isFull: isFull,
                backgroundColor:
                    isActive ? ColorTheme.tertiaryLight : backgroundColor,
                borderColor: borderColor,
                borderRadius: borderRadius,
                padding: padding,
              ),
              label: textWidget,
            ),
    );
  }

  static Widget round(
    String text, {
    Function()? onPressed,
    Color? backgroundColor,
    Color? textColor,
    double margin = 0,
    Widget? icon,
    TextSizeEnum fontSize = TextSizeEnum.subtitle,
    bool isFull = false,
    bool isDisabled = false,
    bool? isBold,
    int? maxLines,
    double borderRadius = Const.borderRadius,
    EdgeInsets? padding,
  }) {
    textColor ??= ColorTheme.white;
    isBold ??= false;
    backgroundColor ??=
        isDisabled ? ColorTheme.primaryLight : ColorTheme.primaryColor;

    final textMapper = {
      TextSizeEnum.subtitle: TextWidget.subtitle,
      TextSizeEnum.title: TextWidget.title,
      TextSizeEnum.caption: TextWidget.caption,
      TextSizeEnum.body: TextWidget.body,
    };

    final Widget titleWidget =
        textMapper[fontSize]!(text, color: textColor, isBold: isBold);

    final Widget button;
    if (icon != null) {
      button = TextButton.icon(
        onPressed: isDisabled ? null : onPressed,
        style: PtButtonStyle.roundStyle(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          padding: padding,
          isFull: isFull,
        ),
        icon: icon,
        label: titleWidget,
      );
    } else {
      button = TextButton(
        onPressed: isDisabled ? null : onPressed,
        style: PtButtonStyle.roundStyle(
          backgroundColor: backgroundColor,
          isFull: isFull,
          borderRadius: borderRadius,
          padding: padding,
        ),
        child: titleWidget,
      );
    }

    return Padding(
      padding: EdgeInsets.only(
        left: margin,
        top: margin,
        bottom: margin,
        right: margin,
      ),
      child: button,
    );
  }
}
