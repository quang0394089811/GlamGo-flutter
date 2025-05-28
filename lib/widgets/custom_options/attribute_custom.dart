import 'package:flutter/material.dart';
import 'package:project_shop/gen/colors.gen.dart';

class AttributeCustom extends StatelessWidget {
  final dynamic name;
  final dynamic selectedAttribute;
  final void Function(String) onTap;

  const AttributeCustom({
    super.key,
    required this.name,
    required this.selectedAttribute,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = name == selectedAttribute;

    return GestureDetector(
      onTap: () => onTap(name),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: ColorName.grey53,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? ColorName.orange18 : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? ColorName.orange18 : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
