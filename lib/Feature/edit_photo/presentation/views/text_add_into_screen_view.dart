import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/add_text_layout/controller/add_text_layout_cubit.dart';

class TextAddToScreenView extends StatelessWidget {
  final VoidCallback onTap;

  const TextAddToScreenView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: AddTextLayoutCubit.instanse.top,
      left: AddTextLayoutCubit.instanse.left,
      child: InkWell(
        onDoubleTap: onTap,
        child: SizedBox(
            child: TextField(
          enabled: false,
          maxLines: 10,
          controller: AddTextLayoutCubit.instanse.textEditingController,
          style: AddTextLayoutCubit.instanse.textStyle.copyWith(
            color: AddTextLayoutCubit.instanse.texColor,
            fontSize: AddTextLayoutCubit.instanse.textFontSize,
            fontStyle: AddTextLayoutCubit.instanse.textFontStyle,
            fontWeight: AddTextLayoutCubit.instanse.textFontWeight,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        )),
      ),
    );
  }
}
