import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/add_text_layout_cubit.dart';
import '../views/custome_dragable_text_field.dart';
import '../views/select_text_style.dart';

import '../views/select_text_color.dart';

class AddTextLayout extends StatelessWidget {
  const AddTextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AddTextLayoutCubit.instanse..initTextPosition(context),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.10),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: CustomeDragableTextField()),
            SelectTextStyle(),
            SizedBox(height: 10),
            SelectTextColorView(),
          ],
        ),
      ),
    );
  }
}
