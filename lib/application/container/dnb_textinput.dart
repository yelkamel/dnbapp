import 'package:dnbapp/application/container/dnb_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DnbTextInput extends HookWidget {
  final String text;
  final String label;
  final String hintText;
  final bool obscureText;

  final void Function(String) onChanged;
  final void Function(String) onSubmitted;

  const DnbTextInput({
    this.text,
    this.label,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
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
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 5, top: 10),
            hintText: hintText,
            labelText: label,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(fontWeight: FontWeight.w400),
            counterText: '',
          ),
          maxLength: 30,
          controller: controller,
          onSubmitted: onSubmitted,
          textInputAction: TextInputAction.done,
          obscureText: obscureText,
        ),
      ),
    );
  }
}
