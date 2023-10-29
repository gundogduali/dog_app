part of 'breed_detail_bloc.dart';

@freezed
class BreedDetailEvent with _$BreedDetailEvent {
  const factory BreedDetailEvent.set(BreedModel breed) = _Set;
  const factory BreedDetailEvent.randomImage() = _RandomImage;
}
