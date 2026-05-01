import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/consts/AppColors.dart';
import '../homescreen/HomeCubit.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.categories,
    required this.newIndex,
  });
  final List<String> categories;
  final int newIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () {
              context.read<HomeCubit>().tapIndex(index);
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: newIndex == index ? AppColors.black : AppColors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              child: Text(
                categories[index],
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: newIndex == index ? AppColors.white : AppColors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}