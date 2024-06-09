import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/widgets/custome_icon_button.dart';
import 'package:wall_papper/core/extension/context_extension.dart';
import '../controller/edit_photo_cubit.dart';

class EditPhotoOpacitySlider extends StatelessWidget {
  const EditPhotoOpacitySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.getScreenHeight() * 0.05,
      left: 15,
      child: BlocBuilder<EditPhotoCubit, EditPhotoState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: EditPhotoCubit.getInstanse().sliderVisiable,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: context.getScreenHeight() * 0.5,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Slider(
                        min: 0,
                        max: 0.99,
                        value: EditPhotoCubit.getInstanse().imageOpacity,
                        onChanged: (value) {
                          EditPhotoCubit.getInstanse()
                              .changeImageOpacity(value);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              CustomeIconButton(
                onTap: () {
                  EditPhotoCubit.getInstanse().visibilitySlider();
                },
                icon: CupertinoIcons.layers,
              ),
            ],
          );
        },
      ),
    );
  }
}
