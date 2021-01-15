import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DnbTextInput extends HookWidget {
  final String text;
  final String label;
  final String hintText;

  final void Function(String) onChanged;
  final void Function(String) onSubmitted;

  const DnbTextInput({
    this.text,
    this.label,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: text);

    return DnbCard(
      child: SizedBox(
        height: 60,
        child: TextField(
          onChanged: onChanged,
          autofocus: false,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 5, top: 10),
              hintText: hintText,
              labelText: label,
              counterText: ''),
          maxLength: 30,
          controller: controller,
          onSubmitted: onSubmitted,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
