# Riverpod Examples & Trial with Flutter

This project demonstrates all 6 types of Riverpod providers in Flutter. It serves as a learning resource for understanding how to use Riverpod effectively to manage application state in different scenarios.

---

## **Project Overview**

The repository contains examples for each type of provider supported by Riverpod:  

1. **Provider**: A simple provider for read-only values.
2. **StateProvider**: A provider for mutable state.
3. **FutureProvider**: Handles asynchronous data.
4. **StreamProvider**: Works with real-time streams.
5. **NotifierProvider**: A provider for managing complex business logic using Riverpod's `Notifier`.
6. **StateNotifierProvider**: A provider for advanced state management using Riverpod's `StateNotifier`.

First 4 simpple one's are in the homescreen, separated with a divider for easy understanding and clearity.
Next 2 complex implementation have 2 different screens.

---

## **Getting Started**

### Prerequisites

Ensure the following tools and frameworks are installed:

- Flutter SDK
- Dart
- Visual Studio Code or Android Studio
- Riverpod package (installed via pubspec.yaml)

---

### Installation

1. Clone this repository:

    ```bash
    git clone https://github.com/Siddiqui145/riverpod_trial.git
    cd riverpod_trial
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the application:

    ```bash
    flutter run
    ```

---

## **Folder Structure**

```plaintext
lib/
├── main.dart                    # Entry point of the app
├── screens/                     # All example screens
│   ├── home_screen.dart    # Provider example
│   ├── provider.dart # StateProvider example
│   ├── notifier_provider_example.dart # NotifierProvider example
│   └── state_notifier_provider_example.dart # StateNotifierProvider example
└── provider_setup.dart          # Contains provider initialization and setup
```

---

## **Examples Included**

### 1. **Provider**

- Demonstrates dependency injection for immutable values.
- Example: Showing a simple message in a widget.

### 2. **StateProvider**

- Handles state that can be changed with `state`.
- Example: Counter app with increment functionality.

### 3. **FutureProvider**

- Manages asynchronous tasks like network calls.
- Example: Fetching data from a mock API.

### 4. **StreamProvider**

- Uses streams for real-time updates.
- Example: A ticking stopwatch.

### 5. **NotifierProvider**

- Manages complex business logic using `Notifier`.
- Example: Todo list manager.

### 6. **StateNotifierProvider**

- Advanced state management using `StateNotifier`.
- Example: Wishlist manager with items marked as bought or unbought.

---

## **How to Use**

1. Navigate through the screens using the provided navigation bar or buttons in the app.
2. Explore each example to understand how the provider type works.
3. Modify the codebase to experiment with different use cases.

---

## **Demo**

https://github.com/user-attachments/assets/83aa58c2-0333-40f1-afac-61f9f74010a5

---

## **Contributing**

1. Fork this repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with detailed comments on your changes.

---

## **Resources**

- [Riverpod Documentation](https://riverpod.dev/docs)
- [Flutter Documentation](https://flutter.dev/docs)

---

## **License**

This project is licensed under the GPL-3.0 License. See the `LICENSE` file for details.
