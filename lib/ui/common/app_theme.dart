import 'package:contact_book/ui/common/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

List<BoxShadow> defaultButtonBoxShadow(BuildContext context, {Color? color}) =>
    [
      BoxShadow(
        color: color ?? Theme.of(context).colorScheme.primary.withOpacity(0.5),
        offset: Offset(0, 0),
        blurRadius: 5.0,
        spreadRadius: 0,
      ),
    ];

List<BoxShadow> defaultCardBoxShadow(BuildContext context, {Color? color}) {
  return [
    BoxShadow(
      color: color ?? getShadowColor(context),
      offset: Offset(0, 2),
      blurRadius: 24.0,
      spreadRadius: 0.0,
    ),
  ];
}

Color getShadowColor(BuildContext context) {
  Color shadowColor = Get.isDarkMode ? Color(0x80000000) : Color(0x19000000);
  return shadowColor;
}

class AppThemeData {
  const AppThemeData._();

  static const Color skeletonBaseColor = Color(0xFF656871);
  static const Color skeletonHighlightColor = Color(0xff313236);

  static ThemeData darkThemeData({
    ColorScheme? colorScheme,
    Color? focusColor,
    Color? dividerColor,
    String? languageCode,
  }) =>
      themeData(
        colorScheme: colorScheme ?? AppColorData.darkColorScheme,
        focusColor: focusColor ?? AppColorData.darkFocusColor,
        dividerColor: dividerColor ?? AppColorData.darkDividerColor,
        languageCode: languageCode ?? "en",
        brightness: Brightness.dark,
      );

  static ThemeData lightThemeData({
    ColorScheme? colorScheme,
    Color? focusColor,
    Color? dividerColor,
    String? languageCode,
  }) =>
      themeData(
          colorScheme: colorScheme ?? AppColorData.lightColorScheme,
          focusColor: focusColor ?? AppColorData.lightFocusColor,
          dividerColor: dividerColor ?? AppColorData.lightDividerColor,
          languageCode: languageCode ?? "en",
          brightness: Brightness.light);

  static ThemeData themeData({
    ColorScheme? colorScheme,
    Color? focusColor,
    Color? dividerColor,
    String? languageCode,
    Brightness? brightness,
  }) {
    final _colorScheme = colorScheme ?? AppColorData.lightColorScheme;
    final _focusColor = focusColor ?? AppColorData.lightFocusColor;

    final textTheme = _AppTextThemeData.defaultTextTheme(_colorScheme);

    return ThemeData(
      brightness: brightness,
      colorScheme: _colorScheme,
      dividerColor: dividerColor,
      highlightColor: Colors.transparent,
      toggleableActiveColor: _colorScheme.primary,
      unselectedWidgetColor: _colorScheme.secondary,
      focusColor: _focusColor,
      canvasColor: _colorScheme.background,
      scaffoldBackgroundColor: _colorScheme.background,
      backgroundColor: _colorScheme.background,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        color: _colorScheme.surface,
        elevation: .3,
        iconTheme: IconThemeData(
          color: _colorScheme.onSurface,
        ),
      ),
      iconTheme: IconThemeData(
        color: _colorScheme.onSurface,
      ),
      dividerTheme: DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 1,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: _colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        titleTextStyle: textTheme.bodyText2?.copyWith(fontSize: 16),
        contentTextStyle: textTheme.caption?.copyWith(fontSize: 15),
      ),
      cardTheme: CardTheme(
        color: _colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIHelper.primaryRadius),
        ),
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _colorScheme.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIHelper.primaryRadius),
          borderSide: BorderSide(
            width: 1,
            color: _colorScheme.onSurface,
          ),
          gapPadding: 1,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIHelper.primaryRadius),
          borderSide: BorderSide(
            width: 1,
            color: _colorScheme.onSurface,
          ),
          gapPadding: 1,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIHelper.primaryRadius),
          borderSide: BorderSide(
            width: 1,
            color: _colorScheme.primary,
          ),
          gapPadding: 1,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIHelper.primaryRadius),
          borderSide: BorderSide(
            width: 1,
            color: _colorScheme.onSurface,
          ),
          gapPadding: 1,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIHelper.primaryRadius),
          borderSide: BorderSide(
            width: 1,
            color: _colorScheme.error,
          ),
          gapPadding: 1,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UIHelper.primaryRadius),
          borderSide: BorderSide(
            width: 1,
            color: _colorScheme.error.withOpacity(0.7),
          ),
          gapPadding: 1,
        ),
        errorStyle: textTheme.caption?.copyWith(
          fontSize: 12,
          color: _colorScheme.error.withOpacity(0.7),
        ),
        labelStyle: textTheme.subtitle1,
        hintStyle: textTheme.subtitle1,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        colorScheme: _colorScheme,
        height: 59,
        minWidth: 120,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          AppColorData.lightFillColor.withOpacity(0.80),
          AppColorData.darkFillColor,
        ),
        contentTextStyle:
            textTheme.subtitle2?.apply(color: AppColorData.darkFillColor),
      ),
    );
  }
}

class AppColorData {
  const AppColorData._();

  static const lightFillColor = Colors.black;
  static const darkFillColor = Colors.white;

  static Color lightFocusColor = Colors.black.withOpacity(0.12);
  static Color darkFocusColor = Colors.white.withOpacity(0.12);

  static const Color lightDividerColor = Color(0xffe0e0e0);
  static const Color darkDividerColor = Colors.white12;

  static const Color textFieldUnSelectedBorder = Color(0xFF424242);

  static const Color skeletonBaseColor = Color(0xFF424242);
  static const Color skeletonHighlightColor = Color(0xff616161);

  static const Color innerShadowTaskListColor = Color(0x66000000);

  /// for understanding color scheme spec checkout blow url
  /// https://material.io/design/color/the-color-system.html#
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF70CF98),
    secondary: Color(0xFF3B4240),
    background: Color(0xFF1A2421),
    surface: Color(0xFF26302C),
    error: Color(0xFFe51c23),
    onPrimary: darkFillColor,
    onSecondary: darkFillColor,
    onBackground: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    onError: darkFillColor,
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF14BD80),
    secondary: Color(0xFFFC4A4A),
    background: Color(0xFFE4E4E4),
    surface: Color(0xFFFFFFFF),
    error: Color(0xFFFF1525),
    onPrimary: Color(0xffFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onBackground: Color(0xFFFFFFFF),
    onSurface: Color(0xFF6E6E6E),
    onError: Color(0xFFFFFFF),
  );
}

class _AppTextThemeData {
  const _AppTextThemeData._();

  static const regular = FontWeight.w300;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;

  static TextTheme defaultTextTheme(ColorScheme scheme) => TextTheme(
        headline1: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 96,
          fontWeight: regular,
          letterSpacing: -1.5,
          color: scheme.onSurface,
        ),
        headline2: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 60,
          fontWeight: regular,
          letterSpacing: -0.5,
          color: scheme.onSurface,
        ),
        headline3: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 48,
          fontWeight: regular,
          color: scheme.onSurface,
        ),
        headline4: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 24,
          fontWeight: semiBold,
          letterSpacing: 0.25,
          color: scheme.onSurface,
        ),
        headline5: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 20,
          fontWeight: semiBold,
          color: scheme.onSurface,
        ),
        headline6: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 18,
          fontWeight: medium,
          letterSpacing: 0.15,
          color: scheme.onSurface,
        ),
        subtitle1: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 16,
          fontWeight: regular,
          color: scheme.onSurface,
        ),
        subtitle2: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 14,
          fontWeight: medium,
          color: scheme.onSurface,
        ),
        bodyText1: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 16,
          fontWeight: regular,
          letterSpacing: 0.25,
          color: scheme.onSurface,
        ),
        //Text Style 2
        bodyText2: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 14,
          fontWeight: regular,
          letterSpacing: 0.5,
          height: 1.8,
          color: scheme.onSurface,
        ),
        //Text Style 3
        button: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 14,
          fontWeight: medium,
          letterSpacing: 1.25,
          //card
          color: AppColorData.darkFillColor,
        ),
        //Text Style 5
        caption: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 12,
          fontWeight: regular,
          letterSpacing: 0.4,
          //brown_grey
          color: scheme.secondary,
        ),
        //Text Style 7
        overline: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 10,
          fontWeight: regular,
          letterSpacing: 1.5,
          //very_light_pink
          color: scheme.onSurface,
        ),
      );

}
