import 'package:flutter/material.dart';

class MultiSelectFormFieldItem {
  /// The text to display on the list element
  ///
  /// Can't be [Null]
  String label;

  /// The value of the item, intended to be exploited later
  ///
  /// It's of type [dynamic], override it with the type you need.
  dynamic value;

  /// a boolean determining wether the element is selected or not
  ///
  /// default to [false]
  bool isSelected;

  /// The style to apply to the label of the list
  ///
  /// It's of type [TextStyle]
  final TextStyle labelStyle;

  final Widget leading;
  final Widget trailing;

  MultiSelectFormFieldItem({
    this.isSelected = false,
    this.value,
    this.leading,
    this.trailing,
    this.label,
    this.labelStyle = const TextStyle(fontSize: 14.0),
  });
}
