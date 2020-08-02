import 'package:flutter/material.dart';

class MultiSelectFieldListItem extends StatelessWidget {
  /// The label of the item
  ///
  /// Takes a String as parameter
  final String label;

  /// Defines whether an item is selected or not
  ///
  /// The default value is [false]
  final bool selected;

  /// The leading widget
  ///
  /// If null, nothing will be displayed
  final Widget leading;

  /// The method called when an unselected item is tapped
  /// The element is of type [VoidCallback]
  final VoidCallback onSelected;

  /// The style to apply on each label element
  final TextStyle labelStyle;

  MultiSelectFieldListItem({
    @required this.label,
    this.selected = false,
    @required this.onSelected,
    this.leading,
    this.labelStyle,
  }) : assert(leading != null && label != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (selected == false) onSelected();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: <Widget>[
              if(leading != null) CircleAvatar(),
              SizedBox(width: 10),
              Text(
                "$label",
                style: labelStyle ?? TextStyle(
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.black38 : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}