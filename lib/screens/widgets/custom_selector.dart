import 'package:flutter/material.dart';

class CustomOptionSelector extends StatefulWidget {
  final List<CustomOptionSelectorData> options;
  final Function(CustomOptionSelectorData?)? onOptionClicked;

  const CustomOptionSelector({
    super.key,
    required this.options,
    this.onOptionClicked,
  });

  @override
  State<CustomOptionSelector> createState() => _CustomOptionSelectorState();
}

class _CustomOptionSelectorState extends State<CustomOptionSelector> {
  String? optionSelected;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          children: List.generate(
            widget.options.length,
            (id) => Expanded(
              child: _buildRouteSelector(
                option: widget.options[id],
              ),
            ),
          ),
        ),
      );

  Widget _buildRouteSelector({
    required CustomOptionSelectorData option,
  }) =>
      GestureDetector(
        onTap: () => setState(() {
          optionSelected = option.id;
          widget.onOptionClicked?.call(option);
        }),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: option.leftBorder
                  ? const BorderSide(color: Colors.white)
                  : BorderSide.none,
              top: option.topBorder
                  ? const BorderSide(color: Colors.white)
                  : BorderSide.none,
              right: option.rightBorder
                  ? const BorderSide(color: Colors.white)
                  : BorderSide.none,
              bottom: option.bottomBorder
                  ? const BorderSide(color: Colors.white)
                  : BorderSide.none,
            ),
          ),
          child: Center(
            child: Text(
              option.text,
              style: TextStyle(
                color:
                    isOptionSelected(option) ? Colors.blueGrey : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  bool isOptionSelected(CustomOptionSelectorData option) =>
      option.id == optionSelected;
}

class CustomOptionSelectorData {
  final bool leftBorder;
  final bool topBorder;
  final bool rightBorder;
  final bool bottomBorder;
  final String text;
  final String id;

  CustomOptionSelectorData({
    required this.text,
    required this.id,
    this.leftBorder = true,
    this.topBorder = true,
    this.rightBorder = true,
    this.bottomBorder = true,
  });
}

class OptionData {
  final String id;
  final String text;

  OptionData(this.id, this.text);
}
