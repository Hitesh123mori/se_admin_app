# Savyasachi Engineering Admin Panel

Welcome to the GitHub repository for Savyasachi Engineering's Admin Panel. This application is designed to streamline operations for administrators by enabling them to manage clients, products, and facilities effectively. Built with Flutter and Firebase, the Admin Panel incorporates real-time database functionalities for immediate updates across platforms and utilizes OTP-based login for enhanced security.

## Features

The Savyasachi Admin Panel offers the following main features:

- **Client Management:** Add and manage client details seamlessly.
- **Product Management:** Add products to the database, including descriptions, specifications, and pricing.
- **Facility Management:** Manage details regarding different facilities, including location, capacity, and availability.

Each feature is developed to work in real-time, ensuring that all changes are immediately reflected across all user interfaces.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

Before you begin, ensure you have the following tools installed on your system:
- Flutter (latest version)
- Dart (latest version)
- An IDE (preferably Android Studio or Visual Studio Code)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/SavyasachiEngineering/admin-panel.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd admin-panel
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Run the application:**

   ```bash
   flutter run
   ```

### Firebase Configuration

To connect the app with Firebase:

1. Create a new project in the Firebase console.
2. Add your app to the Firebase project and download the `google-services.json` for Android or `GoogleService-Info.plist` for iOS.
3. Place the file in the appropriate directory (`android/app/` or `ios/Runner/`).
4. Configure the Firebase real-time database and set up Firebase Authentication with OTP.

## Usage

After installation and setup, use the following guides to navigate and utilize the admin panel:

- **Login:** Start by logging in using the OTP sent to your registered mobile number.
- **Dashboard:** View a summary of clients, products, and facilities.
- **Add Clients:** Navigate to the Clients section and use the 'Add Client' form to enter client details.
- **Add Products:** Go to the Products section and fill out the product form to include new products in your inventory.
- **Manage Facilities:** Use the Facilities section to update or add new facility information.

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.

## Contact

For any queries, you can reach out to [admin@savyasachiengineering.com](mailto:db.savyasachi@gmail.com).

Thank you for choosing Savyasachi Engineering's Admin Panel to manage your operational needs efficiently.
