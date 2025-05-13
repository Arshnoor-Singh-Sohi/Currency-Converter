# Currency Converter

A comprehensive Flutter application that converts USD to INR with both Material Design (Android) and Cupertino Design (iOS) implementations. This project demonstrates fundamental Flutter concepts including state management, UI design principles, and platform-specific styling.


## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [App Demo](#app-demo)
- [Project Architecture](#project-architecture)
- [Implementation Details](#implementation-details)
  - [Material Design Implementation](#material-design-implementation)
  - [Cupertino Design Implementation](#cupertino-design-implementation)
  - [State Management](#state-management)
- [Code Structure](#code-structure)
- [Flutter Concepts Demonstrated](#flutter-concepts-demonstrated)
- [Setup Instructions](#setup-instructions)
- [Usage Guide](#usage-guide)
- [Development Process](#development-process)
- [Performance Considerations](#performance-considerations)
- [Learning Resources](#learning-resources)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

Currency Converter is a simple yet powerful Flutter application that allows users to convert USD amounts to INR using a fixed exchange rate. The application features both Material Design and Cupertino Design implementations, showcasing Flutter's capability to adapt to different platform aesthetics while maintaining the same core functionality.

This project serves as an excellent starting point for Flutter beginners to understand the fundamentals of building cross-platform applications with platform-specific UI elements.

## Features

- **Dual Design Implementation**: Both Material (Android) and Cupertino (iOS) design interfaces
- **Real-time Conversion**: Instantly converts USD to INR
- **User-friendly Interface**: Clean and intuitive user experience
- **Input Validation**: Handles numeric input with decimal places
- **Responsive Design**: Adapts to different screen sizes
- **Platform-Specific Styling**: Uses native design elements for each platform

## App Demo

### Material Design (Android)

<table>
  <tr>
  </tr>
  <tr>
    <td align="center">Initial State</td>
    <td align="center">Input State</td>
    <td align="center">Result State</td>
  </tr>
</table>

### Cupertino Design (iOS)

<table>
  <tr>
  </tr>
  <tr>
    <td align="center">Initial State</td>
    <td align="center">Input State</td>
    <td align="center">Result State</td>
  </tr>
</table>

## Project Architecture

The app follows a simple yet effective architecture:

```
lib/
  ├── main.dart                         # Entry point, app initialization
  ├── currency_converter_material_page.dart   # Material design implementation
  └── currency_converter_cupertino_page.dart  # Cupertino design implementation
```

### Architecture Diagram

```
┌─────────────────────────────────────────┐
│                                         │
│                 main.dart               │
│                     │                   │
│         ┌───────────┴───────────┐       │
│         │                       │       │
│  MyApp (Material)     MyCupertinoApp   │
│         │                       │       │
│         │                       │       │
│  CurrencyConverter      CurrencyConverter │
│    MaterialPage           CupertinoPage  │
│         │                       │       │
│         └───────────┬───────────┘       │
│                     │                   │
│            Conversion Logic             │
│                                         │
└─────────────────────────────────────────┘
```

## Implementation Details

### Material Design Implementation

The Material Design implementation (`CurrencyConverterMaterialPage`) uses Flutter's Material widgets to create an Android-styled interface. Let's dive into the key components:

```dart
class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPage();
}
```

The class is defined as a `StatefulWidget` because it needs to manage the state of the conversion result. This is a fundamental Flutter concept where widgets that need to maintain state across rebuilds are implemented as `StatefulWidget`.

```dart
class _CurrencyConverterMaterialPage extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
```

The state class defines two important fields:
- `result`: Stores the conversion result
- `textEditingController`: Controls the text input field and allows reading its value

```dart
  void convert() {
    result = double.parse(textEditingController.text) * 81;
    setState(() { });
  }
```

The `convert()` method:
1. Reads the value from the text controller
2. Parses it to a double
3. Multiplies it by the exchange rate (81)
4. Updates the state with `setState()` to trigger a rebuild of the UI

```dart
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
```

The `dispose()` method is important for freeing resources. It prevents memory leaks by disposing of the `TextEditingController` when the widget is removed from the widget tree.

The `build` method constructs the Material UI with these key elements:
- A `Scaffold` with a blueGrey background
- An `AppBar` with the app title
- A centered `Column` containing:
  - Text to display the result
  - A `TextField` for input
  - An `ElevatedButton` to trigger conversion

### Cupertino Design Implementation

The Cupertino Design implementation (`CurrencyConverterCupertinoPage`) follows the same logical pattern but uses iOS-styled widgets.

Key differences in the implementation include:
- `CupertinoPageScaffold` instead of `Scaffold`
- `CupertinoNavigationBar` instead of `AppBar`
- `CupertinoTextField` instead of `TextField`
- `CupertinoButton` instead of `ElevatedButton`

These substitutions ensure that the app feels native on iOS devices.

### State Management

Both implementations use Flutter's basic state management approach with `setState()`. When the conversion button is pressed:

1. The `convert()` method calculates the result
2. `setState()` is called to update the UI
3. The `build` method is re-executed with the new value
4. The result text is updated to show the converted amount

This simple approach works well for this app due to its straightforward requirements.

## Code Structure

### Main Application (main.dart)

```dart
void main() {
  runApp(const MyCupertinoApp());
}
```

The entry point of the application currently initializes the Cupertino version. To switch to Material Design, you would change this to `MyApp()`.

```dart
class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMaterialPage(),
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterCupertinoPage(),
    );
  }
}
```

These two classes define the root of the widget tree for each platform. The only difference is the type of app (`MaterialApp` vs `CupertinoApp`) and the home page.

### Material Design Implementation (currency_converter_material_page.dart)

```dart
final border = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 2.0,
    style: BorderStyle.solid,
  ),
  borderRadius: BorderRadius.circular(5),
);
```

The Material implementation defines a reusable border style for the text field, demonstrating code reuse.

```dart
Text(
  'INR ${result!=0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
  style: const TextStyle(
    fontSize: 55,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
),
```

The result display uses conditional formatting to show decimal places only when the result is non-zero, improving readability.

```dart
TextField(
  controller: textEditingController,
  style: const TextStyle(
    color: Colors.black,
  ),
  decoration: InputDecoration(
    hintText: 'Please enter the amount in USD',
    hintStyle: const TextStyle(
      color: Colors.black,
    ),
    prefixIcon: const Icon(Icons.monetization_on_outlined),
    prefixIconColor: Colors.black,
    filled: true,
    fillColor: Colors.white,
    focusedBorder: border,
    enabledBorder: border,
  ),
  keyboardType: const TextInputType.numberWithOptions(
    decimal: true,
  ),
),
```

The input field is configured with:
- A controller to access the input value
- Styling for text and background
- A prefix icon (dollar sign)
- A numeric keyboard with decimal option
- Custom border styles for different states

```dart
ElevatedButton(
  onPressed: convert,
  style: ElevatedButton.styleFrom(
    elevation: 15,
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  child: const Text('Convert'),
),
```

The conversion button spans the full width and has a customized appearance, including elevation for a 3D effect.

### Cupertino Design Implementation (currency_converter_cupertino_page.dart)

The Cupertino implementation follows the same structure but uses iOS-native widget styles:

```dart
CupertinoTextField(
  controller: textEditingController,
  style: const TextStyle(
    color: CupertinoColors.black,
  ),
  decoration: BoxDecoration(
    color: CupertinoColors.white,
    border: Border.all(),
    borderRadius: BorderRadius.circular(5),
  ),
  placeholder: 'Please enter the amount in USD',
  prefix: const Icon(CupertinoIcons.money_dollar),
  keyboardType: const TextInputType.numberWithOptions(
    decimal: true,
  ),
),
```

Note the differences from the Material version:
- Uses `CupertinoTextField` instead of `TextField`
- Has a `decoration` property that expects a `BoxDecoration`
- Uses `placeholder` instead of `hintText`
- Uses `prefix` instead of `prefixIcon`
- Uses Cupertino-specific colors and icons

## Flutter Concepts Demonstrated

This app demonstrates several fundamental Flutter concepts:

### 1. Widget Types
- **StatelessWidget**: Used for the app wrapper classes (`MyApp`, `MyCupertinoApp`)
- **StatefulWidget**: Used for the converter pages to maintain state

### 2. Widget Lifecycle
- **createState()**: Called when a StatefulWidget is created
- **build()**: Called to render the UI
- **dispose()**: Called when a widget is removed from the tree

### 3. State Management
- Using `setState()` to update the UI when data changes
- Using `TextEditingController` to manage text input

### 4. Platform-Specific Design
- Material Design for Android
- Cupertino Design for iOS

### 5. Layout and Styling
- Using `Column` for vertical arrangement
- Styling text with `TextStyle`
- Customizing input fields
- Styling buttons

### 6. Input Handling
- Configuring keyboard type
- Handling user input
- Parsing string to numeric values

## Setup Instructions

### Prerequisites
- Flutter SDK (version 3.0.0 or higher)
- Dart SDK (version 2.17.0 or higher)
- Android Studio or VSCode with Flutter extensions
- An emulator or physical device for testing

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Arshnoor-Singh-Sohi/Currency-Converter.git
   cd Currency-Converter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Switching Between Material and Cupertino

To switch between the Material and Cupertino versions, edit the `main.dart` file:

For Material (Android):
```dart
void main() {
  runApp(const MyApp());
}
```

For Cupertino (iOS):
```dart
void main() {
  runApp(const MyCupertinoApp());
}
```

## Usage Guide

1. **Launch the app** on your device or emulator
2. **Enter a USD amount** in the text field
3. **Press the "Convert" button**
4. **View the result** in INR displayed at the top

## Development Process

### Design Decisions

1. **Separate Implementations**:
   - Rather than using platform detection, the app demonstrates both implementations separately
   - This makes it easier to understand the differences between Material and Cupertino designs

2. **Fixed Exchange Rate**:
   - For simplicity, the app uses a fixed exchange rate (1 USD = 81 INR)
   - In a production app, this would be replaced with an API call

3. **Minimal State**:
   - Only essential state is maintained (input and result)
   - No complex state management needed for this simple app

### Flutter Architecture Flow

```
┌───────────────────┐     ┌───────────────────┐     ┌───────────────────┐
│                   │     │                   │     │                   │
│  User Input Event │────▶│  State Update     │────▶│  Widget Rebuild   │
│                   │     │                   │     │                   │
└───────────────────┘     └───────────────────┘     └───────────────────┘
         │                                                    │
         └────────────────────────────────────────────────────┘
                             Continuous Flow
```

## Performance Considerations

This app is very lightweight and performant, but here are a few considerations:

1. **TextEditingController Disposal**:
   - The app properly disposes of controllers to prevent memory leaks

2. **Minimal Rebuilds**:
   - Only the necessary widgets are rebuilt when the state changes

3. **Parsing Performance**:
   - `double.parse()` is used for conversion, which is efficient but doesn't handle invalid input

4. **UI Responsiveness**:
   - The UI updates immediately after calculation, providing good user feedback

## Learning Resources

For those looking to understand this project better or build similar apps:

1. **Flutter Documentation**:
   - [Flutter.dev](https://flutter.dev/docs)
   - [Material Design in Flutter](https://flutter.dev/docs/development/ui/widgets/material)
   - [Cupertino Design in Flutter](https://flutter.dev/docs/development/ui/widgets/cupertino)

2. **State Management Concepts**:
   - [Flutter State Management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/intro)

3. **Layout Tutorials**:
   - [Flutter Layout Tutorial](https://flutter.dev/docs/development/ui/layout/tutorial)

4. **Input Handling**:
   - [Text Input in Flutter](https://flutter.dev/docs/cookbook/forms/text-input)

## Troubleshooting

### Common Issues

1. **Invalid Input Handling**:
   - Currently, entering non-numeric values will cause an error
   - Solution: Implement input validation before parsing

2. **Fixed Exchange Rate**:
   - The exchange rate is hardcoded as 81
   - For real-world use, implement an API call to get current rates

3. **Precision Issues**:
   - For very large or small numbers, consider using different precision settings

### Debugging Tips

1. Use `print` statements to debug state changes:
   ```dart
   void convert() {
     print("Converting value: ${textEditingController.text}");
     result = double.parse(textEditingController.text) * 81;
     setState(() { });
     print("New result: $result");
   }
   ```

2. Use Flutter DevTools for more advanced debugging

## Contributing

Contributions to improve the Currency Converter app are welcome! Here's how you can contribute:

1. **Fork the repository**
2. **Create a new branch** (`git checkout -b feature/your-feature-name`)
3. **Make your changes**
4. **Commit your changes** (`git commit -m 'Add some feature'`)
5. **Push to the branch** (`git push origin feature/your-feature-name`)
6. **Open a Pull Request**

### Improvement Ideas

1. Add real-time exchange rates using an API
2. Add support for multiple currencies
3. Implement error handling for invalid inputs
4. Add a history of previous conversions
5. Improve the UI with animations
6. Add a dark mode option

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2023 Arshnoor Singh Sohi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
