import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../utill/app_color_resources.dart';

class CustomDropDown extends StatelessWidget {
  double? height;
  double? width;
  bool? advanced;
  String? hint;
  double?dropDownWidth;
  double?dropdownMaxHeight;
  double?itemHeight;
  List<String>? items;
  BoxDecoration? decoration;
  BoxDecoration? dropdownDecoration;
  String? selectedValue;
  TextStyle? hintStyle;
  double? fontSize;
  Color? textColor;
  Color? boxColor;
  Color? buttonBackground;
  Color? dropdownBoxBackground;
  TextStyle? selectedStyle;
  double? boxBorderRadius;
  double? paddingLeft;
  ValueChanged<String?>? onChanged;
  bool? isExpanded;

  CustomDropDown(
      {@required this.items,
        @required this.onChanged,
        @required this.selectedValue,
        this.advanced = false,
        this.selectedStyle,
        this.height,
        this.decoration,
        this.dropdownDecoration,
        this.dropDownWidth,
        this.itemHeight,
        this.buttonBackground,
        this.dropdownBoxBackground,
        this.hint,
        this.width,
        this.textColor,
        this.boxColor,
        this.fontSize,
        this.dropdownMaxHeight,
        this.boxBorderRadius,
        this.paddingLeft,
        this.hintStyle,
        this.isExpanded,
        Key? key})
      : super(key: key);

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          advanced == false
              ? DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: selectedStyle ??
                  TextStyle(
                      fontSize: fontSize ?? 16,
                      fontWeight: FontWeight.w400,
                      color: textColor ?? Color(0xFF666666)),
            ),
          )
              : DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: selectedStyle ??
                  TextStyle(
                      fontSize: fontSize ?? 16,
                      fontWeight: FontWeight.w400,
                      color: getColor(item)),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                //thickness: 1,
                color: boxColor ?? Colors.white,
              ),
            ),
        ],
      );
    }
    return _menuItems;
  }

  Color getColor(String value) {
    if (value.toLowerCase() == "paid") {
      return Color(0xFF33CC66);
    } else if (value.toLowerCase() == "pending") {
      return Color(0xFFECB409);
    } else if (value.toLowerCase() == "cancel") {
      return Color(0xFFED3E3E);
    } else {
      return Color(0xFF33CC66);
    }
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items!.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
          iconDisabledColor: AppColorResources.secondaryBlack,
          iconEnabledColor: AppColorResources.secondaryBlack,
          buttonDecoration: decoration ??
              BoxDecoration(
                //color: buttonBackground ?? Colors.white,
                //border: Border.all(color: Colors.grey.shade500),
                // border: Border.all(color: Color(0XFFDCDADA)),
                borderRadius: BorderRadius.circular(boxBorderRadius ?? 0),
              ),
          dropdownDecoration: dropdownDecoration ??
              BoxDecoration(
                color: dropdownBoxBackground ?? Colors.white,
                //border: Border.all(color:  Colors.grey.shade500),
                //  border: Border.all(color:  Color(0XFFDCDADA)),
                borderRadius: BorderRadius.circular(boxBorderRadius ?? 0),
              ),
          dropdownElevation: 8,
          //isExpanded: true,
          hint: Text(
            hint ?? 'Select Item',
            style: hintStyle ??
                TextStyle(
                  fontSize: fontSize ?? 16,
                  color: Color(0xFF666666),
                ),
          ),
          items: _addDividersAfterItems(items!),
          customItemsHeights: _getCustomItemsHeights(),
          dropdownWidth: dropDownWidth ?? 200,
          value: selectedValue,
          onChanged: onChanged,
          buttonHeight: height ?? 60,
          itemHeight: itemHeight ?? 50,
          dropdownMaxHeight: dropdownMaxHeight ?? 200,
          buttonWidth: width ?? 200,
          itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
        ));
  }
}
