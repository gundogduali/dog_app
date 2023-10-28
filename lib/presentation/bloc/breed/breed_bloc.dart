import 'package:bloc/bloc.dart';
import 'package:dog_app/core/usecases/usecase.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/domain/usecases/get_breeds_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_bloc.freezed.dart';
part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  BreedBloc(this._getBreeds) : super(const _Empty()) {
    on<BreedEvent>((event, emit) {
      event.map(
        fetcBreeds: (e) => _get(emit),
        refresh: (value) => _get(emit),
      );
    });
  }
  final GetBreedsUseCase _getBreeds;

  Future<void> _get(Emitter<BreedState> emit) async {
    emit(const BreedState.loading());
    final breeds = await _getBreeds.call(NoParams());
    emit(
      breeds.fold(
        (l) => const BreedState.error('error'),
        BreedState.loaded,
      ),
    );
  }
}
