# Posts App

Flutter test application to retrieve posts from the given API.

## Brief architecture description

### State management
The application utilises `ChangeNotifier` classes to manage UI state. All notifiers are provided through `MultiProvider` wrapping the `MyApp` widget in `main.dart`.
Each `ChangeNotifier` is accessed using `Provider.of<ChangeNotifierImpl>(context);`.

### Screen structure
There are 4 main screens: 
1. HomeScreen: 
  - acts as an entry point, implements `BottomNavigationBar`.
  - bottom navigation contents are wrapped into an `IndexedStack` to preserve state while navigating between tabs.

2. PostsScreen: 
- Displays the list of posts, fetched from the given api.
- Uses `PostsUiState` that extends `ChangeNotifier`: 
  - Fetches posts using `PostUtility`.
  - Holds `allPosts` and exposes `filteredPosts` lists.
  - Manages UI state via `bool isLoading` and `String? error` variables.
- Posts are fetched once during the app initialization and by pressing on "Retry" button.

3. PostsDetailsScreen: 
- Dispalys selected post' title and description.

4. FeedbackFormScreen: 
- Displays a form with 3 text fields and send button.
- Displays `SnackBar` and clears the form inputs, after pressing the "Send" button and if the input was valid.
- Uses `FeedbackFormUiState` that extends `ChangeNotifier`: 
  - Validates the form inputs: email for correct formatting and all three fields for empty input.

### Networking
- `PostUtility` class acts as a layer between `PostProvider` and `PostUiState`, containing fetch logic.

- API call is handled through the `PostProvider` class using `http` dart package.
- The `PostProvider.fetchPosts()` returns PostResponse object which contains list of posts and possible error.

## Links to the contained packages
- [models](https://github.com/AriIamsh/flutter-posts-app/tree/main/lib/models)
- [providers](https://github.com/AriIamsh/flutter-posts-app/tree/main/lib/providers)
- [screens](https://github.com/AriIamsh/flutter-posts-app/tree/main/lib/screens)
- [utilities](https://github.com/AriIamsh/flutter-posts-app/tree/main/lib/utilities)

- [test](https://github.com/AriIamsh/flutter-posts-app/tree/main/test)

## How to install Flutter SDK
- [Official guide on how to install Flutter SDK with Dart](https://docs.flutter.dev/get-started/install)

## How to run in Android Studio
1. Install Flutter SDK.
2. Open Android studio and install Flutter plugin.
3. Clone git repository to your PC.
4. Open cloned project in Android Studio.
5. Run Android emulator from the Device Manager. If you don't have any devices created yet, add new emulator by pressing "+" button.
6. Run the project.

## How to run on Android device
1. Go to [Release](https://github.com/AriIamsh/flutter-posts-app/releases/tag/0.0.1) in github
2. Download android-debug.apk file on the Android device.
3. Install the apk.
4. Launch the app.
