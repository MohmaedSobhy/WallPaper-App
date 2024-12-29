import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/extension/context_extension.dart';

part 'add_text_layout_state.dart';

class AddTextLayoutCubit extends Cubit<AddTextLayoutState> {
  List<Color> textAvailableColor = [
    Colors.white,
    Colors.grey,
    Colors.pink,
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.amber,
    Colors.orange,
  ];
  final List<TextStyle> fonts = [
    GoogleFonts.robotoMono(),
    GoogleFonts.smokum(),
    GoogleFonts.paletteMosaic(),
    GoogleFonts.hurricane(),
    GoogleFonts.redHatMono(),
    GoogleFonts.inconsolata(),
    GoogleFonts.bebasNeue(),
    GoogleFonts.dancingScript(),
    GoogleFonts.pacifico(),
    GoogleFonts.shadowsIntoLight(),
    GoogleFonts.indieFlower(),
  ];
  int selectedTextColor = 0, selectedTextStyle = 0;
  double textFontSize = 18;
  double left = 0, top = 0;
  Color texColor = Colors.white;
  TextStyle textStyle = GoogleFonts.robotoMono();
  TextAlign textAlign = TextAlign.center;
  FontStyle textFontStyle = FontStyle.normal;
  FontWeight textFontWeight = FontWeight.normal;
  TextEditingController textEditingController = TextEditingController();
  static AddTextLayoutCubit instanse = AddTextLayoutCubit._();

  AddTextLayoutCubit._() : super(AddTextLayoutInitial());

  void changeTextPosition(DragUpdateDetails details, BuildContext context) {
    left = max(0, details.delta.dx + left);
    top = max(
      context.getScreenHeight() * 0.09,
      min(
        details.delta.dy + top,
        context.getScreenHeight() * 0.7,
      ),
    );
    emit(ChangeTextPosition());
  }

  void initTextPosition(BuildContext context) {
    if (top == 0) {
      textAlignCenterPosition(context);
    }
  }

  void changeColor(int index) {
    selectedTextColor = index;
    texColor = textAvailableColor[index];
    emit(ChangeTextColor());
  }

  void changeTextStyle(int index) {
    selectedTextStyle = index;
    textStyle = fonts[index];
    emit(ChangeTextStyle());
  }

  void changeTextSize(double value) {
    textFontSize = value;
    emit(ChangeTextSize());
  }

  void textAlignCenterPosition(BuildContext context) {
    textAlign = TextAlign.center;
    top = context.getScreenHeight() / 2 - 50; // Center vertically
    left = context.getScreenWidth() / 2 - 50;
    emit(ChangeTextAlign());
  }

  void textAlignLeftPosition(BuildContext context) {
    textAlign = TextAlign.left;
    top = context.getScreenHeight() / 2 - 50;
    left = 0;
    emit(ChangeTextAlign());
  }

  void textAlignRightPosition(BuildContext context) {
    textAlign = TextAlign.right;
    top = context.getScreenHeight() / 2 - 50;
    left = context.getScreenWidth() - 100;
    emit(ChangeTextAlign());
  }

  void changeFontWiegth() {
    if (textFontWeight == FontWeight.bold) {
      textFontWeight = FontWeight.normal;
    } else {
      textFontWeight = FontWeight.bold;
    }
    emit(ChangeFontWeigth());
  }

  void changeFontStyle() {
    if (textFontStyle == FontStyle.italic) {
      textFontStyle = FontStyle.normal;
    } else {
      textFontStyle = FontStyle.italic;
    }
    emit(ChangeFontStyle());
  }
}
