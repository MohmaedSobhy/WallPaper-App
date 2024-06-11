import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_papper/Feature/add_text_layout/controller/add_text_layout_cubit.dart';
import 'package:wall_papper/core/extension/context_extension.dart';

import 'custome_app_bar.dart';
import 'select_font_size.dart';

class CustomeDragableTextField extends StatelessWidget {
  const CustomeDragableTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTextLayoutCubit, AddTextLayoutState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              top: AddTextLayoutCubit.instanse.top,
              left: AddTextLayoutCubit.instanse.left,
              child: SizedBox(
                child: GestureDetector(
                  onPanUpdate: (details) {
                    AddTextLayoutCubit.instanse
                        .changeTextPosition(details, context);
                  },
                  child: TextField(
                    maxLines: 10,
                    controller:
                        AddTextLayoutCubit.instanse.textEditingController,
                    cursorColor: Colors.white,
                    autofocus: true,
                    decoration: const InputDecoration(border: InputBorder.none),
                    style: AddTextLayoutCubit.instanse.textStyle.copyWith(
                      color: AddTextLayoutCubit.instanse.texColor,
                      fontSize: AddTextLayoutCubit.instanse.textFontSize,
                      fontWeight: AddTextLayoutCubit.instanse.textFontWeight,
                      fontStyle: AddTextLayoutCubit.instanse.textFontStyle,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: context.getScreenHeight() * 0.058,
              left: 0,
              right: 0,
              child: const SizedBox(child: CustomeAppBarView()),
            ),
            Positioned(
              left: 15,
              bottom: 10,
              top: context.getScreenHeight() * 0.45,
              child: const SelectFontSize(),
            )
          ],
        );
      },
    );
  }
}
