import 'package:examproject2/feature/widget/CustomErrorWidget.dart';
import 'package:examproject2/feature/widget/CustomLoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/consts/AppColors.dart';
import '../homescreen/HomeCubit.dart';
import '../homescreen/HomeState.dart';
import '../widget/FavoriteWidget.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Bookmarks",
          style: GoogleFonts.acme(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeErrorState) {
            return CustomErrorWidget(errorText: state.errorText);
          } else if (state is HomeLoadingState) {
            return LoadingWidget();
          } else if (state is HomeLoadedState) {
            if (state.bookmarked.isEmpty) {
              return Center(child: Text("No bookmarks yet", style: GoogleFonts.workSans(fontSize: 20, fontWeight: FontWeight.bold),));
            }

            return BookmarkWidget(articles: state.bookmarked);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
