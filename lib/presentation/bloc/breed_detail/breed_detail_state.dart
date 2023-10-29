part of 'breed_detail_bloc.dart';

@freezed
class BreedDetailState with _$BreedDetailState {
  const factory BreedDetailState(
    {
      required BreedModel breed,
      required bool isLoading,
      required String imageUrl,
    }
  ) = _BreedDetailState;
}
