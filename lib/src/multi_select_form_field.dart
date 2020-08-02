import 'package:flutter/material.dart';
import 'package:multiselect_form_field/src/multi_select_form_field_list_item.dart';
import 'package:multiselect_form_field/src/multi_select_form_field_item.dart';
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
  final List<MultiSelectFormFieldItem> elementList;

  /// The color of the displayed tag color
  ///
  /// The default color is [Colors.lightBlue]
  final Color tagColor;

  /// The text to display when no element is selected
  ///
  /// The default text is ["No item selected yet"]
  final String emptyLabel;

  MultiSelectFormField({
    this.key,
    @required this.elementList,
    this.emptyLabel,
    this.tagColor,
  }) : super(key: key) {
    assert(this.elementList.length >= 2);
  }

  @override
  MultiSelectFormFieldState createState() => MultiSelectFormFieldState();
}

class MultiSelectFormFieldState extends State<MultiSelectFormField> {
  /// Retrieve the list of selected elements
  get selectedElements =>
      widget.elementList.where((e) => e.isSelected == true).toList();

  /// Retrieve the list of unselected elements
  get unselectedElements =>
      widget.elementList.where((e) => e.isSelected == false).toList();

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
                  final element = widget.elementList[index];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.elementList[index].isSelected = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            if (element.leading != null) ...[
                              element.leading,
                              SizedBox(width: 5)
                            ],
                            if (element.label != null)
                              Expanded(
                                child: Text(
                                  element.label,
                                  style: element.labelStyle.apply(
                                    color: element.isSelected
                                        ? Colors.black45
                                        : element.labelStyle.color,
                                  ),
                                ),
                              ),
                            if (element.trailing != null) ...[
                              SizedBox(width: 5),
                              element.trailing,
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              ..._buildSelectedElementList(),
            ],
          ),
        ),
      ),
    );
  }

  _buildSelectedElementList() {
    final elementList =
        widget.elementList.where((e) => e.isSelected == true).toList();
    if (elementList.isEmpty) return [_buildEmptyLabel()];
    return elementList
        .map(
          (e) => MultiSelectTag(
            label: e.label,
            tagColor: widget.tagColor,
            onRemove: () {
              widget.elementList.where((elt) => elt == e).first.isSelected =
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
