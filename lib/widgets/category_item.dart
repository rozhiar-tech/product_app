import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String title;
  final Function(String) onSelect;

  const CategoryItem({
    required this.title,
    required this.onSelect,
  });

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onSelect(widget.title);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: _isSelected ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: _isSelected ? 14 : 12,
            fontWeight: FontWeight.bold,
            color: _isSelected ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
}
