part of 'text_field_bloc.dart';

@freezed
class TextFieldEvent with _$TextFieldEvent {
  const factory TextFieldEvent.started() = _Started;
  const factory TextFieldEvent.focusChanged({required bool focus}) =
      _FocusChanged;
}
