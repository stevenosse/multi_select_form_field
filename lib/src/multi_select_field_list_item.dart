import 'package:flutter/material.dart';

class MultiSelectFieldListItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onSelected;

  MultiSelectFieldListItem({
    @required this.label,
    this.selected = false,
    @required this.onSelected,
  });

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
              CircleAvatar(),
              SizedBox(width: 10),
              Text(
                "$label",
                style: TextStyle(
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