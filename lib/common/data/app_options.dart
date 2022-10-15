/// 应用共享主图设置

import 'package:flutter/material.dart';

/// 语言设置
const systemLocaleOption = Locale('zh');
Locale? _deviceLocale;
Locale? get deviceLocale => _deviceLocale;
set deviceLocale(Locale? locale) {
  _deviceLocale ??= locale;
}

class AppOptions {
  const AppOptions({required this.theme, required Locale? local})
      : _locale = local;

  final MaterialColor theme;
  final Locale? _locale;

  Locale? get locale => _locale ?? deviceLocale;

  AppOptions copyWith({MaterialColor? theme, Locale? locale}) {
    return AppOptions(theme: theme ?? this.theme, local: locale ?? this.locale);
  }

  static AppOptions of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.currentModel;
  }

  static void update(BuildContext context, AppOptions newModel) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    scope.modelBindingState.updateModel(newModel);
  }
}

class ModelBinding extends StatefulWidget {
  const ModelBinding(
      {super.key, required this.initialModel, required this.child});

  final AppOptions initialModel;
  final Widget child;

  @override
  State<ModelBinding> createState() => _ModelBindingState();
}

class _ModelBindingState extends State<ModelBinding> {
  late AppOptions currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(AppOptions newModel) {
    if (currentModel != newModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ModelBindingScope(
      modelBindingState: this,
      child: widget.child,
    );
  }
}

class _ModelBindingScope extends InheritedWidget {
  const _ModelBindingScope(
      {required this.modelBindingState, required super.child});

  final _ModelBindingState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}
