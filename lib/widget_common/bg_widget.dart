import 'package:ShoeZapp/consts/consts.dart';

Widget bgWidget({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgBackground), fit: BoxFit.fill)),
    child: child,
  );
}
