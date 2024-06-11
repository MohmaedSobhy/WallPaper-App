import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_papper/Feature/add_text_layout/controller/add_text_layout_cubit.dart';

class SelectTextFontStyle extends StatelessWidget {
  const SelectTextFontStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTextLayoutCubit, AddTextLayoutState>(
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.format_italic_rounded,
                color: AddTextLayoutCubit.instanse.textFontStyle ==
                        FontStyle.italic
                    ? Colors.blue
                    : Colors.white,
              ),
              onPressed: () {
                AddTextLayoutCubit.instanse.changeFontStyle();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.format_bold_rounded,
                color: AddTextLayoutCubit.instanse.textFontWeight ==
                        FontWeight.bold
                    ? Colors.blue
                    : Colors.white,
              ),
              onPressed: () {
                AddTextLayoutCubit.instanse.changeFontWiegth();
              },
            ),
          ],
        );
      },
    );
  }
}
