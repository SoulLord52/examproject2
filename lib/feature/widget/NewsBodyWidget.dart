import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/consts/AppColors.dart';
import '../../core/model/NewsModel.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.model});
  final NewsModel model;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      itemCount: model.articles.length > 10 ? 10 : model.articles.length,
      itemBuilder: (_, int index) {
        return SizedBox(
          height: 190,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/details', arguments: model.articles[index]);
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
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                model.articles[index].urlToImage?.isNotEmpty ==
                                    true
                                    ? model.articles[index].urlToImage!
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
                                model.articles[index].title,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.workSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'By ${model.articles[index].author ?? "Unknown"}',
                                style: GoogleFonts.workSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: AppColors.grey2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 3),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      model.articles[index].source.name,
                                      style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: AppColors.blue,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: AppColors.grey2,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '${model.articles[index].publishedAt.minute}m ago',
                                    style: GoogleFonts.workSans(
                                      fontWeight: FontWeight.w500,
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
              Spacer(),
              Divider(color: AppColors.grey),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}