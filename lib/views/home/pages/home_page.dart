import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app/views/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc(homeRepository: context.read<HomeRepository>())
        ..add(HomeStarted()),
      child: Scaffold(
        backgroundColor: Constants.secondColor,
        appBar: const CustomAppBar(title: 'Home'),
        bottomNavigationBar: const BottomNavigation(),
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState?>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetList) {
                return SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(
                        bottom: 20, start: 20, end: 20),
                    child: Column(
                      children: [
                        Popular(popular: state.popular),
                        const Divider(
                            color: Constants.thirdColor,
                            thickness: 2,
                            height: 40),
                        Recommendations(recommendations: state.recommendations),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
