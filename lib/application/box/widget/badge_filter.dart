import 'package:avatar_glow/avatar_glow.dart';
import 'package:dnbapp/application/container/dnb_badge.dart';
import 'package:dnbapp/controller/radio_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgeFilter extends StatelessWidget {
  final String selectedBadgeId;
  final Function(String) onSelect;
  const BadgeFilter({Key key, this.selectedBadgeId, this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radioCtrl = Get.find<RadioController>();

    return Wrap(
      children: [
        for (var badge in radioCtrl.badges)
          selectedBadgeId == badge.id
              ? AvatarGlow(
                  endRadius: 40.0,
                  child: DnbBadge(
                    onSelect: () {},
                    size: 50,
                    badgeId: badge.id,
                  ))
              : DnbBadge(
                  onSelect: () => onSelect(badge.id),
                  size: 40,
                  badgeId: badge.id,
                ),
      ],
    );
  }
}
