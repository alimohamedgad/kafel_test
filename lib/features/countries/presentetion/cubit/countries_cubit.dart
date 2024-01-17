import 'dart:developer';

import 'package:bloc/bloc.dart';
import '../../data/data_source/remote_countries_data_source.dart';

import '../../../../core/utils/api_constant.dart';
import '../../data/model/countries_model.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  final RemoteContriesDataSourceImp _contriesDataSourceImp;
  CountriesCubit(this._contriesDataSourceImp) : super(CountriesInitial());

  int currentPageIndex = 0;
  updatePageIndex(int index) {
    if (currentPageIndex == index) {
      return;
    }
    currentPageIndex = index;
    emit(UpdateCurrentPageIndex());
  }

  increamentPage(int length) {
    if (currentPageIndex == length) {
      return;
    }
    currentPageIndex += 1;
    emit(IncreamentPageState());
  }

  void decrementPage() {
    if (currentPageIndex > 0) {
      currentPageIndex--;
      emit(DecreamentPageState());
    }
  }

  List<CountriesModel> countriesList = [];
  int totalPage = 25;
  getCountries({required int pageindex}) {
    emit(GetCountriesLoadingState());
    _contriesDataSourceImp
        .get(endPoint: countriesEndPoint(pageindex))
        .then((result) {
      countriesList.clear();
      (result.data['data'] as List)
          .map((e) => countriesList.add(CountriesModel.fromMap(e)))
          .toList();

      print(countriesList.length);

      emit(GetCountriesSuccessState());
    }).catchError((e) {
      log(e.toString());
      emit(GetCountriesErrorState());
    });
  }
}
