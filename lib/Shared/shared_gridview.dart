import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_101/UI/Screens/players_screen.dart';

import '../Data/Cubits/Teams_Cubit/teams_cubit.dart';

TextEditingController _searchteam = TextEditingController();

class SharedGridView extends StatefulWidget {
  final int? leagueid;

  const SharedGridView({Key? key, this.leagueid}) : super(key: key);

  @override
  _SharedGridViewState createState() => _SharedGridViewState();
}

class _SharedGridViewState extends State<SharedGridView> {
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamsCubit, TeamsState>(
      builder: (context, state) {
        if (state is TeamsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TeamShow) {
          return Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _searchteam,
                  style: const TextStyle(color: Colors.white60),
                  onSubmitted: (value) {
                    context
                        .read<TeamsCubit>()
                        .getAllTeams(widget.leagueid!, value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search team',
                    hintStyle: const TextStyle(color: Colors.white60),
                    prefixIcon: const Icon(Icons.search, color: Colors.white60),
                    filled: true,
                    fillColor: const Color(0xFF1D1C21),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 10),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  itemCount: state.teamResponse.result!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayerScreen(
                                teamid:
                                    state.teamResponse.result![index].teamKey!),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  100 /
                                  392.7,
                              height: MediaQuery.of(context).size.height *
                                  100 /
                                  781.1,
                              child: CachedNetworkImage(
                                imageUrl: state.teamResponse.result![index]
                                            .teamLogo !=
                                        null
                                    ? state
                                        .teamResponse.result![index].teamLogo!
                                    : "https://apiv2.allsportsapi.com/logo/10464_karnataka.jpg",
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.sports_soccer_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                state.teamResponse.result![index].teamName ??
                                    "No Team Available!",
                                style: GoogleFonts.bebasNeue(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is TeamsFail) {
          _timer?.cancel();
          _timer = Timer(const Duration(seconds: 2), () {
            context.read<TeamsCubit>().getAllTeams(widget.leagueid!, '');
          });
          return Center(
            child: Text(
              "Not Found",
              style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xFFFFFFFF).withOpacity(0.8),
                  wordSpacing: 1.5),
            ),
          );
        } else {
          return Center(
            child: Text(
              "No Data Found",
              style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xFFFFFFFF).withOpacity(0.8),
                  wordSpacing: 1.5),
            ),
          );
        }
      },
    );
  }
}
