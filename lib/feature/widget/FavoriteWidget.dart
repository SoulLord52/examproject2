import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/consts/AppColors.dart';
import '../../core/model/NewsModel.dart';
class BookmarkWidget extends StatelessWidget {
  final List<Article> articles;

  const BookmarkWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: articles.length,
      itemBuilder: (_, int index) {
        final article = articles[index];

        return SizedBox(
          height: 190,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: article,
                  );
                },
                child: Container(
                  height: 140,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                article.urlToImage?.isNotEmpty == true
                                    ? article.urlToImage!
                                    : 'https://cdn-icons-png.flaticon.com/512/19005/19005357.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title ?? "No title",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.workSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'By ${article.author ?? "Unknown"}',
                                style: GoogleFonts.workSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColors.grey2,
                                ),
                              ),
                              SizedBox(height: 3),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      article.source?.name ?? "No name",
                                      style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: AppColors.blue,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  CircleAvatar(radius: 2),
                                  SizedBox(width: 5),
                                  Text(
                                    '${article.publishedAt?.minute ?? "0"}m ago' ,
                                    style: GoogleFonts.workSans(
                                      fontSize: 13,
                                      color: AppColors.grey2,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.more_horiz),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}