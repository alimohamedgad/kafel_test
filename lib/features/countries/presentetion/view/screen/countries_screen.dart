import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/countries_cubit.dart';

import '../widget/pagination_widget.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    final cubitCountry = context.read<CountriesCubit>();
    cubitCountry.getCountries(pageindex: cubitCountry.currentPageIndex + 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          final countriesCubit = context.read<CountriesCubit>();

          return ListView(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xff2020201a),
                        spreadRadius: -5,
                        blurRadius: 40,
                        offset: Offset(0, 4)),
                  ],
                ),
                width: size.width * 0.95,
                height: size.height * 0.63,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Country'),
                        Text('Capital'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (state is GetCountriesLoadingState)
                      const Expanded(
                          child: Center(child: CircularProgressIndicator()))
                    else
                      Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(thickness: 0.2),
                            itemCount: countriesCubit.countriesList.length,
                            itemBuilder: (context, index) {
                              final itemCountry =
                                  countriesCubit.countriesList[index];
                              return Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              itemCountry.name,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 20),
                                          alignment: Alignment.center,
                                          child: Text(
                                            itemCountry.capital,
                                            style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      customIconArrow(
                        Icons.arrow_back_ios,
                        onTap: () {
                          countriesCubit.decrementPage();
                          countriesCubit.getCountries(
                            pageindex: countriesCubit.currentPageIndex - 1,
                          );
                        },
                      ),
                      customIconArrow(
                        Icons.keyboard_double_arrow_left_outlined,
                        onTap: () {},
                      ),
                      PaginationWidget(countriesCubit: countriesCubit),
                      customIconArrow(Icons.arrow_forward_ios, onTap: () {
                        countriesCubit
                            .increamentPage(countriesCubit.totalPage - 1);
                        countriesCubit.getCountries(
                          pageindex: countriesCubit.currentPageIndex + 1,
                        );
                      }),
                      customIconArrow(
                          Icons.keyboard_double_arrow_right_outlined,
                          onTap: () {}),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget customIconArrow(IconData iconData, {Function()? onTap}) {
    final size = MediaQuery.sizeOf(context);

    return Material(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: size.height * 0.045,
          width: size.width * 0.075,
          margin: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(6)),
          child: Center(
            child: Icon(
              iconData,
              size: 20,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }
}
