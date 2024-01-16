// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kafel_project/features/services/presentetion/cubit/services_cubit.dart';

import '../widgets/service_item.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    context.read<ServicesCubit>().getServices();
    context.read<ServicesCubit>().getPopularServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Services'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Services',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 28),
            BlocBuilder<ServicesCubit, ServicesState>(
              builder: (context, state) {
                final serviceCubit = context.read<ServicesCubit>();
                return state is GetServicesLoading
                    ? SizedBox(
                        height: hight * 0.28,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox(
                        height: hight * 0.28,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: serviceCubit.serviceList.length,
                          itemBuilder: (context, index) {
                            return ServiceItem(
                              serviceModel: serviceCubit.serviceList[index],
                            );
                          },
                        ),
                      );
              },
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Popular Services',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<ServicesCubit, ServicesState>(
              builder: (context, state) {
                final serviceCubit = context.read<ServicesCubit>();

                return state is GetServicesLoading
                    ? SizedBox(
                        height: hight * 0.28,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SizedBox(
                        height: hight * 0.28,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: serviceCubit.servicePopularList.length,
                          itemBuilder: (context, index) {
                            return ServiceItem(
                              serviceModel:
                                  serviceCubit.servicePopularList[index],
                            );
                          },
                        ),
                      );
              },
            ),
          ],
        ));
  }
}
