# Movie Recommendation Application

**------------------------------------------------------------------------------------**

## Overview
The **Movie Recommendation Application** allows users to explore a list of movies, add their favorite movies to a personal watchlist, and view the movies they've saved. The app provides a simple and intuitive interface to recommend movies, manage a watchlist, and keep track of user preferences.

## Features
- Browse a collection of movies.
- Add movies to the watchlist.
- View and manage the saved movies in the watchlist.
- Smooth navigation between different sections of the app.

## Technologies Used
- **Flutter**: A cross-platform mobile development framework used to build the app.
- **Dart**: The programming language used for the development of the app.
- **Google Navigation Bar**: For smooth navigation between app screens.

## API Used
The application uses a mock API or local data source (hardcoded movie list) for movie recommendations. The API’s purpose is to provide a list of movies to display to the user, from which they can select and add their favorites to the watchlist.

### Movie Data
The app uses hardcoded movie data in the `MoviePage` screen. Each movie contains:
- **Title**: The name of the movie.
- **Image URL**: A link to the poster or image of the movie.

## Screens and Functionalities

### 1. **Home Page**
- **Purpose**: The welcome screen of the app.
- **Functionalities**:
  - Displays a welcoming message and brief description of the app.
  - A button (`Get Started`) that navigates the user to the Movies screen.
  - Displays an animation (Lottie) to engage users visually.
  
### 2. **Movie Page**
- **Purpose**: Displays a list of movies available for adding to the watchlist.
- **Functionalities**:
  - The page contains a list of movies with their titles and images.
  - Each movie has an **Add** button that, when clicked, adds the movie to the user's watchlist.
  - When a movie is added, a **Snackbar** notifies the user that the movie has been added to their watchlist.

### 3. **Watchlist Page**
- **Purpose**: Displays the user's saved movies.
- **Functionalities**:
  - Shows a list of movies that the user has added to their watchlist.
  - If the watchlist is empty, a message is displayed informing the user that the watchlist is empty.
  - Each movie in the list shows its title and image.

## Development Process

### Step 1: Setting Up Flutter Environment
- Installed Flutter SDK and set up the development environment.
- Created a new Flutter project and set up the basic folder structure.
- Added dependencies for the Google Navigation Bar and Lottie animation.

### Step 2: Designing Screens
- Designed and implemented three primary screens: `HomePage`, `MoviePage`, and `WatchListPage`.
- The **HomePage** is a static page with a welcome message and navigation to the movie selection page.
- The **MoviePage** was implemented with a `ListView.builder` to dynamically show a list of movies.
- The **WatchListPage** displays movies that the user adds from the MoviePage.

### Step 3: Implementing Navigation
- Used the `IndexedStack` widget in `BtnNavigator` to manage page navigation and ensure smooth transitions between Home, Movie, and Watchlist screens.
- Utilized a bottom navigation bar (with Google Nav Bar) for easy access to all screens.

### Step 4: Adding Movie Data
- Initially used hardcoded data for movie titles and images.
- Implemented a method in `BtnNavigator` to handle the addition of movies to the watchlist.
- Added a `setState` in `BtnNavigator` to update the UI whenever the watchlist changes.

### Step 5: Handling State
- Used `StatefulWidget` to manage the watchlist in `BtnNavigator`.
- Updated the `MoviePage` and `WatchList` to interact with the state of the watchlist.
- Used `SnackBar` to notify users when a movie is added to the watchlist.

### Step 6: UI Enhancements
- Added a Lottie animation to the **HomePage** for a more engaging user experience.
- Styled buttons and navigation bars to match the theme of the app.

## Challenges Faced and Solutions

### Challenge 1: Managing Watchlist Data Across Screens
- **Problem**: The main challenge was ensuring that the watchlist data was correctly passed between screens and updated dynamically.
- **Solution**: I managed the watchlist in the `BtnNavigator` class using `setState`, ensuring that when a movie is added to the watchlist, the state is updated and reflected in the **WatchListPage**.

### Challenge 2: Persistent State Across Screens
- **Problem**: Initially, the watchlist was not persisting across navigation. When the user returned to the watchlist page, it showed no data.
- **Solution**: By storing the watchlist in the parent widget (`BtnNavigator`), I was able to maintain the state across screen changes. Passing the `addToWatchList` function down to `MoviePage` resolved the issue of adding items to the list.

### Challenge 3: UI Responsiveness and Layout
- **Problem**: Ensuring the UI elements, such as images and text, are responsive across different screen sizes.
- **Solution**: I used `ListView.builder` for dynamic content and ensured proper layout with `SizedBox` and `Padding` widgets to manage spacing and alignment.

## Conclusion

This project helped me learn how to manage state between screens in Flutter and work with dynamic data. By utilizing the `StatefulWidget` to manage the watchlist and passing data between pages, I was able to implement a smooth and responsive user experience.

Future improvements could include integrating a real movie API for fetching dynamic movie data, saving the watchlist data persistently (using packages like `shared_preferences`), and refining the UI further for better scalability.
