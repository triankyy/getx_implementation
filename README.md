# Project Template

A new Flutter project.

## Folder Structure

```yaml
- /lib/app  
# This is where all the application's directories will be contained  
    - /data
    # Directory responsible for containing everything related to our data
        - /enums 
        - /services
             # This is where we store our Services
             # Here our repositories are just classes that will mediate the communication between our controller and our data.
             # Our controllers won't need to know where the data comes from, and you can use more than one repository on a controller if you need to.
             # The repositories must be separated by entities, and can almost always be based on their database tables.
             # And inside it will contain all its functions that will request data from a local api or database.
             # That is, if we have a user table that we will persist as, edit, add, update and delete, all these functions are requested 
             # from an api, we will have a repository with this object of the api where we will call all the respective 
             # functions to the user. So the controller does not need to know where it comes from, the repository being a 
             # mandatory attribute for the controllers in this model, you should always initialize the controller with at - /repository
            - /example_service.dart
                - service.dart
                - repository.dart
        - /provider
        # Our data provider, can be an api, local database or firebase for example.
            - api_provider.dart
            - db_provider.dart
            - storage_provider.dart
        # Here, our asynchronous data request, http, local database functions must remain ...
        - /model
        # Our classes, or data models responsible for abstracting our objects.
            - model.dart
    - /modules
    # Each module consists of a page, its respective GetXController and its dependencies or Bindings.
    # We treat each screen as an independent module, as it has its only controller, and can also contain its dependencies.
    # If you use reusable widgets in this, and only in this module, you can choose to add a folder for them.
        - /my_module
            - page.dart
            - controller.dart
            - binding.dart
            - repository.dart
            - /local_widgets
    # The Binding class is a class that decouples dependency injection, while "binding" routes to the state manager and the dependency manager.
    # This lets you know which screen is being displayed when a specific controller is used and knows where and how to dispose of it.
    # In addition, the Binding class allows you to have SmartManager configuration control.
    # You can configure how dependencies are to be organized and remove a route from the stack, or when the widget used for disposition, or none of them.
    #The decision to transfer the repositories "globally" to internal modes within each module is that we can use a function in different modules, but the problem was due to having to import more than one repository in the controller, so we can repeat the same calls functions, internal repositories, thus maintaining faster maintenance, making everything that gives life to the module reachable through the module itself.
    #Repositories then become just a class to point to the controllers of our module, which and which provider we are going to consume, the same goes for services, services that have integration with some provider, must have its own repository

    - /global_widgets 
    # Widgets that can be reused by multiple **modules**.  

    - /routes
    # In this repository we will deposit our routes and pages.  
    # We chose to separate into two files, and two classes, one being routes.dart, containing its constant routes and the other for routing.  
        - routes.dart
        # class Routes {
        # This file will contain your constants ex:  
        # class Routes { const HOME = '/ home'; }  
        - pages.dart
        # This file will contain your array routing ex :  
        # class AppPages { static final pages = [  
        #  GetPage(name: Routes.HOME, page:()=> HomePage()) 
        # ]};  
    - /core
        - /errors
        # error handling and classes
        - /values
            - strings.dart
            # globally reusable strings
            # example : enter > "Enter" on several buttons
            - colors.dart
            # colors that can be reused throughout the application
            - /languages
            # for applications that use internationalization, they can deposit their translation files here
                - /from
                    - pt-br.dart
                    - en-au.dart
        - /theme
        #Here we can create themes for our widgets, texts and colors
            - text_theme.dart  
            # inside ex: final textTitle = TextStyle(fontSize: 30)  
            - color_theme.dart  
            # inside ex: final colorCard = Color(0xffEDEDEE)  
            - app_theme.dart  
            # inside ex: final textTheme = TextTheme(headline1: TextStyle(color: colorCard))  
        - /utils
        #Here you can insert utilities for your application, such as masks, form keys or widgets
            - /extensions
                # are a way to add functionality to existing libraries
                - example_remove_underlines.dart
                # https://dart.dev/guides/language/extension-methods
                
            - /functions
            # functions that can be reused globally in the app
                - get_percent_size.dart
                # example: a function that returns the percentage of a parent widget
                
            - /helpers
            # abstract classes or helper classes like key masks etc
                - masks.dart  
                # inside ex: static final maskCPF = MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});  
                - keys.dart  
                # inside ex: static final GlobalKey formKey = GlobalKey<FormState>();
- /repos # Use for Micro Front-End multirepo example:
    - /dependencies
    - /core
- main.dart  
# main file
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
