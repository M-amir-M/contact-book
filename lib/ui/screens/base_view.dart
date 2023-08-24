import 'package:contact_book/core/locator.dart';
import 'package:contact_book/core/viewmodels/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;

  BaseView({
    required this.builder,
    this.onModelReady,
    this.onModelDispose,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {

          widget.onModelReady!(model);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (_) => model, child: Consumer<T>(builder: widget.builder));
  }

  @override
  void dispose() {
    if (widget.onModelDispose != null) widget.onModelDispose!(model);
    super.dispose();
  }
}
