part of 'countries_cubit.dart';

sealed class CountriesState {
  const CountriesState();
}

final class CountriesInitial extends CountriesState {}

final class UpdateCurrentPageIndex extends CountriesState {}

final class IncreamentPageState extends CountriesState {}

final class DecreamentPageState extends CountriesState {}

final class GetCountriesLoadingState extends CountriesState {}

final class GetCountriesSuccessState extends CountriesState {}

final class GetCountriesErrorState extends CountriesState {}
