import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_101/Data/Cubits/CountryCubit/country_with_cubit.dart';
import 'package:sports_101/Data/Cubits/LeaguesCubit/leagues_cubit.dart';
import 'package:sports_101/Data/Cubits/PlayersCubit/players_cubit.dart';
import 'package:sports_101/Data/Cubits/Teams_Cubit/teams_cubit.dart';
import 'package:sports_101/Data/Cubits/Top_Scorers_Cubit/top_scorers_cubit.dart';
import 'package:sports_101/UI/Screens/splash_screen.dart';

void main() {
  runApp(const Sports101());
}

class Sports101 extends StatelessWidget {
  const Sports101({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LeaguesCubit>(
          create: (context) => LeaguesCubit(),
        ),
        BlocProvider<CountryWithCubit>(
          create: (context) => CountryWithCubit(),
        ),
        BlocProvider<PlayersCubit>(
          create: (context) => PlayersCubit(),
        ),
        BlocProvider<TeamsCubit>(
          create: (context) => TeamsCubit(),
        ),
        BlocProvider<TopScorersCubit>(
          create: (context) => TopScorersCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.grey),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
