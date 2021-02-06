import 'package:dnbapp/controller/radio_controller.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class DnbBadge extends StatelessWidget {
  final String badgeId;
  final Function onSelect;
  final bool imageOnly;
  final double size;
  const DnbBadge({
    Key key,
    this.badgeId,
    this.onSelect,
    this.imageOnly = true,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (badgeId == null) {
      return RawMaterialButton(
        onPressed: onSelect,
        constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
        padding: EdgeInsets.all(5),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Theme.of(context).accentColor),
          ),
          child: Icon(Icons.add),
        ),
      );
    }

    final badge =
        Get.find<RadioController>().badges.firstWhere((b) => b.id == badgeId);
    if (imageOnly) {
      return RawMaterialButton(
        onPressed: onSelect,
        constraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
        padding: EdgeInsets.all(5),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Theme.of(context).accentColor),
          ),
          child: ClipOval(
              child: Image.asset("assets/image/badge/${badge.id}.jpg")),
        ),
      );
    }

    return RawMaterialButton(
      onPressed: onSelect,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(width: 4, color: Theme.of(context).accentColor),
              ),
              child: ClipOval(
                child: Image.asset("assets/image/badge/${badge.id}.jpg"),
              ),
            ),
            Text(
              badge.name.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}
