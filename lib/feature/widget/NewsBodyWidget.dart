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
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: model.articles[index],
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
                          height: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                model.articles[index].urlToImage?.isNotEmpty ==
                                        true
                                    ? model.articles[index].urlToImage!
                                    : 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJQAnwMBIgACEQEDEQH/xAAbAAEBAQEBAQEBAAAAAAAAAAAAAQUEAwIGB//EADUQAAICAQEGAwQKAgMAAAAAAAABAgMEEQUSEyExUUFxkiIyVGEUFSMzNFNyc6GxUsFCg9H/xAAUAQEAAAAAAAAAAAAAAAAAAAAA/8QAFBEBAAAAAAAAAAAAAAAAAAAAAP/aAAwDAQACEQMRAD8A/uIAAAAAAAAAAAhQICkAFIAAAAFIAAAAoAAAAAAAAAAAAAAAABNQKDk+mqeYqKYb6XvyT5ROsAAAAAAAAAAABEyWe5LyZkbPwKMjFVlm/q2+kgNgGRk4uz8ZpWTt1fgpFxsPAyE+FOxtdU5c0BrAzZbOwo2Qrc7FOeu6t7roff1Rjd7PUB3g4PqjG72eofVGN3s9YHeZ+VkWZFrxcTr/AM7PCKOXgw47owNd/T27W9d1fI7ls2ngxq1morm9HpvPuwPbFxoY1ShBeb8Wz3MfLw6sWzHlXvaysSer1NcCkKQAUhQAAAAAD5s9yXkzi2P+Aj+p/wBnbZ93LyZx7G/Ax/VL+wMfaO99Nu3+uvLXsfWy245kJLlFJub7LQ3MnDoyWnbDVrxT0ZmbR4OJVwMeO7KfOb156dgOXJyp3ZTui2tH7HyRv4mRHJojbHx6rsz8ud+yMl1X8KXu2fw+4G+zNysizJseLi/9k/CKLk5E8mx42I9PCyzwideLjwxqlCteb8WBMXGrxq1Cteb8We4AGftb3sX91GgjP2t1xf3Ud4FAAAAARFAAAAD5s+7l5M49jfgY/ql/Z2Wfdy8mcex/wMf1S/sDqvtjTXKcuiR+YvtldbKyfWT18jQ21lOU1RB8o85eZmxi5zUYJyk3okvEBGLnJRim5Pol4nXXXw96uuS3tPtbfCC7ItcFWpQqkk9PtbvCC7I8L7oySqqTjVHov8n3YG1sqVEsdqiLW69Hr1fzZ05F0ceqVk+i/k/P7Pyfo2QpN+xL2ZeR97Ty/pNu7F/ZQ6fN9wO3Zu0HbbKu5rWT1h8vkaiPySej1XLyP0WzctZNCcvvI8pL/YHntbri/uo7zg2t1xf3Ud6ApCgAAAAIAKCACWe5LyZmYN3B2TvqLctWopd9TTlzi13RnVYmbTBQryK4x/SBkcG+ybfDscpPm91nVTU1vVUyW/p9ralqorsjp4mRkN41d2/+bbpokuyPZYmTV7OLZXXWvDTVt92Bl3Ockq6qpxqj0W69W+7PHhWflz9LNvg7R+Jr9I4O0fiq/QBicKz8ufpY4Vn5c/Szb4O0fia/QODtH4mv0gYnCs/Ln6WeuLK/HuVkK58uq3XzXY1uDtH4qv0jg7R+Kr9IHztGasjiTjro7E+ZpIzJYeXbOt3XQlGE1LlHQ0kBQAAAAAAAQFAEM7IvnmWPGxXpFfeW9vkjSPmMIw13YpavV6LqwPPHohj1KutJRX8nsfMnurV9F1PiNsJRhOMk4zfJrxA9QQ+YyUnJdno+QH2QDUCkBQIUACAoAgKAAAAAEAoIAJZzhJfJnEqLIcHcj7Lacl/i0up39SaAcePGcZ1+zNNJ8VyfJssq5zu0kpbjt1fPw3f/AE7CAcMa7IQi92cm69JpyfN6r/Wp5yVi0g09HKTS5rloufU0iSrjL3op+aA4YQlKUZKVjj7O5LR66fM70NEgBQAAAIBQAAAAEAAAAAUEAFIAABQAICgQoAEAKBAUAAAAAAAAAAAAAAAAAAAAAAAAAAAB/9k=',
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
                                model.articles[index].title ?? "No title",
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
                                      model.articles[index].source?.name ??
                                          "No name",
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
                                    '${model.articles[index].publishedAt?.minute ?? "0"}m ago',
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
