# Wahj Coffee Shop Management System

Wahj is a Java Swing desktop application for managing a coffee shop.

The system allows customers to browse products, add items to cart, place orders, and allows admins to manage products and view/export customer orders.

## Project Description


The project demonstrates object-oriented programming concepts by separating the system into different classes, where each class has a clear responsibility. The application uses Java Swing for the graphical user interface, MySQL for storing data, JDBC for database connection, and FileWriter for exporting data to a text file.

The system has two main user roles:

- Customer
- Admin

Customers can register, login, browse the menu, search products, filter products by category, sort products by name or price, add items to cart, remove items from cart, select a payment method, and place orders.

Admins can login to a dashboard, add new products, update existing products, delete products, view customer orders, view order items, and export orders to a text file.

## Features

### Customer Features

- Customer registration
- Customer login
- Browse coffee shop menu
- Search products
- Filter products by category
- Sort products by name or price
- Add products to cart
- Remove items from cart
- View total cart price
- Select payment method
- Place order

### Admin Features

- Admin login
- Add new products
- Update existing products
- Delete products
- View customer orders
- View order items
- Export orders to orders.txt

## Technologies Used

- Java
- Java Swing
- MySQL
- JDBC
- File handling using FileWriter
- Object-Oriented Programming concepts

## Main Classes

| Class | Description |
|---|---|
| Main.java | Starts the application |
| BaseFrame.java | Contains shared GUI design, colors, logo, header, and button style |
| HomeFrame.java | Displays the home page |
| LoginFrame.java | Handles customer and admin login |
| RegisterFrame.java | Handles customer registration |
| MenuFrame.java | Displays products, search, filtering, sorting, and add-to-cart |
| CartFrame.java | Displays cart items, total price, payment method, and order confirmation |
| AdminDashboardFrame.java | Allows admin to manage products, view orders, and export orders |
| DBConnection.java | Handles database connection and safely closes database resources |
| Session.java | Stores current user session and cart data |

## Database

The project uses a MySQL database named:

wahj_db

The database includes the following tables:

- Admin
- Customer
- Product
- Orders
- Order_Items
- Payment

A database script is included:

wahj_db.sql

This script creates the database, creates all required tables, and inserts sample data.

## How to Start the App

Follow these steps to run the Wahj Coffee Shop Management System:

### 1. Download or Clone the Project

download the project as a ZIP file from GitHub and extract it.

### 2. Open the Project

Open the project using NetBeans, VS Code, IntelliJ IDEA, or any Java IDE.

Recommended:

Open the main project folder, not only the src folder.

### 3. Start MySQL

Make sure MySQL Server is running on your device.

### 4. Import the Database

Open MySQL Workbench and run the database script: wahj_db.sql

This will create the database: wahj_db

and insert the required sample data.

### 5. Update Database Connection

Open:

src/wahj/DBConnection.java

Change the MySQL username and password to match your device:

private static final String USER = "root";
private static final String PASSWORD = "your_mysql_password";

### 6. Add MySQL Connector/J

If the project cannot connect to the database, add the MySQL Connector/J library to the project.

In NetBeans:

Right click project → Properties → Libraries → Add JAR/Folder → Select mysql-connector-j.jar

### 7. Run the Application

Run the file:

src/wahj/Main.java

The app will open from the Home page.

### 8. Login Information

Admin login:

Email: admin@wahj.com
Password: admin123

Sample customer login:

Email: fawaz@gmail.com
Password: 1234

You can also create a new customer account from the Register page.


## File Handling Feature

The project includes a file export feature in the Admin Dashboard.

When the admin clicks:

Export Orders

The system creates a file named:

orders.txt

The file contains exported order information such as:

- Order ID
- Customer name
- Total amount

## Images

The project uses images for the logo and product items.

Make sure the images folder stays inside the project.

Product image names should match the product names using lowercase letters and underscores.

Example:

Iced Latte → iced_latte.png
Hot Chocolate → hot_chocolate.png

## Notes

- MySQL must be running before starting the application.
- The database name must be wahj_db.
- Passwords are stored as plain text for simplicity in this course project.
- In a real system, passwords should be hashed before storing.
- The cart is stored temporarily in the session.
- Orders are stored permanently in the database.
- The generated orders.txt file may appear in the main project folder after exporting orders.

Developed as part of the CSC236 Object-Oriented Programming course project.
