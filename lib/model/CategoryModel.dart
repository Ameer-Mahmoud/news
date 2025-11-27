class CategoryModel{
  String title;
  String imagePath;
  String id;
  CategoryModel({required this.title , required this.imagePath,required this.id});

  static List<CategoryModel> categories = [
    CategoryModel(
        title: "General", id: "general",
        imagePath: "assets/images/general.png"),
    CategoryModel(
        title: "Business", id: "business",
        imagePath: "assets/images/business.png"),
    CategoryModel(
        title: "Sports", id: "sports",
        imagePath: "assets/images/sports.png"),
    CategoryModel(
        title: "Technology", id: "technology",
        imagePath: "assets/images/technology.png"),
    CategoryModel(
        title: "Health", id: "health",
        imagePath: "assets/images/health.png"),
    CategoryModel(
        title: "Science", id: "science",
        imagePath: "assets/images/science.png"),
    CategoryModel(
        title: "Entertainment", id: "entertainment",
        imagePath: "assets/images/entertainment.png")
  ];
}