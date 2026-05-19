# HTTP & Riverpod: User Directory API

Laboratory Assignment for the course **‘Mobile Application Programming’**

## Table of Contents
- [Goal](#goal)
- [Why Riverpod?](#why-riverpod)
- [Architecture](#architecture)
- [Screenshots](#screenshots)
  - [General View](#general-view)
  - [Search](#search)
  - [User Card](#user-card)
- [Performed by](#performed-by)


## Goal
The project is a "User Directory" application focused on demonstrating asynchronous programming, network requests using the HTTP package, state management, and memory caching in Flutter. It implements clean architecture principles and modern state management techniques using Riverpod.

**Requirements Fulfilled:**
- ✅ **API Integration:** Implemented network requests using the `http` package to fetch user data from a remote REST API (`jsonplaceholder`).
- ✅ **State Management:** Used **Riverpod** (`flutter_riverpod` + `riverpod_generator`) for robust state management, handling asynchronous data (`StreamProvider`), and dependency injection.
- ✅ **Caching Mechanism:** Implemented memory caching to instantly display previously loaded users while fetching fresh data in the background, ensuring a seamless user experience without unnecessary loading spinners.
- ✅ **Search Functionality:** Added a local search feature to filter the user list by name, utilizing `TextEditingController` and `setState` inside a `ConsumerStatefulWidget`.
- ✅ **UI/UX & Theming:** Adhered to Material Design 3 with a customized, minimalist color palette defined centrally in `AppTheme`. Displayed detailed user info in a custom `AlertDialog`.
- ✅ **Error Handling:** Graceful error handling with custom error views and "Retry" functionality, avoiding swallowed stack traces.

## Why Riverpod?
In this project, **Riverpod** is essential for:
1. **Dependency Injection:** Easily providing the `http.Client` and `ApiService` across the app without passing them down the widget tree.
2. **Async Data Handling:** `StreamProvider` elegantly manages the loading, data, and error states of our API call. It allows us to yield cached data synchronously and then automatically update the UI when the fresh network data arrives.
3. **Safety & Scalability:** It guarantees compile-time safety and completely removes the boilerplate of manually managing `FutureBuilder` or `StreamBuilder`.

## Architecture
The project is structured using a feature-based layered approach:

```text
lib/
├── constants/         # Static strings and localized text
│   └── app_strings.dart
├── models/            # Data layer (JSON serialization)
│   ├── address.dart
│   └── user.dart
├── providers/         # Riverpod state management and DI
│   ├── users_provider.dart
│   └── users_provider.g.dart
├── screens/           # Presentation layer
│   ├── widgets/       # Reusable UI components (UserCard, ErrorView, UserDetailDialog)
│   └── users_screen.dart
├── services/          # Network and business logic
│   └── api_service.dart # HTTP requests and caching logic
├── theme/             # Global UI settings
│   └── app_theme.dart # Minimalist color palette and Material 3 theme
└── main.dart          # Entry point
```

## Screenshots

### General View
<img width="377" height="813" alt="image" src="https://github.com/user-attachments/assets/a94cf6ee-cc1c-4501-940d-5a7fae625be8" />

---

### Search
<img width="381" height="818" alt="image" src="https://github.com/user-attachments/assets/55b42ed0-40da-4347-9a66-a3471b7392e0" />

---

### User Card
<img width="376" height="815" alt="image" src="https://github.com/user-attachments/assets/098386ef-396e-4f41-8dc2-ff16e6447cd7" />


## Performed by
Andrii ([Kossman](https://github.com/stkossman)) Stavskyi
