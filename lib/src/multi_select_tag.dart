import 'package:flutter/material.dart';

class MultiSelectTag extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;
  final Color tagColor;

  MultiSelectTag({this.label, this.tagColor, @required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: tagColor ?? Colors.lightBlue,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "$label",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: onRemove,
                child: Icon(
                  Icons.close,
                  color: Colors.black26,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
