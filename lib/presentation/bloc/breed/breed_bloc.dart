import 'package:bloc/bloc.dart';
import 'package:dog_app/core/usecases/usecase.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/domain/usecases/get_breeds_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_bloc.freezed.dart';
part 'breed_event.dart';
part 'breed_state.dart';

class BreedBloc extends Bloc<BreedEvent, BreedState> {
  BreedBloc(this._useCase) : super(const _Initial()) {
    on<BreedEvent>((event, emit) {
      event.map(
        fetch: (_) async => _fetchData(),
      );
    });
  }
  final GetBreedsUseCase _useCase;

  //TODO: check this emitter
  Future<void> _fetchData() async {
    emit(const BreedState.loading());
    final result = await _useCase.call(NoParams());
    result.fold(
      (l) => emit(const BreedState.error('error')),
      (r) => emit(BreedState.loaded(r)),
    );
  }
}
