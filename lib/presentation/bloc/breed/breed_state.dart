part of 'breed_bloc.dart';

@freezed
class BreedState with _$BreedState {
  const factory BreedState.empty() = _Empty;
  const factory BreedState.loading() = _Loading;
  const factory BreedState.loaded(List<BreedModel> breeds) = _Loaded;
  const factory BreedState.error(String message) = _Error;
}
