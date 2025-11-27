import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/remote/network/ApiManager.dart';
import '../../model/Articles/Article.dart';
import '../articles/ArticleItem.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  List<Article> results = [];
  bool isLoading = false;
  bool hasSearched = false;

  Future<void> search(String query) async {
    if (query.trim().isEmpty) return;

    setState(() {
      isLoading = true;
      hasSearched = true;
    });

    try {
      var response = await ApiManager.searchArticles(query);

      setState(() {
        results = response.articles ?? [];
      });
    } catch (e) {
      print("Search error: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [

            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Search for news...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onSubmitted: search,
            ),

            SizedBox(height: 16.h),

            if (isLoading)
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),

            if (!isLoading && !hasSearched)
              Expanded(
                child: Center(
                  child: Text(
                    "Search for anything...",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

            if (!isLoading && hasSearched && results.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

            if (!isLoading && results.isNotEmpty)
              Expanded(
                child: ListView.separated(
                  itemCount: results.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    return Articleitem(article: results[index]);
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
