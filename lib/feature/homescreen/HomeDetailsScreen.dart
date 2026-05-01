import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/consts/AppColors.dart';
import '../../core/model/NewsModel.dart';
import '../widget/ShareWidget.dart';
import 'HomeCubit.dart';
import 'HomeState.dart';

final ShareService share = ShareService();

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.model});
  final Article model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios,size: 20,)),
        ),
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadedState) {
                final isSaved = state.bookmarked.contains(model);

                return IconButton(
                  onPressed: () {
                    context.read<HomeCubit>().toggleBookmark(model);
                  },
                  icon: Icon(
                    isSaved
                        ? CupertinoIcons.bookmark_fill
                        : CupertinoIcons.bookmark,
                    color: Colors.black
                  ),
                );
              }
              return Icon(
                CupertinoIcons.bookmark,
                color: AppColors.black,
              );
            },
          ),
          SizedBox(width: 20),
          GestureDetector(
            onTap: () async {
              await share.shareImage(
                text: 'Check these newest articles!',
                imageUrl:
                model.urlToImage ??
                    'https://cdn-icons-png.flaticon.com/512/19005/19005357.png',
              );
            },
            child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.share))
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    model.urlToImage ??
                        'https://cdn-icons-png.flaticon.com/512/19005/19005357.png',
                  ),
                  fit: BoxFit.cover
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'By ${model.author ?? 'Unknown'}',
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.grey2,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${model.publishedAt.minute}m ago',
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.grey2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  model.description ?? 'no comment',
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}