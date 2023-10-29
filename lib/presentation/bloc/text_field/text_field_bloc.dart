import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_field_bloc.freezed.dart';
part 'text_field_event.dart';
part 'text_field_state.dart';

class TextFieldBloc extends Bloc<TextFieldEvent, TextFieldState> {
  TextFieldBloc() : super(const _Unfocused()) {
    on<TextFieldEvent>((event, emit) {
      event.map(
        started: (_) => emit(const _Unfocused()),
        focusChanged: (event) =>
            event.focus ? emit(const _Focused()) : emit(const _Unfocused()),
      );
    });
  }
}
