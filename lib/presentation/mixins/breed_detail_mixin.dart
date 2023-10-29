import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/presentation/widgets/breed_detail_dialog_widget.dart';
import 'package:flutter/material.dart';

mixin BreedDetailMixin<T extends StatefulWidget> on State<T> {
  Future<void> showBreedDetailDialog(BreedModel breed) async {
    return BreedDetailDialogWidget.show(context, breed: breed);
  }
}
