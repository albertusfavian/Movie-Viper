# Project Overview
This iOS project is built using the VIPER architecture, which stands for View, Interactor, Presenter, Entity, and Router. The VIPER pattern separates the application logic into different layers, making the code more modular and maintainable.

## Architecture Layers
### View
The View layer contains the UI components of the app, such as view controllers and UIViews. The view layer communicates with the Presenter layer to update the UI based on the state of the application.

### Interactor
The Interactor layer is responsible for the business logic of the app. It contains the application's logic, data management, and network requests. The Interactor layer communicates with the Presenter layer to provide data to update the UI.

### Presenter
The Presenter layer acts as a mediator between the View and Interactor layers. It receives input from the View layer and uses the Interactor layer to fetch data and perform business logic. It then updates the View layer with the results.

### Entity
The Entity layer contains the data model and other domain-specific objects used by the app.

### Router
The Router layer handles navigation between different screens in the app. It is responsible for presenting and dismissing views, as well as passing data between different layers of the VIPER architecture.

## Dependencies
This project uses the following third-party libraries:

- Moya: A network abstraction layer built on top of Alamofire that provides a simple and elegant way to consume RESTful APIs.
- Netfox: A lightweight, easy-to-use network debugging library that allows you to inspect HTTP requests and responses directly from your iOS app.
- Kingfisher: A lightweight and pure-Swift library for downloading and caching images from the web.
- YouTube Player iOS: A helper library that lets you embed and control YouTube videos in your iOS app.

## Installation
To install and run the app, clone this repository and open the Xcode project file. Then, run pod install in the terminal to install the project dependencies. Finally, build and run the project on a simulator or a physical device.

## Contributing
Contributions to this project are welcome! If you encounter any issues or have any suggestions, please submit a pull request or create an issue on GitHub.
