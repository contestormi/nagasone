import 'package:flutter/material.dart';
import 'package:nagasone/presentation/theme.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.callback,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(),
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              activeColor: AppColors.darkBlue,
              value: value,
              onChanged: null,
            ),
          ],
        ),
      ),
    );
  }
}
