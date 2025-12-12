import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/resources/ColorManager.dart';
import 'package:news/model/Articles/Article.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'ArticleDetails.dart';

class Articleitem extends StatelessWidget {

  final Article article;
  const Articleitem({super.key, required this.article});
  String _safeFormatDate(String? date) {
    try {
      return timeago.format(DateTime.parse(date ?? ""));
    } catch (_) {
      return "N/A";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        builder: (_) => ArticleDetails(article: article),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(2, 4),
            ),
          ],
          border: Border.all(
            color: ColorManager.lightPrimaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error, size: 30.sp)),
              ),
            ),

            SizedBox(height: 12.h),

            // TITLE
            Text(
              article.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w800,
                height: 1.3,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 8.h),

            // AUTHOR + DATE
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By: ${article.author ?? "Unknown"}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ),

                SizedBox(width: 8.w),

                Icon(Icons.access_time, size: 14.sp, color: Colors.grey),
                SizedBox(width: 4.w),

                Text(
                  _safeFormatDate(article.publishedAt),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
