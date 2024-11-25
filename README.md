# Weather App

A simple and elegant weather application built with SwiftUI and RxSwift that shows current weather conditions for any city. The app demonstrates modern iOS development practices including MVVM architecture, reactive programming, and clean code principles.

![App Screenshot](/api/placeholder/400/320)

## Features

- 🌤 Real-time weather information
- 🔍 Search weather by city name
- 📊 Display temperature, humidity, and temperature range
- 💉 Dependency injection for better testing
- 🎨 Clean and modern SwiftUI interface
- 🔄 Reactive programming with RxSwift
- 🌐 Network layer with Alamofire
- ⚡️ Efficient error handling
- 📱 Responsive design

## Requirements

- iOS 14.0+
- Xcode 13.0+
- Swift 5.5+

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/WeatherApp.git
cd WeatherApp
```

### 2. Install dependencies

The project uses Swift Package Manager for dependency management. The dependencies will be resolved automatically when you open the project in Xcode.

Alternatively, if you prefer CocoaPods, create a Podfile with:

```ruby
platform :ios, '14.0'
use_frameworks!

target 'WeatherApp' do
  pod 'Alamofire'
  pod 'RxSwift'
  pod 'RxCocoa'
end
```

Then run:

```bash
pod install
```

### 3. API Key Setup

1. Get an API key from [OpenWeatherMap](https://openweathermap.org/api)
2. Open `Network/APIManager.swift`
3. Replace `YOUR_API_KEY` with your actual API key:

```swift
private let apiKey = "YOUR_API_KEY"
```

### 4. Build and Run

Open `WeatherApp.xcodeproj` (or `WeatherApp.xcworkspace` if using CocoaPods) and build the project.

## Project Structure

```
WeatherApp/
├── App/
│   └── WeatherApp.swift
├── Models/
│   ├── WeatherModel.swift
│   └── ErrorResponse.swift
├── Views/
│   ├── WeatherView.swift
│   └── Components/
│       ├── SearchBarView.swift
│       ├── LoadingView.swift
│       ├── WeatherContentView.swift
│       ├── WeatherInfoView.swift
│       └── ErrorView.swift
├── ViewModels/
│   └── WeatherViewModel.swift
├── Network/
│   ├── APIManager.swift
│   └── APIManager+Weather.swift
└── Utilities/
    └── NetworkError.swift
```

## Architecture

The app follows the MVVM (Model-View-ViewModel) architecture pattern:

- **Models**: Data structures and business logic
- **Views**: SwiftUI views and UI components
- **ViewModels**: Business logic and data state management
- **Network**: API communication and data fetching

## Dependencies

- [Alamofire](https://github.com/Alamofire/Alamofire): Elegant HTTP Networking
- [RxSwift](https://github.com/ReactiveX/RxSwift): Reactive Programming in Swift

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

- Weather data provided by [OpenWeatherMap](https://openweathermap.org)
- Icons and design inspiration from [Various Sources]

## Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter) - email@example.com

Project Link: [https://github.com/yourusername/WeatherApp](https://github.com/yourusername/WeatherApp)
