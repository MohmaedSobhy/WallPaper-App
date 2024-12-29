import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/add_text_layout_cubit.dart';

class SelectFontSize extends StatelessWidget {
  const SelectFontSize({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTextLayoutCubit, AddTextLayoutState>(
      builder: (context, state) {
        return RotatedBox(
          quarterTurns: 3,
          child: Slider(
            min: 12,
            max: 60,
            activeColor: Colors.green,
            onChanged: (fontSize) {
              AddTextLayoutCubit.instanse.changeTextSize(fontSize);
            },
            value: AddTextLayoutCubit.instanse.textFontSize,
          ),
        );
      },
    );
  }
}
