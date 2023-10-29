// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:dog_app/core/usecases/usecase.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/domain/usecases/get_breeds_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_bloc.freezed.dart';
part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  BreedBloc(this._useCase) : super(const _Empty()) {
    on<BreedEvent>((event, emit) {
      event.map(
        fetch: (_) async => _fetchData(),
        search: (e) => search(e.text),
      );
    });
  }
  final GetBreedsUseCase _useCase;
  late final List<BreedModel> breeds;

  //TODO: check this emitter
  Future<void> _fetchData() async {
    emit(const BreedState.loading());
    final result = await _useCase.call(NoParams());
    result.fold(
      (l) => emit(const BreedState.error('error')),
      (r) {
        breeds = r;
        if (r.isEmpty) {
          emit(const BreedState.empty());
        } else {
          emit(BreedState.loaded(r));
        }
      },
    );
  }

  void search(String text) {
    if (text.isEmpty) {
      emit(BreedState.loaded(breeds));
    } else {
      final filtered = breeds.where(
        (element) => element.name.toLowerCase().contains(text.toLowerCase()),
      );
      if (filtered.isEmpty) {
        emit(const BreedState.empty());
        return;
      }
      emit(BreedState.loaded(filtered.toList()));
    }
  }
}
