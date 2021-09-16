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
