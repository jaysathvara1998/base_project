# Flutter Product Listing Project

## Overview
This Flutter project demonstrates a product listing page that fetches data from an API and displays it in a user-friendly format. It uses clean architecture principles and the BLoC (Business Logic Component) pattern for state management.

---

## Features
- Fetches product data from an external API: [https://api.escuelajs.co/api/v1/products](https://api.escuelajs.co/api/v1/products)
- Clean and modular folder structure based on clean architecture
- Implements the BLoC pattern for state management
- Reusable UI components and utilities

---

## Flutter Version
This project is developed with:
```
Flutter 3.10.0 or later
```

---

## Folder Structure
The project is organized as follows:

```
lib/
├── config/
│   ├── app_config.dart
│   ├── routes.dart
│   └── themes.dart
├── core/
│   ├── constants/
│   │   ├── app_assets.dart
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   └── app_styles.dart
│   ├── errors/
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   ├── network/
│   │   ├── api_client.dart
│   │   └── api_constant.dart
│   ├── utils/
│   │   ├── date_formatter.dart
│   │   ├── logger.dart
│   │   ├── navigation.dart
│   │   ├── size_utils.dart
│   │   └── validators.dart
│   └── widgets/
│       ├── app_button.dart
│       ├── app_text.dart
│       ├── app_text_button.dart
│       └── app_wrapper.dart
├── features/
│   └── product/
│       ├── data/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   └── repositories/
│       │       └── product_repository.dart
│       └── presentation/
│           ├── bloc/
│           └── pages/
└── main.dart
```

### Explanation of Key Folders:
- `config`: Contains app-level configuration such as routes and themes.
- `core`: Core utilities and shared code, including constants, error handling, network clients, and reusable widgets.
- `features`: Contains feature-specific folders. For this project, the `product` folder encapsulates everything related to product functionality.
    - `data`: Handles data sources (e.g., API, local storage) and data models.
    - `domain`: Contains business logic, including repositories.
    - `presentation`: Handles UI and state management (BLoC).

---

## State Management
This project uses the **BLoC (Business Logic Component)** pattern for state management. It provides separation of concerns and testability.

- `bloc`: Contains BLoC classes for managing product states (e.g., loading, success, failure).

---

## API Details
- **Endpoint**: [https://api.escuelajs.co/api/v1/products](https://api.escuelajs.co/api/v1/products)
- **Method**: GET
- **Response**: JSON array of product details

Example Response:
```json
[
  {
    "id": 1,
    "title": "Product 1",
    "price": 29.99,
    "description": "A sample product",
    "images": ["image_url"]
  }
]
```

---

## Getting Started
### Prerequisites
- Flutter SDK installed
- IDE with Flutter support (e.g., Android Studio, VS Code)

### Steps to Run
1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Use `flutter run` to launch the app.

---

## Additional Notes
- This project is designed as a sample to demonstrate architecture and best practices.
- Future enhancements can include:
    - Pagination for product listing
    - Search and filter functionality
    - Detailed product view

---