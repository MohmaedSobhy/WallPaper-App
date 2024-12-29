import 'package:flutter/material.dart';
import '../controller/add_text_layout_cubit.dart';

import 'select_text_align_view.dart';
import 'select_text_font_weigth.dart';

class CustomeAppBarView extends StatelessWidget {
  const CustomeAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SelectTextAlignView(),
        const SelectTextFontStyle(),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pop(
                context,
                AddTextLayoutCubit
                    .instanse.textEditingController.text.isNotEmpty);
          },
          child: const Text(
            'Done',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
