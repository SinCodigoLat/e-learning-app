# E-Learning - Online Course Mobile App

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=Dart&logoColor=white)

A mobile application built with Flutter for online courses, providing users with a seamless learning experience. This app allows users to browse courses, watch video lectures, complete quizzes, and track their progress.

## Features

- **User Authentication**: Secure login and registration using Firebase Authentication.
- **Course Catalog**: Browse and search for available courses.
- **Video Lectures**: Watch course videos with a built-in video player.
- **Quizzes**: Take quizzes to test your knowledge after completing a course.
- **Progress Tracking**: Track your course progress and achievements.
- **Offline Access**: Download courses for offline access.

## Screenshots


<img src="https://github.com/tungdevpro/e-learning/blob/main/screenshots/IMG_F7886A227CBF-1.jpeg?raw=true" width="300" />



## Getting Started

### Prerequisites

- Flutter SDK (version 3.24.3 or higher)
- Dart (version 3.5.3 or higher)
- Firebase account (for authentication and database)
- An IDE (e.g., Android Studio, VS Code)

### Installation

1. **Clone the repository**:
```bash
git clone git@github.com:tungdevpro/e-learning.git
cd e-learning
```

2. **Clone the repository**:
```bash
flutter pub get
```

3. **Start Mock API Server**:
    ```bash
    python3 api_server.py
    ```
    
4. **Run the app**:
    - Development mode (with mock server):
        ```bash
        flutter run --flavor dev --target=lib/main_dev.dart
        ```
    - Quick start (both server and app):
        ```bash
        ./start_dev.sh
        ```
    - Production mode:
        ```bash
        flutter run --flavor prod --target=lib/main_prod.dart
        ```

## Mock API Server

This project includes a local mock API server for development. The server provides realistic data for all app features.

### Available Endpoints:
- `GET /api/courses/popular` - Popular courses
- `GET /api/categories` - Course categories  
- `GET /api/mentors` - List of mentors
- `GET /api/profile` - User profile
- `GET /api/promote` - Active promotions
- `GET /api/search/suggestions` - Search suggestions
- `GET /api/search/history` - Search history
- `GET /api/courses` - All courses
- `GET /api/course/{id}` - Specific course
- `GET /api/courses/{id}/lessons` - Course lessons
- `GET /api/courses/{id}/reviews` - Course reviews

### Server Details:
- **Port**: 3001
- **Base URL**: http://localhost:3001 (supports both /api/ and direct routes)
- **Data**: Stored in `db.json`
- **Script**: `api_server.py`

## Contributing

Contributions are welcome! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (\`git checkout -b feature/YourFeatureName\`).
3. Commit your changes (\`git commit -m 'Add some feature'\`).
4. Push to the branch (\`git push origin feature/YourFeatureName\`).
5. Open a pull request.


## Contact

For any questions or feedback, feel free to reach out:

- **Tung Do Minh** - [tungdo21899@gmail.com](mailto:tungdo21899@gmail.com)
- **Project Link**: [https://github.com/tungdevpro/e-learning](https://github.com/tungdevpro/e-learning)