# pocket_wallet
#### A Flutter project for my flutter cource 

Pocket Wallets is a Flutter application designed to help you manage your transactions efficiently. It allows you to add, view, sort, and delete transactions with ease.

## Features

- Add new transactions with details such as amount, name, subtitle, date, and icon.
- View a list of all transactions.
- Sort transactions by ID, amount, or date in ascending or descending order.
- Group transactions by month.
- Delete transactions with a confirmation prompt.
- Toggle between light and dark themes.

## API Endpoints

The app interacts with a backend server to manage transactions. The following endpoints are used:

- `apinew.php`: Adds a new transaction.
- `api.php`: Fetches all transactions.
- `apidelet.php`: Deletes a transaction.

## Project Structure

- `lib/`: Contains the main source code for the Flutter application.
  - `api/`: Contains API-related files for database interactions.
  - `pages/`: Contains the different pages/screens of the app.
  - `style.dart`: Contains theme and styling information.
  - `transaction_class.dart`: Defines the `Transaction` class.
- `assets/`: Contains any assets such as images or fonts.
- `pubspec.yaml`: Contains metadata about the project and its dependencies.
