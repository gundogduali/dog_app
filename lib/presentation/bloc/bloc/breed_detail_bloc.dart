import 'package:bloc/bloc.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_detail_bloc.freezed.dart';
part 'breed_detail_event.dart';
part 'breed_detail_state.dart';

class BreedDetailBloc extends Bloc<BreedDetailEvent, BreedDetailState> {
  BreedDetailBloc()
      : super(
          _BreedDetailState(
            breed: BreedModel.empty(),
            isLoading: false,
            imageUrl: null,
          ),
        ) {
    on<BreedDetailEvent>((event, emit) {
      event.map(
        set: (e) => emit(
          state.copyWith(
            breed: e.breed,
            imageUrl: e.breed.image,
          ),
        ),
        randomImage: (_) => _randomImage(),
      );
    });
  }

  void _randomImage() {

  }
}
