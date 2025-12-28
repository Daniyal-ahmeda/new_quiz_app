# Flutter Quiz App (Final Exam Project)

A comprehensive mobile application built with Flutter, following Clean Architecture and Material 3 Design principles.

## Features

### Week 1: UI Foundation

- **Material 3 Design**: Custom Light & Dark themes.
- **Clean Architecture**: Separation of Domain, Data, and Presentation layers.
- **Component Library**: Reusable widgets (`AppButton`, `CustomCard`, etc.).

### Week 2: Backend Integration

- **Firebase Auth**: Secure Email/Password login and signup.
- **Cloud Firestore**: Real-time CRUD operations for Character data.
- **State Management**: Robust state handling using **Riverpod**.

### Week 3: Advanced Features

- **Search**: Real-time filtering of character lists.
- **Sharing**: Share character details via system dialog.
- **Performance**: Efficient image caching with `cached_network_image`.

## Setup Instructions

1.  **Clone Repository**:
    ```bash
    git clone <repo-url>
    cd new_quiz_app
    ```
2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Firebase Configuration**:

    - Create a project in [Firebase Console](https://console.firebase.google.com/).
    - Add Android app (`com.example.new_quiz_app`).
    - Download `google-services.json` and place in `android/app/`.
    - Enable **Authentication** (Email/Password) and **Firestore**.

4.  **Run Application**:
    ```bash
    flutter run
    ```

## Architecture

The project follows **Clean Architecture**:

- `core`: Global utilities, themes, services.
- `features`: Feature-specific modules (Auth, Character).
  - `domain`: Entities (Pure Dart).
  - `data`: Repositories & Models (Firebase impl).
  - `presentation`: Widgets, Pages, Providers.
- `shared`: Reusable UI components.

## AI Usage

AI tools were used for generating initial boilerplate, color palettes, and debugging. See `AI_INTEGRATION_LOG.md` for details.
