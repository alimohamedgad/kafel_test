import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafel_project/features/services/data/data_source/remote_services_data_source.dart';
import 'package:kafel_project/features/services/data/model/services_model.dart';

import '../../../../core/utils/api_constant.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final RemoteServicesDataSource _servicesDataSource;
  ServicesCubit(this._servicesDataSource) : super(ServicesInitial());
  List<ServiceModel> serviceList = [];
  getServices() {
    emit(GetServicesLoading());
    _servicesDataSource.get(endPoint: servicesEndPoint).then((result) {
      (result.data['data'] as List)
          .map((e) => serviceList.add(ServiceModel.fromMap(e)))
          .toList();
      emit(GetServicesSuccess());
    }).catchError((e) {
      log(e.toString());
      emit(GetServicesError());
    });
  }

  List<ServiceModel> servicePopularList = [];

  getPopularServices() {
    emit(GetServicesLoading());
    _servicesDataSource.get(endPoint: servicesPopularEndPoint).then((result) {
      (result.data['data'] as List)
          .map((e) => servicePopularList.add(ServiceModel.fromMap(e)))
          .toList();
      emit(GetServicesSuccess());
    }).catchError((e) {
      log(e.toString());
      emit(GetServicesError());
    });
  }
}
