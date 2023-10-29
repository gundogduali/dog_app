import 'package:dog_app/foundation/constants/size_constants.dart';
import 'package:dog_app/foundation/extensions/string_extensions.dart';
import 'package:dog_app/foundation/generated/locale_keys.g.dart';
import 'package:dog_app/presentation/bloc/text_field/text_field_bloc.dart';
import 'package:dog_app/presentation/components/states/app_sheet_textfield_state.dart';
import 'package:dog_app/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSheetTextField extends StatefulWidget {
  const AppSheetTextField({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  State<AppSheetTextField> createState() => _AppSheetTextFieldState();
}

class _AppSheetTextFieldState
    extends AppSheetTextFieldState<AppSheetTextField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldBloc, TextFieldState>(
      bloc: textFieldBloc,
      builder: (context, state) {
        var isFocused = false;
        state.when(
          focused: () {
            isFocused = true;
          },
          unfocused: () {
            isFocused = false;
          },
        );
        return DraggableScrollableSheet(
          snap: true,
          initialChildSize: isFocused ? .2 : .14,
          minChildSize: isFocused ? .2 : .14,
          maxChildSize: isFocused ? 1 : .14,
          builder: (context, scrollController) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    color: isFocused ? Colors.white : Colors.transparent,
                    borderRadius: isFocused
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(Sizes.k8),
                            topRight: Radius.circular(Sizes.k8),
                          )
                        : const BorderRadius.all(
                            Radius.circular(Sizes.k16),
                          ),
                    border: isFocused
                        ? Border.all(
                            color: AppColors.systemGray5Light,
                          )
                        : null,
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    physics: isFocused
                        ? const AlwaysScrollableScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    child: SizedBox(
                      height: constraints.maxHeight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isFocused)
                            Container(
                              height: 3,
                              width: 32,
                              margin: const EdgeInsets.symmetric(
                                vertical: Sizes.k8,
                              ),
                              color: AppColors.systemGray5Light,
                            ),
                          Expanded(
                            child: Padding(
                              padding: isFocused
                                  ? EdgeInsets.zero
                                  : const EdgeInsets.all(Sizes.k16),
                              child: TextField(
                                focusNode: focusNode,
                                onChanged: widget.onChanged,
                                expands: true,
                                maxLines: null,
                                textInputAction: TextInputAction.done,
                                textAlignVertical: TextAlignVertical.top,
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  hintText: LocaleKeys.search.translate,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
