part of 'breed_bloc.dart';

@freezed
class BreedEvent with _$BreedEvent {
  const factory BreedEvent.fetcBreeds() = _Started;
  const factory BreedEvent.refresh() = _Refresh;
}
