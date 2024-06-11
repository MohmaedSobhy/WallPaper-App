import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_papper/Feature/add_text_layout/controller/add_text_layout_cubit.dart';

class SelectTextStyle extends StatelessWidget {
  const SelectTextStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTextLayoutCubit, AddTextLayoutState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: List.generate(
                AddTextLayoutCubit.instanse.fonts.length,
                (index) {
                  return TextFontItem(
                    isActive:
                        AddTextLayoutCubit.instanse.selectedTextStyle == index,
                    onTap: () {
                      AddTextLayoutCubit.instanse.changeTextStyle(index);
                    },
                    textStyle: AddTextLayoutCubit.instanse.fonts[index],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class TextFontItem extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final TextStyle textStyle;

  const TextFontItem(
      {super.key,
      required this.isActive,
      required this.onTap,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundColor:
              isActive ? Colors.white : Colors.black.withOpacity(0.5),
          child: Text(
            "Aa",
            style: textStyle.copyWith(
              fontSize: 20,
              color: isActive ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
