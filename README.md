# Department App 🎓

A modern Flutter mobile application for managing department information, including people directory and infrastructure details with a beautiful dark/light theme support.

## 📱 Features

### 🔐 Authentication
- **Sign Up**: Create new user accounts with email validation
- **Login**: Secure login system with password visibility toggle
- **Local Storage**: User credentials stored securely using SharedPreferences
- **Password Recovery**: Forgot password functionality

### 👥 People Directory
- **Instructor List**: View all department instructors with profile pictures
- **Search Functionality**: Real-time search by name, title, email, or office
- **Contact Information**: Display name, title, phone, email, and office location
- **Call Feature**: Direct call functionality with confirmation dialog
- **Professional Profiles**: High-quality profile images for each instructor

### 🏢 Infrastructure Management
- **Classroom Gallery**: Grid view of all department classrooms
- **Image Viewer**: Double-tap to enlarge classroom images
- **Interactive Zoom**: Pinch to zoom and drag to pan on enlarged images
- **Search Functionality**: Filter classrooms by name or description
- **Detailed Information**: Capacity, equipment, and facility details

### 👤 Profile Management
- **Editable Profile**: Update username, email, phone number, and bio
- **Profile Picture**: Avatar with first letter of username
- **Account Information**: View account type, member since date, and status
- **Theme Toggle**: Switch between dark and light modes
- **Persistent Settings**: All changes saved locally

### 🎨 UI/UX Features
- **Dark Mode**: Full dark theme support with smooth transitions
- **Light Mode**: Clean and modern light theme
- **Responsive Design**: Adaptive layouts for different screen sizes
- **Material Design**: Following Flutter Material Design principles
- **Loading Indicators**: Visual feedback for async operations
- **Error Handling**: User-friendly error messages

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)
- Android Studio / VS Code
- Android Emulator or Physical Device
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/department_app.git
   cd department_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.2.2  # Local data storage
  url_launcher: ^6.2.2        # Launch URLs and phone calls
```

## 🏗️ Project Structure

```
lib/
├── main.dart                      # App entry point and theme configuration
├── models/
│   ├── instructor.dart           # Instructor data model
│   └── classroom_image.dart      # Classroom data model
└── screens/
    ├── login_page.dart           # Login screen
    ├── signup_page.dart          # Sign up screen
    ├── home_page.dart            # Main navigation screen
    ├── people_page.dart          # Instructors list with search
    ├── infrastructure_page.dart  # Classrooms grid with search
    ├── profile_page.dart         # User profile and settings
    └── enlarged_image_page.dart  # Full-screen image viewer
```

## 🎯 How to Use

### First Time Setup
1. Launch the app
2. Click **"Sign Up"** to create an account
3. Fill in your details (username, email, password)
4. Click **"Sign Up"** button
5. Return to login and enter your credentials

### Navigation
- **People Tab**: View and search instructors, tap "Call" to contact
- **Infrastructure Tab**: Browse classrooms, double-tap images to enlarge
- **Profile Tab**: Edit your profile and toggle dark/light mode

### Making Calls
1. Navigate to **People** tab
2. Scroll to find an instructor or use search
3. Tap the green **"Call"** button
4. Review information in the confirmation dialog
5. Tap **"Yes"** to initiate the call

### Viewing Classroom Details
1. Navigate to **Infrastructure** tab
2. Double-tap any classroom card
3. Use pinch gestures to zoom
4. Drag to pan around the image
5. View capacity and equipment details at the bottom

### Customizing Theme
1. Navigate to **Profile** tab
2. Toggle the **"Dark Mode"** switch
3. Theme changes instantly across the app
4. Preference is saved automatically

## 📸 Screenshots

### Light Theme
- Clean and professional interface
- High contrast for readability
- Material Design color scheme

### Dark Theme
- Eye-friendly dark background
- Reduced eye strain
- Perfect for low-light environments

## 🔧 Configuration

### Adding New Instructors

Edit `lib/screens/people_page.dart`:

```dart
static final List<Instructor> instructors = [
  Instructor(
    name: 'Dr. Your Name',
    title: 'Your Title',
    phone: '+1234567890',
    email: 'your.email@university.edu',
    office: 'Room XXX',
    imageUrl: 'https://your-image-url.com/image.jpg',
  ),
  // Add more instructors...
];
```

### Adding New Classrooms

Edit `lib/screens/infrastructure_page.dart`:

```dart
static final List<ClassroomImage> classrooms = [
  ClassroomImage(
    name: 'Your Room Name',
    imageUrl: 'https://your-image-url.com/room.jpg',
    description: 'Capacity: XX students, Equipment: Your equipment',
  ),
  // Add more classrooms...
];
```

## 🛠️ Customization

### Change App Colors

Edit `lib/main.dart`:

```dart
theme: ThemeData(
  primarySwatch: Colors.blue, // Change to your color
  // ... other theme properties
),
```

### Modify Authentication

The app uses `SharedPreferences` for local storage. For production, consider:
- Firebase Authentication
- Backend API integration
- Secure token storage

## 🐛 Known Issues

- **Phone Calls on Emulator**: Phone dialer may not work on Android emulators without a dialer app installed. Works perfectly on real devices.
- **Image Loading**: Requires internet connection to load profile and classroom images.

## 🔮 Future Enhancements

- [ ] Backend API integration
- [ ] Real-time data synchronization
- [ ] Push notifications
- [ ] Calendar integration
- [ ] Course scheduling
- [ ] Attendance tracking
- [ ] Announcements feed
- [ ] Document sharing
- [ ] Multi-language support
- [ ] Biometric authentication

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Unsplash for high-quality images
- Material Design for UI/UX guidelines
- Community contributors

## 📞 Support

If you encounter any issues or have questions:
1. Check the [Issues](https://github.com/YOUR_USERNAME/department_app/issues) page
2. Create a new issue with detailed description
3. Contact the maintainer

## 🌟 Show Your Support

Give a ⭐️ if this project helped you!

---

**Made with ❤️ using Flutter**
