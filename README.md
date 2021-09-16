# ara_vnext

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

File Structure:
- logic folder
    - data => dummy data for testing purpose
    - functions => global functions that are used in the whole project scope
    - models => data modeling classes
    - services => classes that used to interact with packages and performs tasks
    - vm => ViewModels classes that manage every screen state
    - enums.dart => file contain all custom types

- views folder
    - screens => folder conatin all app screens, every screen folder contain:
        1- screen.dart file
        2. custom widgets folder for screen
    - shared => all widgets and utils that used globally inside the project

I used :
- MVVM pattern for project structure
- get_it for dependency injection and service locator
- provider for state management
- dio for http requests and api calls
- flutter_secure_storage for save and encrypt sensitive data
- connectivity_plus for check internet connection
- syncfusion_flutter_gauges for charts
