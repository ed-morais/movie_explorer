# Movie Explorer

Movie Explorer is a Flutter application that allows users to explore movies by genre.

## Contributors

- [Edilson Morais Brito](https://github.com/ed-morais)
- [Tiago Silva Carvalho](https://github.com/TSCTiago)
- [Francisco Mendes Magalhães Filho](https://github.com/FranciscoMends)

## Requirements and Features

1. The main page of the app should display in a compact form, the data of the titles released since the beginning of the current year. At least the following data should be displayed: title, type (movie, series, mini-series, etc.), genre, release year, and associated image.
2. The main page should provide support for pagination of results.
3. There should be an option to filter the displayed results by genre.
4. When selecting a title from the main page, a details page about the title should be displayed. This page, in addition to the data from item 1, should display the synopsis and rating of the title.
    - Some titles may not have a rating or synopsis.
5. If the title is composed of episodes (series, miniseries, etc.) the details page should display, in an intuitive and responsive way, the seasons and their respective episodes.
6. If any of the fields are not provided by the API, the app should handle this appropriately.
7. Very long data should be processed appropriately so that they can be viewed appropriately on the page.
    - Pay attention to how the visualization of long data is implemented. It is not recommended that the user needs many iterations to view all the data.
8. The waiting time between a request and the receipt of data from the API should be signaled by the display of a spinner on the page.
9. Possible communication errors with the API should be anticipated by the app and appropriately notified to the user through non-technical messages.
10. The app should have an option to display the data of the team members (new page, window, snackbar, etc).
11. Each team is free to define the layout of the app, which will be considered at the time of evaluation. Better designed interfaces with better design and functionalities will be better evaluated.
12. The project's coding should observe the principles of Effective Dart style.

## Installation

Clone the repository and run `flutter pub get` to fetch the dependencies. Then, run `flutter run` to start the application.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

MIT

