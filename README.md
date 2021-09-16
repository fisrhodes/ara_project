# ara_vnext

## File Structure:
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

## Notes:
1. I upgrade Flutter version from 2.2.3 to latest version (2.5.0)
2. Each screen has its own ViewModel class which is responsible for managing its state and interacts with services classes
3. I use The Generated route approach that was recommended by the flutter team for navigating between screens

    
