part of 'services_cubit.dart';

sealed class ServicesState {
  const ServicesState();
}

final class ServicesInitial extends ServicesState {}

final class GetServicesLoading extends ServicesState {}

final class GetServicesSuccess extends ServicesState {}

final class GetServicesError extends ServicesState {}
