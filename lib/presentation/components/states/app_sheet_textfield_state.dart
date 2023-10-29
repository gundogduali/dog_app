import 'package:dog_app/presentation/bloc/text_field/text_field_bloc.dart';
import 'package:dog_app/presentation/components/app_sheet_textfield.dart';
import 'package:flutter/material.dart';

abstract class AppSheetTextFieldState<T> extends State<AppSheetTextField> {
  late final FocusNode focusNode;
  late final TextFieldBloc textFieldBloc;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textFieldBloc = TextFieldBloc();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.addListener(
        () {
          textFieldBloc
              .add(TextFieldEvent.focusChanged(focus: focusNode.hasFocus));
        },
      );
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    textFieldBloc.close();
    super.dispose();
  }
}
