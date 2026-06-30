# 🚀 Excelerate Connect — Team 8

A **Flutter mobile application** built by **Team 8** for the **Excelerate MAD (Mobile App Development) — June 2026 Program**. Excelerate Connect helps students discover internship and mentorship programs, view detailed program information, and register through a fully validated sign-up flow — all wrapped in a clean Material 3 interface.

> Built with Flutter · Dart · Material 3 — runs on Android, iOS, Web, Windows, macOS, and Linux.

## 🌟 Project Overview

Excelerate Connect simulates a real-world internship/mentorship discovery platform. A student logs in, browses curated programs loaded asynchronously from a JSON data source, reviews program details (schedule, format, seats, learning outcomes), and registers using a validated multi-field form — with the result reflected immediately back on the details screen.

The project is structured as a single-file Flutter app (`lib/main.dart`) demonstrating clean separation between data models, repository logic, screens, and reusable widgets — making it a solid reference for core Flutter patterns.

## ✨ Key Features

- 🔐 **Login screen** with email/password fields, password visibility toggle, and guest access
- 🏠 **Home dashboard** with a branded welcome panel, announcements feed, and a responsive quick-links grid
- 📋 **Program listing** loaded asynchronously from a bundled JSON asset via `FutureBuilder`, with dedicated loading, empty, and error states (with retry)
- 🔍 **Program details** screen showing schedule, topic, duration, format, seat count, and learning outcomes
- 📝 **Registration form** with field-level validation (name, email, password, motivation) and a submit-in-progress state
- 🔁 **Bidirectional navigation** — registration result is passed back to the details screen via `Navigator.pop(true)`, updating the UI to a "Registered" state
- 📱 **Responsive layout** — quick-links grid adapts from 2 to 4 columns based on screen width
- 🎨 **Centralized Material 3 theming** — consistent colors, card shapes, input borders, and button styles defined once in `ThemeData`

## 🛠️ Tech Stack

- **Flutter** (SDK ^3.12.1) & **Dart**
- **Material 3** design system
- `cupertino_icons` for iOS-style icons
- Local JSON asset (`assets/data/programs.json`) as the data source — no backend required
- `flutter_test` for widget/integration testing
- `flutter_lints` for code quality

## 📂 Project Structure

```
Team8-Excelerate-MADJune26/
├── lib/
│   └── main.dart              # App entry point — all screens, models, and widgets
├── assets/
│   └── data/
│       └── programs.json      # Program catalog (id, title, date, topic, seats, outcomes, etc.)
├── test/
│   └── widget_test.dart       # End-to-end widget test: login → browse → register
├── android/, ios/, web/,
│   windows/, macos/, linux/   # Platform-specific Flutter build folders
├── pubspec.yaml                # Project dependencies & asset declarations
├── WEEK3_CHANGELOG.md          # Sprint changelog (data wiring, registration form, states)
└── README.md
```

## 🧩 App Architecture

```
LoginScreen ──(pushReplacementNamed)──▶ HomeScreen ──(pushNamed)──▶ ProgramListScreen
                                                                          │
                                                              (pushNamed + Program object)
                                                                          ▼
                                                                ProgramDetailsScreen
                                                                          │
                                                              (pushNamed → pop(true))
                                                                          ▼
                                                                RegistrationScreen
```

Key building blocks in `lib/main.dart`:

| Component | Responsibility |
|---|---|
| `Program` | Immutable data model with a `fromJson` factory for type-safe parsing |
| `ProgramRepository` | Simulates an API call — loads and decodes `programs.json` from the asset bundle |
| `LoginScreen` | Stateful — manages text controllers and password visibility |
| `HomeScreen` | Stateless dashboard with announcements and quick links |
| `ProgramListScreen` | Uses `FutureBuilder` to handle loading / error / data states |
| `ProgramDetailsScreen` | Stateful — tracks registration status and displays full program info |
| `RegistrationScreen` | Form-validated registration flow with submission guard |
| `ProgramCard`, `_InfoChip`, `_WelcomePanel`, `_AnnouncementTile`, `_QuickLinkTile`, `_EmptyState`, `_ErrorState` | Reusable UI widgets following Flutter best practices |

## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/Guptadeepak1915/Team8-Excelerate-MADJune26.git

# Navigate into the project
cd Team8-Excelerate-MADJune26

# Install dependencies
flutter pub get

# Run on a connected device or emulator
flutter run

# Run the widget/integration tests
flutter test
```

## 🎯 Objectives

- Build a multi-screen Flutter app with realistic navigation and state management
- Practice async data loading with `FutureBuilder` and the repository pattern
- Implement robust form validation using `GlobalKey<FormState>`
- Apply centralized Material 3 theming for a consistent design system
- Write an end-to-end widget test covering the full user journey

## 📌 Future Enhancements

- Replace local JSON with a real backend API
- Add authentication (real login, not a placeholder)
- Push notifications for new program announcements
- Persist registration data (local storage or backend)
- Add unit tests for `Program.fromJson` and `ProgramRepository`

## 👥 Team 8

Built collaboratively by **Anu Priya, Deepak Gupta, Sejal Yadav, Raji Arumugam, Hoyah Churchill Evans, Jagadeesh Bhogolu, and Kirsten Sarpong** as part of the **Excelerate MAD — June 2026** program.

## ⭐ Support

If you found this project helpful, consider giving it a **⭐ Star** on GitHub!

---

**Built  with Flutter by Team 8 | Excelerate MAD June 2026**