import 'package:flutter/material.dart';

class DefaultDropDownButtonFormField<T> extends StatelessWidget {
  const DefaultDropDownButtonFormField({
    Key? key,
    required this.items,
    this.selectedItemBuilder,
    this.value,
    this.hint,
    this.disabledHint,
    this.onChanged,
    this.onTap,
    this.style,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.itemHeight,
    this.focusColor,
    this.focusNode,
    this.dropdownColor,
    this.decoration,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.menuMaxHeight,
    this.enableFeedback,
    this.elevation = 8,
    this.iconSize = 24.0,
    this.isDense = true,
    this.isExpanded = false,
    this.autofocus = false,
    this.alignment = AlignmentDirectional.centerStart
  }) : super(key: key);

  final List<DropdownMenuItem<T>>? items;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final dynamic value;
  final Widget? hint;
  final Widget? disabledHint;
  final void Function(dynamic)? onChanged;
  final void Function()? onTap;
  final int elevation;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double? itemHeight;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? dropdownColor;
  final InputDecoration? decoration;
  final void Function(dynamic)? onSaved;
  final String? Function(dynamic)? validator;
  final AutovalidateMode? autovalidateMode;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        items: items,
        selectedItemBuilder: selectedItemBuilder,
        value: value,
        hint: hint,
        disabledHint: disabledHint,
        onChanged: onChanged,
        onTap: onTap,
        style: style,
        icon: icon,
        iconDisabledColor: iconDisabledColor,
        iconEnabledColor: iconEnabledColor,
        itemHeight: itemHeight,
        focusColor: focusColor,
        focusNode: focusNode,
        dropdownColor: dropdownColor,
        decoration: decoration,
        onSaved: onSaved,
        validator: validator,
        autovalidateMode: autovalidateMode,
        menuMaxHeight: menuMaxHeight,
        enableFeedback: enableFeedback,
        elevation: elevation,
        iconSize: iconSize,
        isDense: isDense,
        isExpanded: isExpanded,
        autofocus: autofocus,
        alignment: alignment
    );
  }
}
