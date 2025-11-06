# Department App

A comprehensive Flutter mobile application for managing department information, including faculty profiles, infrastructure details, and user profiles with theme customization.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## 📱 Features

### 🔐 Authentication
- **Sign Up**: Create new user accounts with username, email, and password
- **Login**: Secure authentication with form validation
- **Data Persistence**: User credentials stored locally using SharedPreferences

### 👥 People Management
- View list of instructors with profile pictures
- Search functionality to filter instructors by name, title, email, or office
- Detailed instructor information including:
  - Name and title
  - Phone number
  - Email address
  - Office location
- **Call Integration**: Direct phone dialer integration with confirmation dialog
- Professional profile pictures for each instructor

### 🏢 Infrastructure
- Grid view of department classrooms and facilities
- High-quality images for each location
- Search functionality to filter by room name or description
- **Double-tap to enlarge**: Full-screen image viewer with zoom capabilities
- Interactive image viewing with pinch-to-zoom and pan features
- Detailed information for each facility including capacity and equipment

### 👤 User Profile
- Editable profile information:
  - Username
  - Email
  - Phone number
  - Bio
- Profile picture with avatar (displays user's initial)
- **Dark/Light Theme Toggle**: Seamless theme switching
- Account information display (account type, member since, status)
- Save and cancel functionality for profile edits

### 🎨 Theme Support
- **Light Mode**: Clean, modern light theme
- **Dark Mode**: Eye-friendly dark theme
- Theme preference persists across app restarts
- Smooth theme transitions

## 📸 Screenshots

*(Add your screenshots here)*

## 🛠️ Technologies Used

- **Flutter**: Cross-platform mobile development framework
- **Dart**: Programming language
- **SharedPreferences**: Local data storage
- **url_launcher**: Phone dialer integration
- **Material Design**: UI/UX design system

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.0.0
  url_launcher: ^6.0.0
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- Android Studio / VS Code
- Android Emulator or Physical Device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/department-app.git
   cd department-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Building for Release

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── models/
│   ├── instructor.dart                # Instructor data model
│   └── classroom_image.dart           # Classroom data model
└── screens/
    ├── login_page.dart                # Login screen
    ├── signup_page.dart               # Sign up screen
    ├── home_page.dart                 # Main navigation screen
    ├── people_page.dart               # Instructors list with search
    ├── infrastructure_page.dart       # Classrooms grid with search
    ├── profile_page.dart              # User profile and settings
    └── enlarged_image_page.dart       # Full-screen image viewer
```

## 🔑 Key Features Explained

### Search Functionality
Both People and Infrastructure pages include real-time search:
- Case-insensitive filtering
- Searches across multiple fields
- Instant results as you type
- Clear button to reset search

### Image Viewing
Infrastructure images support:
- Double-tap to open full-screen view
- Pinch-to-zoom (0.5x to 4x)
- Pan to navigate zoomed images
- Loading indicators
- Error handling for failed image loads

### Profile Management
- Edit mode with save/cancel options
- Form validation for email and required fields
- Theme toggle with immediate visual feedback
- Data persistence across app restarts

### Phone Integration
- Native phone dialer integration
- Confirmation dialog before calling
- Error handling for devices without dialer
- Works on real Android/iOS devices

## 🎯 Usage

1. **First Time Setup**
   - Launch the app
   - Click "Sign Up" to create an account
   - Fill in username, email, and password
   - Click "Sign Up" to register

2. **Login**
   - Enter your username and password
   - Click "Login" to access the app

3. **Navigate**
   - Use bottom navigation to switch between:
     - **People**: View and search instructors
     - **Infrastructure**: Browse facility images
     - **Profile**: Manage your profile and settings

4. **Search**
   - Tap the search bar at the top
   - Type to filter results
   - Tap the X icon to clear search

5. **Call Instructor**
   - Navigate to People page
   - Tap "Call" button on any instructor card
   - Confirm the call in the dialog
   - Phone dialer opens with pre-filled number

6. **View Images**
   - Navigate to Infrastructure page
   - Double-tap any classroom image
   - Pinch to zoom, drag to pan
   - Tap back button to return

7. **Toggle Theme**
   - Go to Profile tab
   - Toggle the "Dark Mode" switch
   - Theme changes immediately

## 🐛 Known Issues

- Phone dialer may not work on Android emulators (works on real devices)
- Image loading requires internet connection

## 🔮 Future Enhancements

- [ ] Profile picture upload
- [ ] Email integration for contacting instructors
- [ ] Calendar integration for scheduling
- [ ] Push notifications
- [ ] Multi-language support
- [ ] Offline mode with local database
- [ ] Social features (comments, ratings)
- [ ] Advanced filtering and sorting
- [ ] Export/import data functionality

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@YOUR_USERNAME](https://github.com/YOUR_USERNAME)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Unsplash for providing free stock images
- Material Design for UI/UX guidelines
- All contributors and testers

## 📞 Support

For support, email your.email@example.com or open an issue in the GitHub repository.

---

Made with ❤️ using Flutter
