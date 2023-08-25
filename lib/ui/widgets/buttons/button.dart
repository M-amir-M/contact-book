import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppButton extends StatefulWidget {
  final double? width, height;
  final EdgeInsets? padding;
  final Color? color;
  final Color? disableColor;
  final bool isDisable;
  final Color? glowColor;
  final List<BoxShadow>? glow;
  final Widget child;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final VoidCallback onPressed;
  final bool isLoading;

  const AppButton({
    Key? key,
    this.padding,
    this.color,
    this.glowColor,
    this.glow,
    required this.child,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    required this.onPressed,
    this.disableColor,
    this.isDisable = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool get enable => (!widget.isDisable);

  bool get disable => !enable;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppButton oldWidget) {
    if (oldWidget != widget) {}
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final buttonTheme = Theme.of(context).buttonTheme;

    final buttonColor = _buildButtonColor(context);

    return Opacity(
      opacity: enable ? 1.0 : 0.4,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
          border: widget.border,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
            enableFeedback: false,
            onTap: enable && !widget.isLoading
                ? () {
                    widget.onPressed();
                  }
                : null,
            child: Container(
              height: widget.height ?? buttonTheme.height,
              width: widget.width ?? double.infinity,
              alignment: Alignment.center,
              padding: widget.padding ?? buttonTheme.padding,
              child: widget.isLoading
                  ? SpinKitDoubleBounce(
                      size: widget.height ?? 30,
                      color: Colors.white,
                    )
                  : DefaultTextStyle.merge(
                      child: widget.child,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Color _buildButtonColor(BuildContext context) {
    return enable
        ? widget.color ?? Theme.of(context).buttonTheme.colorScheme!.primary
        : widget.disableColor ??
            Theme.of(context).buttonTheme.colorScheme!.primary;
  }
}
