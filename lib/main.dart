import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kafel_project/features/auth/presentetion/view/screen/login_screen.dart';
import 'features/auth/data/data_source/remote_user_data_source.dart';
import 'features/auth/presentetion/cubit/auth_cubit.dart';
import 'features/countries/data/data_source/remote_countries_data_source.dart';
import 'features/countries/presentetion/cubit/countries_cubit.dart';
import 'features/services/data/data_source/remote_services_data_source.dart';
import 'features/services/presentetion/cubit/services_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(RemoteUserDataSourceImp()),
        ),
        BlocProvider(
          create: (context) => ServicesCubit(RemoteServicesDataSourceImp()),
        ),
        BlocProvider(
          create: (context) => CountriesCubit(RemoteContriesDataSourceImp()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
