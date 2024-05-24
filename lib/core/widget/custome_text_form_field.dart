import 'package:flutter/material.dart';
import '../extension/context_extension.dart';

// ignore: must_be_immutable
class CustomeTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  // ignore: prefer_typing_uninitialized_variables
  var validator, onFieldSubmitted, onTap;
  CustomeTextFormField({
    super.key,
    this.validator,
    this.onFieldSubmitted,
    this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.search,
        onTap: onTap,
        autofocus: true,
        onFieldSubmitted: onFieldSubmitted,
        maxLines: 1,
        style: context.getTheme().textTheme.bodyLarge,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'e.g : nature',
        ),
      ),
    );
  }
}
