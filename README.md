# 📰 News App (Flutter)

A modern Flutter news application for browsing headlines, exploring categories, searching articles, and reading full news details — built with clean UI/UX and full **Light & Dark Mode** support.

---

## ✨ Features

### 🎨 UI / UX
- Clean and modern interface
- Fully responsive layouts
- Light & Dark Mode

### 🗞 News
- Latest headlines feed
- Browse news by categories
- Article details screen
- Pull-to-refresh support

### 🔍 Search
- Search articles by keywords
- Fast and smooth results

### ⭐ Favorites / Bookmarks
- Save and remove articles
- Local persistence using SharedPreferences
- Instant UI updates

### 🌍 Localization
- English & Arabic support
- Save selected language locally

---

## 🛠 Tech Stack

- Flutter
- Dart
- REST API (News API)
- Dio / http
- Provider (State Management)
- SharedPreferences
- CachedNetworkImage

---

## 📂 Folder Structure

lib/
├── core/
│ ├── constants/
│ ├── helpers/
│ ├── theme/
│ ├── reusable_components/
│ └── services/
├── data/
│ ├── models/
│ └── sources/
├── providers/
├── ui/
│ ├── home/
│ ├── category/
│ ├── search/
│ ├── details/
│ ├── settings/
│ └── splash/
└── main.dart

---

## 🔑 API Setup

This project uses a public News API.  
Add your API key and **do not push it to GitHub**.

Create the following file:

`lib/core/constants/api_keys.dart`

```dart
const String newsApiKey = "YOUR_API_KEY";
🚀 Getting Started
1) Install dependencies
bash

flutter pub get
2) Run the app
bash

flutter run
📸 Screenshots

👨‍💻 Developer
Ameer Mahmoud
Flutter Developer | UI/UX Designer
GitHub: https://github.com/Ameer-Mahmoud

⭐ Support
If you like this project, please give it a ⭐ star on GitHub!

📄 License
This project is open-source and free for educational use.
