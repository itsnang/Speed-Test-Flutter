import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:speedtest_kh/app/shared/themes/styles/text_style.dart';
import 'package:speedtest_kh/constants/text_size.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(this.text, {super.key, this.textStyle});

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return textStyle != null
        ? Text(
            text,
            style: textStyle,
          )
        : Text(
            text,
            style: PtTextStyle.body(),
          );
  }

  static Text tiny(
    String text, {
    Color? color,
    TextAlign? textAlign,
    bool isBold = false,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: PtTextStyle.tiny(color: color, isBold: isBold),
    );
  }

  static Text caption(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    bool isBold = false,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: PtTextStyle.caption(color: color, isBold: isBold),
    );
  }

  static Text body(
    String text, {
    Color? color,
    TextAlign? textAlign,
    bool isBold = false,
    TextOverflow? overflow,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: PtTextStyle.body(color: color, isBold: isBold),
    );
  }

  static Text subtitle(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    bool isBold = false,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: PtTextStyle.subtitle(color: color, isBold: isBold),
    );
  }

  static Text title(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    bool isBold = false,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: PtTextStyle.title(color: color, isBold: isBold),
    );
  }

  static Text custom(
    String text, {
    Color? color,
    TextAlign? textAlign,
    bool isBold = false,
    double fontSize = TextSize.TEXT_SIZE_BODY,
    int? maxLines,
    bool isEllipsis = false,
    double? height,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: isEllipsis ? TextOverflow.ellipsis : null,
      style: PtTextStyle.custom(
        color: color,
        isBold: isBold,
        fontSize: fontSize,
        height: height,
      ),
    );
  }
}

extension HtmlExt on Text {
  Html toHtmlText({OnTap? onTap}) {
    final textStyle = style ?? PtTextStyle.body(isBold: true);
    return Html(
      data: data,
      onLinkTap: onTap,
      style: {
        'body': Style(
          color: textStyle.color,
          fontSize: FontSize(textStyle.fontSize!),
          fontFamily: textStyle.fontFamily,
          textAlign: textAlign,
          maxLines: maxLines,
          lineHeight: const LineHeight(1.2),
        ),
      },
    );
  }
}
