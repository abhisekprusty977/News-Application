# News-Application
A news reader iOS application built with SwiftUI using the MVVM (Model-View-ViewModel) architectural pattern. The app fetches top headlines from an external news API and displays them in a clean, user-friendly interface.
## Table of Contents
- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Features](#features)
- [Project Structure](#project-structure)
- [Models](#models)
- [ViewModels](#viewmodels)
- [Views](#views)
- [Setup Instructions](#setup-instructions)
- [API Integration](#api-integration)

## Project Overview

The News_MVVM app is a simple news reader that displays top headlines from an external news service. It follows Apple's modern SwiftUI framework with the MVVM architectural pattern, making it modular, testable, and maintainable. The app includes features like pull-to-refresh, loading indicators, and error handling.

## Architecture

This project implements the MVVM (Model-View-ViewModel) architectural pattern:

- **Model**: Represents the data layer of the application (Article.swift)
- **View**: Defines the UI components and presentation layer (SwiftUI Views)
- **ViewModel**: Acts as a bridge between the Model and View, handling business logic and state management (NewsViewModel.swift)

This separation of concerns makes the code more organized and easier to maintain.

## Features

- ✅ Fetches top news headlines from an external API
- ✅ Clean, modern UI with SwiftUI
- ✅ Pull-to-refresh functionality to get the latest news
- ✅ Loading indicators during API requests
- ✅ Error handling and user feedback
- ✅ Article previews with thumbnails and descriptions
- ✅ Web view integration to read full articles
- ✅ Gradient background for visual appeal
- ✅ Responsive design that adapts to different screen sizes

## Project Structure

```
News_MVVM/
├── News_MVVMApp.swift          # App entry point
├── Assets.xcassets/            # Asset catalog
├── Models/
│   └── Article.swift           # Data models for news articles
├── ViewModels/
│   └── NewsViewModel.swift     # Business logic and state management
└── Views/
    ├── NewsHeadLinesView.swift # Main news feed view
    ├── ArticleRowView.swift    # Individual article row view
    └── BackgroundView.swift    # Custom background view
```

## Models

### Article.swift
Contains the data structures for representing news articles:

#### Classes:
- `Article`: Main class that contains an array of news articles
- `Datum`: Represents a single news article with properties like title, description, URL, image URL, and publication date

#### Properties:
- `title`: The headline of the news article
- `description`: A brief summary of the article
- `url`: The URL to read the full article
- `imageURL`: The URL of the article's featured image
- `publishedAt`: Date when the article was published

## ViewModels

### NewsViewModel.swift
Manages the app's state and handles API communication:

#### Properties:
- `article`: Contains the array of news articles
- `isLoading`: Boolean indicating if data is being loaded
- `errorMessage`: Stores any error messages for user feedback

#### Functions:
- `fetchHeadlines()`: Asynchronously fetches top headlines from the news API
- Uses the `@MainActor` and `@Observable` attributes for thread safety and state observation

#### API Key:
- Uses a hardcoded API key for the news service (Note: In production, this should be stored securely)

## Views

### NewsHeadLinesView.swift
The main view that displays the list of news articles:

- Uses a `NavigationStack` for navigation between views
- Shows a list of articles with titles and descriptions
- Displays loading indicator when fetching data
- Shows error alerts when API requests fail
- Implements pull-to-refresh functionality
- Navigates to a web view when an article is selected

### ArticleRowView.swift
Displays individual article entries in the list:

- Shows the article's thumbnail image using `AsyncImage`
- Displays the article's title and description
- Handles loading states and error cases for images
- Uses material effects and rounded corners for visual styling

### BackgroundView.swift
Provides a custom gradient background for the app:

- Uses a diagonal gradient with purple, blue, and red colors
- Applies a blur effect for visual depth
- Covers the entire safe area of the device

### SplashView.swift
The AppSplashView provides a polished, animated splash experience that appears when the app launches and transitions away automatically after a short delay.

• Presents a full-screen, vibrant background using BackgroundView (diagonal gradient with blur).
• Displays a large hierarchical SF Symbol icon (newspaper.fill) and the app title “Top Headlines”.
• Animates the icon and title in with smooth scale and opacity transitions to create a refined entrance:
   • Icon scales from 0.8 to 1.0 and fades in.
   • Title and progress indicator fade in with slight delays for a staggered effect.
• Shows a ProgressView to communicate loading activity during the splash.
• Automatically dismisses itself after approximately 2.5 seconds using a fade animation, handing control to the main content.
• Implemented in SwiftUI with lightweight state management and clean, modern animations.

This splash screen sets the tone for the app by combining an immersive background, clear branding, and subtle motion to create a welcoming first impression.

### WebView
Embedded web view for displaying full articles (likely implemented separately)

## Setup Instructions

### Prerequisites
- Xcode 14.0 or later
- iOS 17.0 or later
- macOS 12.0 or later

### Building the Project
1. Clone or download the project repository
2. Open the `.xcodeproj` file in Xcode
3. Select your target device or simulator
4. Press Cmd+R to build and run the application

### Dependencies
- SwiftUI (built into Xcode)
- Foundation framework (for networking and data handling)

### Configuration
- The app uses a hardcoded API key in `NewsViewModel.swift`. In a production environment, this should be stored securely and accessed through environment variables or secure keychain storage.

## API Integration

This app integrates with an external news API called "The News API":
- Base URL: https://api.thenewsapi.com/v1/news/
- Endpoint: `/top` for retrieving top headlines
- Parameters:
  - `api_token`: Authentication token
  - `locale`: Region for headlines (set to "us")
  - `limit`: Number of articles to retrieve (set to 20)

The API returns JSON data which is automatically decoded into the appropriate data models using Swift's `Codable` protocol.

## Notes
- The current implementation uses a hardcoded API key which is not recommended for production applications
- Consider implementing proper error logging and analytics
- For extended use, consider adding caching mechanisms to improve performance
- Future enhancements could include category filtering, search functionality, and bookmarking

