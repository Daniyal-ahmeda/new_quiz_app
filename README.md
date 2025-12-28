# ProQuiz - Advanced Developer Quiz App

**ProQuiz** is a premium, gamified mobile application designed to test development skills while building a unique RPG-style persona. Built with **Flutter**, **Riverpod**, and **Clean Architecture**.

## 🚀 Key Features

### 1. 🧠 Dynamic Quiz System (powered by QuizAPI.io)

- **Real-time Questions**: Fetches high-quality programming questions daily.
- **Topics Covered**: Linux, DevOps, Docker, SQL, Kubernetes, PHP, Bash, HTML, JavaScript, and more.
- **Interactive UI**: Custom card-based option selection with instant feedback.

### 2. 🧙‍♂️ Character RPG Collection

- **Create Your Avatar**: Build custom characters with detailed backstories.
- **RPG Stats**: Assign attributes like _Intelligence_, _Creativity_, and _Focus_.
- **Grid Collection**: View your created characters in a beautiful grid layout.
- **Detail View**: Tap to view full specs, hero images, and "Equip" functionality.

### 3. 🎨 Premium UI/UX

- **Modern Design**: Glassmorphism effects, floating navigation bar, and sliver scrolling.
- **Splash Screen**: Custom animated launch experience.
- **Theming**: Light/Dark mode support (System aware).
- **Smooth Animations**: Hero transitions and layout animations.

## 🛠️ Tech Stack

- **Framework**: Flutter (Dart)
- **State Management**: Riverpod 2.0 (ConsumerWidgets, FutureProviders)
- **Backend/Auth**: Firebase Authentication & Cloud Firestore
- **API**: QuizAPI.io (REST Integration)
- **Network**: http package
- **Caching**: cached_network_image
- **Utilities**: share_plus, google_fonts

## 📂 Project Structure (Clean Architecture)

```
lib/
├── core/               # Global utilities (Theme, Constants, Widgets)
├── features/
│   ├── auth/           # Login, Signup, Auth Providers
│   ├── character/      # Character CRUD (Firebase Integration)
│   ├── onboarding/     # Splash Screen
│   ├── profile/        # User Settings & Stats
│   └── quiz/           # Main Quiz Logic & API Integration
│       ├── data/       # RemoteDataSource (QuizAPI) & Repository Impl
│       ├── domain/     # Entities (Quiz, Question) & Repository Interface
│       └── presentation/ # Quiz Pages, Widgets, & Providers
└── main.dart           # App Entry Point
```

## ⚡ Setup Instructions

1.  **Clone the Repository**:

    ```bash
    git clone https://github.com/yourusername/pro_quiz.git
    cd pro_quiz
    ```

2.  **Install Dependencies**:

    ```bash
    flutter pub get
    ```

3.  **Firebase Setup**:

    - Place your `google-services.json` in `android/app/`.
    - Enable **Authentication** and **Firestore** in your Firebase Console.

4.  **Run the App**:
    ```bash
    flutter run
    ```

## 📝 Developer Notes

- **API Key**: The project is pre-configured with a `QuizAPI.io` key in `QuizRemoteDataSource`. For production, move this to an `.env` file.
- **State Management**: We use `ref.watch` for reactive UI updates across the app.

---

_Built for the Mobile Application Development Final Exam._
