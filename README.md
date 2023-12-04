# product_app
 
This repository contains a mobile application for managing products and a backend server to support its functionality.

Mobile App
Setup
To run the mobile app:

Ensure you have Flutter installed. If not, follow the Flutter installation guide.
Run flutter pub get in the project directory to fetch all required packages.
Usage
Once you have the necessary packages:

Launch your preferred emulator or connect a physical device.
Run flutter run in the project directory to start the application.
Backend Server
Setup
For the backend server:

Navigate to the project folder and locate the server directory.
Copy the server folder to the htdocs directory of your XAMPP installation.
Configuration
Open the home.dart file in the lib directory of your Flutter project.
Locate the fetchData function and replace the placeholder IP address (ipv4) with your local machine's IP address.
To find your IP address, open Command Prompt (cmd) and type ipconfig. Look for the IPv4 Address entry.
Database Setup
In the server directory, find the sql file.
Access your phpMyAdmin dashboard.
Create a database named products.
Run the SQL code from the sql file within the products database to create tables and insert sample data.
Important Notes
Ensure both the mobile app and backend server are running and properly configured to interact seamlessly.