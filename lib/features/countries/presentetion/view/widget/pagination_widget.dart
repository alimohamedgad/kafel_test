import 'package:flutter/material.dart';

import '../../cubit/countries_cubit.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
    required this.countriesCubit,
  });

  final CountriesCubit countriesCubit;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: countriesCubit.totalPage,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
              vertical: 12,
            ),
            child: Material(
              color: countriesCubit.currentPageIndex == index
                  ? Colors.green
                  : Colors.white,
              borderRadius: BorderRadius.circular(7),
              child: InkWell(
                onTap: () {
                  countriesCubit.updatePageIndex(index);
                  countriesCubit.getCountries(
                    pageindex: countriesCubit.currentPageIndex + 1,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: countriesCubit.currentPageIndex == index
                        ? Colors.green
                        : Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.5),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4),
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: countriesCubit.currentPageIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
