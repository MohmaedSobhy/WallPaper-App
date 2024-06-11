import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/add_text_layout_cubit.dart';

class SelectTextAlignView extends StatelessWidget {
  const SelectTextAlignView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTextLayoutCubit, AddTextLayoutState>(
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.format_align_left_rounded,
                color: AddTextLayoutCubit.instanse.textAlign == TextAlign.left
                    ? Colors.blue
                    : Colors.white,
              ),
              onPressed: () {
                AddTextLayoutCubit.instanse.textAlignLeftPosition(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.format_align_center_rounded,
                color: AddTextLayoutCubit.instanse.textAlign == TextAlign.center
                    ? Colors.blue
                    : Colors.white,
              ),
              onPressed: () {
                AddTextLayoutCubit.instanse.textAlignCenterPosition(context);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.format_align_right_rounded,
                color: AddTextLayoutCubit.instanse.textAlign == TextAlign.right
                    ? Colors.blue
                    : Colors.white,
              ),
              onPressed: () {
                AddTextLayoutCubit.instanse.textAlignRightPosition(context);
              },
            ),
          ],
        );
      },
    );
  }
}
