part of 'text_field_bloc.dart';

@freezed
class TextFieldState with _$TextFieldState {
  const factory TextFieldState.focused() = _Focused;
  const factory TextFieldState.unfocused() = _Unfocused;
}
