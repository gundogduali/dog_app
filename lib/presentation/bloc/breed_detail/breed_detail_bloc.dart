import 'package:bloc/bloc.dart';
import 'package:dog_app/data/model/breed_model.dart';
import 'package:dog_app/domain/usecases/get_random_breed_image_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_detail_bloc.freezed.dart';
part 'breed_detail_event.dart';
part 'breed_detail_state.dart';

class BreedDetailBloc extends Bloc<BreedDetailEvent, BreedDetailState> {
  BreedDetailBloc(BreedModel breed, this._randomBreedImageUseCase)
      : super(
          _BreedDetailState(
            breed: breed,
            isLoading: false,
            imageUrl: breed.image,
          ),
        ) {
    on<BreedDetailEvent>((event, emit) {
      event.map(
        generate: (_) => _generate(),
      );
    });
  }
  final GetRandomBreedImageUseCase _randomBreedImageUseCase;

  Future<void> _generate() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final eitherResponse = await _randomBreedImageUseCase
        .call(GetRandomBreedImageParams(breedName: state.breed.name));

    eitherResponse.fold(
      (l) {
        emit(
          state.copyWith(
            isLoading: false,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            isLoading: false,
            imageUrl: r,
          ),
        );
      },
    );
  }
}
