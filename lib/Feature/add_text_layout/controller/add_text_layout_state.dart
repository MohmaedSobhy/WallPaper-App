part of 'add_text_layout_cubit.dart';

@immutable
sealed class AddTextLayoutState {}

final class AddTextLayoutInitial extends AddTextLayoutState {}

final class ChangeTextColor extends AddTextLayoutState {}

final class ChangeTextPosition extends AddTextLayoutState {}

final class ChangeTextStyle extends AddTextLayoutState {}

final class ChangeTextSize extends AddTextLayoutState {}

final class ChangeTextAlign extends AddTextLayoutState {}

final class ChangeFontWeigth extends AddTextLayoutState {}

final class ChangeFontStyle extends AddTextLayoutState {}
