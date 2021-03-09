# TechnicalTask

A Flutter application for Meat Delivery.

Basis of Architecture
This app adopts layered architecture. Each layer has several role.


   Backend Services (Api, server application, etc...)
        ↑
~~~~~~~~↑~~~~~~~~~~~~~~~~~~~~~~ Border of Device ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        ↑
        ↑ →→→→→→→→→→→→  Storage (File system or on memory)
        ↑ →→→→→→→→→→→→  Device informations
        ↑
        ↑ access
 +----------------+
 |   Repository   |   ...  Abstracting the usage of backends
 +----------------+
        ↑
        ↑ depend
        ↑
 +----------------+
 |     Bloc    |   ...  Common procedures manipulationg repositories 
 +----------------+
        ↑
        ↑ depend
        ↑
 +----------------+
 |       UI       |   ...  Presenting states of App and recieving commands from user
 +----------------+
        ↑
        ↑ launch
        ↑
       main
State management
This app adopts Bloc pattern to manage application/screen states of the app and implement domain logic.

To separate State and Business Logic, we will use State / Event.
