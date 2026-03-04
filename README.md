<div align="center">
  <h1>🚀 CoinLens - The Modern Digital Asset Portfolio 📊</h1>
  <p>
    <strong>A next-generation, visually stunning cryptocurrency tracking, portfolio, and exchange demo application built with Flutter.</strong>
  </p>
  <p>
    <i>Featuring Clean Architecture, Cubit State Management, and robust light/dark theming! 🎨</i>
  </p>
</div>

---

## 🌟 Overview
**CoinLens** is a high-quality demonstration of modern Flutter mobile application development. It elegantly showcases how to build a scalable, maintainable, and highly responsive digital asset tracker. With a strong emphasis on pixel-perfect UI/UX, robust architectural patterns, and dynamic theming, this project serves as a comprehensive boiler-plate for financial and crypto-based applications.

## ✨ Key Features
- 🌗 **Dynamic Theming Engine:** Effortlessly syncs with OS-level settings and allows manual override for a polished **Light** and **Dark Mode** experience.
- 🔐 **Secure Authentication & Biometrics:** Full Firebase Auth integration combined with local Biometric fingerprint/Face ID setup for seamless user access.
- 📈 **Real-Time Market Data:** Browse trending coins, top gainers, and visualize market performance in detailed charts.
- 💳 **Payment & Mock Transactions:** A fully orchestrated mock payment flow with highly responsive Success overlays and UI handling.
- 🔎 **Powerful Search & Filtering:** Quickly locate digital assets with beautifully themed input components.
- 🏗️ **Architectural Excellence:** Built entirely on **Strict Clean Architecture** separating Data, Domain, and Presentation layers.

## 🛠️ Technology Stack
This project follows strict software engineering disciplines for enterprise-grade scalability:
* **Framework:** Flutter & Dart 🦅
* **State Management:** [flutter_bloc’s Cubit](https://pub.dev/packages/flutter_bloc) 🧱
* **Architecture:** Clean Architecture + Dependency Injection (`get_it`) 🧼
* **Networking:** `Dio` & `Retrofit` generators with centralized interceptors 📡
* **Backend:** Firebase Authentication & Firestore 🔥
* **Local Storage:** `SharedPreferences` for user session & theme retention 💾
* **Code Generation:** `build_runner` and `JsonSerializable` ⚙️

## 📁 Project Structure highlights
This repository is carefully divided by feature, obeying dependency rules (Presentation → Domain → Data):
```
lib/
├── core/                  # Global utilities, DI setup, Themes, Network abstractions
└── features/
    ├── auth/              # Biometrics, Login, and User Lifecycle 
    ├── home/              # Market overview, top gainers, balance cards
    ├── market/            # Asset search, coin listings
    ├── payment/           # Checkout flow, credit card inputs, mocked transactions
    ├── profile/           # Portfolio charts, user stats legend
    └── settings/          # Theme toggles and global app configurations
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed.
- Android Studio or Xcode for compiling emulators/builds.
- `flutter pub get` and code-generation ready.

### Installation
1. Clone the repository:
```bash
git clone https://github.com/yourusername/crypto_demo.git
cd crypto_demo
```
2. Install dependencies:
```bash
flutter pub get
```
3. Generate DI, API, and Data layer models:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
4. Run the application:
```bash
flutter run
```

## 📜 Doctrine & Guidelines
The contributor team adheres strictly to the **Flutter Engineering Doctrine** defined within this project:
- ❌ No logic inside Widgets.
- ❌ No God Cubits.
- ❌ No hardcoded colors or dimension magic numbers.
- ✅ Pure Dart logic in the Domain layer.
- ✅ `ApiResult` & comprehensive error handling for networking.
- ✅ Composition over inheritance.

---

<div align="center">
  <sub>Built with ❤️ utilizing Clean Architecture patterns.</sub>
</div>
