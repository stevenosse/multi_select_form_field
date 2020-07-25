import 'package:flutter/material.dart';
import 'package:multiselect_form_field/src/multi_select_field_list_item.dart';
import 'package:multiselect_form_field/src/multi_select_tag.dart';

class MultiSelectFormField extends StatefulWidget {
  final Key key;
  /// The list of elements to display
  ///
  /// The element's map structure is :
  /// {
  ///   'display': value,
  ///   'value': value,
  ///   'isSelected': false
  /// }
  final List<Map<String, dynamic>> elementList;

  /// The color of the displayed tag color
  ///
  /// The default color is [Colors.lightBlue]
  final Color tagColor;

  /// The text to display when no element is selected
  ///
  /// The default text is ["No item selected yet"]
  final String emptyLabel;

  /// The List of elements builder method
  ///
  /// Can't be null
  final MultiSelectFieldListItem Function(Map<String, dynamic>) listItemBuilder;

  MultiSelectFormField({
    this.key,
    @required this.elementList,
    this.emptyLabel,
    this.tagColor,
    @required this.listItemBuilder,
  }) : super(key: key) {
    assert(this.elementList.length >= 2 && listItemBuilder != null);
  }

  @override
  MultiSelectFormFieldState createState() => MultiSelectFormFieldState();
}

class MultiSelectFormFieldState extends State<MultiSelectFormField> {
  /// Retrieve the list of selected elements
  get selectedElements =>
      widget.elementList.where((e) => e['isSelected'] == true).toList();

  /// Retrieve the list of unselected elements
  get unselectedElements =>
      widget.elementList.where((e) => e['isSelected'] == false).toList();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.3,
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Colors.black.withOpacity(0.15),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 55.0, left: 12.0, right: 12.0),
              child: ListView.builder(
                itemCount: widget.elementList.length,
                itemBuilder: (BuildContext context, int index) {
                  return widget.listItemBuilder(widget.elementList[index]);
                }
              ),
            ),
          ),
          _buildSelectedList(),
        ],
      ),
    );
  }

  _buildSelectedList() {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Wrap(
          children: <Widget>[
            ..._buildSelectedElementList(),
          ],
        ),
      ),
    );
  }

  _buildSelectedElementList() {
    final elementList =
        widget.elementList.where((e) => e['isSelected'] == true).toList();
    if (elementList.isEmpty) return [_buildEmptyLabel()];
    return elementList
        .map(
          (e) => MultiSelectTag(
            label: e['display'],
            tagColor: widget.tagColor,
            onRemove: () {
              widget.elementList.where((elt) => elt == e).first['isSelected'] =
                  false;
              setState(() {});
            },
          ),
        )
        .toList();
  }

  _buildEmptyLabel() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.emptyLabel ?? "No item selected yet",
          style: TextStyle(fontSize: 12.0, color: Colors.black38),
        ),
      ),
    );
  }
}