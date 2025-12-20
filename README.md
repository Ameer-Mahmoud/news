📰 Newsly – Flutter News App  
Newsly is a modern Flutter news application for browsing the latest headlines, exploring categories, searching for articles, and reading full news details. The app is built with clean architecture, smooth UI/UX, and full support for Light & Dark modes.

✨ Features  
🎨 Modern UI/UX  
Clean and minimal interface with responsive layouts  
Light & Dark Mode support  
Smooth navigation and animations  

🗞 News Experience  
Latest news feed (Top Headlines)  
Browse news by categories (Business, Sports, Technology, Health, etc.)  
Article details screen with full content  
Pull-to-refresh support  

🔍 Search  
Search news articles by keywords  
Fast and responsive results  

⭐ Favorites / Bookmarks  
Save and remove articles from favorites  
Local persistence using SharedPreferences  
Instant UI updates  

🌍 Localization  
English & Arabic language support  
Local saving of selected language and theme  

🛠 Technologies Used  
Flutter – UI & Application Logic  
Dart – Programming Language  
REST API (News API) – Fetching news data  
Dio / http – API requests  
Provider – State Management  
SharedPreferences – Local storage (theme, language, favorites)  
CachedNetworkImage – Image caching and performance  

📌 API Configuration  
This project uses a public News API.  
Add your API key in a constants file or `.env`.  
Do not commit API keys to GitHub.  

📂 Folder Structure  
lib/  
 ├── core/  
 │    ├── constants/  
 │    ├── helpers/  
 │    ├── theme/  
 │    ├── reusable_components/  
 │    └── services/  
 ├── data/  
 │    ├── models/  
 │    └── sources/  
 ├── providers/  
 ├── ui/  
 │    ├── home/  
 │    ├── category/  
 │    ├── search/  
 │    ├── details/  
 │    ├── settings/  
 │    └── splash/  
 └── main.dart  

🚀 Getting Started  
1️⃣ Install dependencies  
flutter pub get  

2️⃣ Add API Key  
Create `lib/core/constants/api_keys.dart` and add:  
const String newsApiKey = "YOUR_API_KEY";  

3️⃣ Run the app  
flutter run  

📸 Screenshots

| | | |
|---|---|---|
| ![](assets/screenshots/1.png) | ![](assets/screenshots/2.png) | ![](assets/screenshots/3.png) |
| ![](assets/screenshots/4.png) | ![](assets/screenshots/5.png) | ![](assets/screenshots/6.png) |


👨‍💻 Developer  
Ameer Mahmoud  
Flutter Developer | UI/UX Designer  
GitHub: https://github.com/Ameer-Mahmoud  

⭐ Support the Project  
If you like this project, please give it a ⭐ star on GitHub!  

📄 License  
This project is open-source and free for educational use.
