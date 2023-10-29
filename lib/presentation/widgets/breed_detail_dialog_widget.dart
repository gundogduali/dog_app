import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/presentation/bloc/bloc/breed_detail_bloc.dart';
import 'package:flutter/material.dart';

class BreedDetailDialogWidget extends StatefulWidget {
  const BreedDetailDialogWidget({required this.breed, super.key});
  final BreedModel breed;

  static Future<void> show(
    BuildContext context, {
    required BreedModel breed,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (_) => BreedDetailDialogWidget(breed: breed),
    );
  }

  @override
  State<BreedDetailDialogWidget> createState() =>
      _BreedDetailDialogWidgetState();
}

class _BreedDetailDialogWidgetState extends State<BreedDetailDialogWidget> {
  late final BreedDetailBloc _breedDetailBloc;
  BreedDetailBloc get breedDetailBloc => _breedDetailBloc;

  @override
  void initState() {
    super.initState();
    _breedDetailBloc = BreedDetailBloc();
    _breedDetailBloc.add(BreedDetailEvent.set(widget.breed));
  }

  @override
  void dispose() {
    _breedDetailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
