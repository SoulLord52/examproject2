import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/consts/AppColors.dart';
import '../widget/CetegoryWidget.dart';
import '../widget/CustomErrorWidget.dart';
import '../widget/CustomLoadingWidget.dart';
import '../widget/NewsBodyWidget.dart';
import 'HomeCubit.dart';
import 'HomeState.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Image.asset("assets/images/title.png",
          height: MediaQuery.of(context).size.height * 0.26,
          width: MediaQuery.of(context).size.width * 0.26,
          fit: BoxFit.contain,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Icon(CupertinoIcons.bell, size: 24),
          SizedBox(width: 10,),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15,),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                int index = 0;
                if (state is HomeLoadedState) {
                  index = state.index;
                }
                return Categories(
                  newIndex: index,
                  categories: ["Apple", "Tesla", "Top"],
                );
              },
            ),

            const SizedBox(height: 27),

            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeErrorState) {
                    return CustomErrorWidget(errorText: state.errorText);
                  } else if (state is HomeLoadingState) {
                    return LoadingWidget();
                  } else if (state is HomeLoadedState) {
                    return NewsWidget(model: state.newsModel);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
