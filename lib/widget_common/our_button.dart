import "package:ShoeZapp/consts/consts.dart";

Widget ourbutton({onpress, color, textcolor, String? title}) {
  return ElevatedButton(
      style:
          ElevatedButton.styleFrom(primary: color, padding: EdgeInsets.all(12)),
      onPressed: onpress,
      child: title!.text.color(textcolor).fontFamily(bold).make());
}
