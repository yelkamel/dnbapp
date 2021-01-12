import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DnbTextInput extends HookWidget {
  final TextEditingController controller;
  final String label;
  final void Function(String) onChanged;

  const DnbTextInput({this.controller, this.label, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DnbCard(
      child: SizedBox(
        height: 60,
        child: TextField(
          onChanged: onChanged,
          autofocus: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 5, top: 10),
            hintText: 'Modifier',
            labelText: label,
          ),
          controller: controller,
        ),
      ),
    );
  }
}
