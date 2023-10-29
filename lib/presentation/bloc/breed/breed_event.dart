part of 'breed_bloc.dart';

@freezed
class BreedEvent with _$BreedEvent {
  const factory BreedEvent.fetch() = _Fetch;
  const factory BreedEvent.search(String text) = _Search;
}
