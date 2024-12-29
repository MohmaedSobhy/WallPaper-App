import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/add_text_layout_cubit.dart';

class SelectTextColorView extends StatelessWidget {
  const SelectTextColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTextLayoutCubit, AddTextLayoutState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 35, left: 10),
            child: Row(
              children: List.generate(
                  AddTextLayoutCubit.instanse.textAvailableColor.length,
                  (index) {
                return CricleColorItem(
                  isActive:
                      AddTextLayoutCubit.instanse.selectedTextColor == index,
                  color: AddTextLayoutCubit.instanse.textAvailableColor[index],
                  onTap: () {
                    AddTextLayoutCubit.instanse.changeColor(index);
                  },
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

class CricleColorItem extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final bool isActive;
  const CricleColorItem(
      {super.key,
      required this.color,
      required this.onTap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isActive ? Border.all(width: 5, color: Colors.blue) : null,
          ),
          child: CircleAvatar(
            backgroundColor: color,
            radius: 15,
          ),
        ),
      ),
    );
  }
}
