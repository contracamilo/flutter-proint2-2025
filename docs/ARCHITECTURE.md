# 🏗️ Arquitectura del Proyecto JUANIA

## 📊 Diagrama de Arquitectura

```
┌─────────────────────────────────────────────────────────────────┐
│                         JUANIA APP                              │
│                 (Asistente Universitario)                       │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
        ┌─────────────────────────────────────────┐
        │         Presentation Layer              │
        │  ┌──────────────────────────────────┐   │
        │  │      UI Components (Flutter)     │   │
        │  │  - Pages - Widgets - Providers   │   │
        │  └──────────────────────────────────┘   │
        └─────────────────────────────────────────┘
                              │
                              ▼
        ┌─────────────────────────────────────────┐
        │            Core Layer                   │
        │  ┌──────────────────────────────────┐   │
        │  │  Theme • Config • Constants      │   │
        │  │  Utils • Shared Widgets          │   │
        │  └──────────────────────────────────┘   │
        └─────────────────────────────────────────┘
                              │
                              ▼
        ┌─────────────────────────────────────────┐
        │           Data Layer                    │
        │  ┌──────────────────────────────────┐   │
        │  │  Local Storage (Hive)            │   │
        │  │  Remote API (Dio/HTTP)           │   │
        │  │  Preferences (SharedPrefs)       │   │
        │  └──────────────────────────────────┘   │
        └─────────────────────────────────────────┘
```

## 📁 Estructura de Directorios

```
juania/
│
├── 📱 lib/
│   ├── 🎯 main.dart                    # Entry point
│   │
│   ├── 🏗️ core/                        # Core functionality
│   │   ├── config/                     # App configuration
│   │   │   └── app_config.dart        # Environment & setup
│   │   │
│   │   ├── constants/                  # App constants
│   │   │   └── app_constants.dart     # Values, routes, messages
│   │   │
│   │   ├── theme/                      # UI theme
│   │   │   ├── app_colors.dart        # Color palette
│   │   │   └── app_theme.dart         # Material theme
│   │   │
│   │   ├── utils/                      # Utilities
│   │   │   └── helpers.dart           # Date, validators, utils
│   │   │
│   │   └── widgets/                    # Shared widgets
│   │       └── common_widgets.dart    # Reusable UI components
│   │
│   └── 🎨 features/                    # App features (modules)
│       │
│       ├── home/                       # Home module
│       │   └── presentation/
│       │       ├── pages/
│       │       │   └── home_page.dart
│       │       └── widgets/
│       │
│       ├── chat/                       # Chat module
│       │   └── presentation/
│       │       ├── pages/
│       │       └── widgets/
│       │
│       └── schedule/                   # Schedule module
│           └── presentation/
│               ├── pages/
│               └── widgets/
│
├── 🖼️ assets/
│   ├── images/                         # App images
│   └── icons/                          # App icons
│
├── 🧪 test/                            # Unit & widget tests
│   └── widget_test.dart
│
├── 📚 docs/                            # Documentation
│   ├── BEST_PRACTICES.md
│   └── PROJECT_SUMMARY.md
│
├── ⚙️ Configuration files
│   ├── .env                           # Environment variables
│   ├── .env.example                   # Environment template
│   ├── .gitignore                     # Git ignore rules
│   ├── analysis_options.yaml          # Linter rules
│   └── pubspec.yaml                   # Dependencies
│
└── 📖 Documentation
    ├── README.md                      # Main documentation
    ├── CONTRIBUTING.md                # Contribution guide
    ├── QUICKSTART.md                  # Quick start guide
    └── LICENSE                        # MIT License
```

## 🔄 Flujo de Datos

```
┌─────────────┐
│    User     │
│  Interaction│
└──────┬──────┘
       │
       ▼
┌─────────────────────────────────────┐
│         UI (Widgets)                │
│  • HomePage                         │
│  • ChatPage                         │
│  • SchedulePage                     │
└──────┬──────────────────────────────┘
       │
       ▼
┌─────────────────────────────────────┐
│    State Management (Provider)      │
│  • TaskProvider                     │
│  • ChatProvider                     │
│  • ScheduleProvider                 │
└──────┬──────────────────────────────┘
       │
       ├──────────────┬────────────────┐
       ▼              ▼                ▼
┌──────────┐   ┌──────────┐    ┌──────────┐
│  Local   │   │   API    │    │  Shared  │
│  Storage │   │ Service  │    │   Prefs  │
│  (Hive)  │   │  (Dio)   │    │          │
└──────────┘   └──────────┘    └──────────┘
```

## 🎯 Feature Module Pattern

Cada feature sigue esta estructura:

```
feature_name/
├── data/                    # Data layer (optional)
│   ├── models/             # Data models
│   ├── datasources/        # API, Local DB
│   └── repositories/       # Repository implementation
│
├── domain/                  # Business logic (optional)
│   ├── entities/           # Pure entities
│   ├── repositories/       # Repository interfaces
│   └── usecases/          # Business use cases
│
└── presentation/           # UI layer (required)
    ├── pages/             # Screen pages
    ├── widgets/           # Feature widgets
    └── providers/         # State management
```

### Ejemplo: Chat Feature

```
chat/
├── presentation/
│   ├── pages/
│   │   └── chat_page.dart
│   ├── widgets/
│   │   ├── message_bubble.dart
│   │   ├── input_field.dart
│   │   └── chat_header.dart
│   └── providers/
│       └── chat_provider.dart
├── models/
│   └── message.dart
└── services/
    └── chat_service.dart
```

## 🔧 Core Components

### 1. Config
```dart
AppConfig
├── Environment variables
├── API configuration
└── App initialization
```

### 2. Theme
```dart
AppTheme
├── Colors (AppColors)
├── Typography (Google Fonts)
├── Component themes
└── Dark/Light modes
```

### 3. Constants
```dart
AppConstants
├── App info
├── API endpoints
├── Timeouts
├── Limits
└── Keys

AppRoutes
└── Navigation paths

AppMessages
└── UI messages
```

### 4. Utils
```dart
DateFormatter
├── formatDate()
├── formatTime()
└── getRelativeTime()

Validators
├── required()
├── email()
├── minLength()
└── maxLength()

Utils
├── capitalize()
├── truncate()
└── formatCurrency()
```

## 🎨 UI Component Hierarchy

```
MaterialApp
└── HomePage (Scaffold)
    ├── AppBar
    │   ├── Title
    │   └── Actions
    │
    ├── Body
    │   └── PageView/IndexedStack
    │       ├── HomeView
    │       ├── ChatView
    │       ├── ScheduleView
    │       └── ProfileView
    │
    └── NavigationBar
        ├── Home Tab
        ├── Chat Tab
        ├── Schedule Tab
        └── Profile Tab
```

## 🔐 Security Layers

```
┌─────────────────────────────────────┐
│   Environment Variables (.env)      │
│   • API Keys                        │
│   • Sensitive Config                │
└─────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│   AppConfig (Runtime)               │
│   • Load & validate env vars        │
└─────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────┐
│   Services (Authorized)             │
│   • API calls with auth             │
└─────────────────────────────────────┘
```

## 📦 Dependency Injection

```
main()
  ├── Initialize AppConfig
  ├── Initialize Hive
  ├── Setup Providers
  │   ├── TaskProvider
  │   ├── ChatProvider
  │   └── ScheduleProvider
  └── Run App
```

## 🧪 Testing Strategy

```
Tests/
├── Unit Tests
│   ├── Utils tests
│   ├── Validators tests
│   └── Service tests
│
├── Widget Tests
│   ├── Common widgets
│   ├── Feature widgets
│   └── Page tests
│
└── Integration Tests
    └── User flow tests
```

## 🚀 Build & Deployment Flow

```
Development
    │
    ├─── flutter run (debug)
    │
    ▼
Testing
    │
    ├─── flutter test
    ├─── flutter analyze
    │
    ▼
Build
    │
    ├─── flutter build apk (Android)
    ├─── flutter build ios (iOS)
    └─── flutter build web (Web)
    │
    ▼
Deployment
    │
    ├─── Play Store (Android)
    ├─── App Store (iOS)
    └─── Vercel/Netlify (Web)
```

## 💡 Key Principles

1. **Separation of Concerns**
   - UI separated from business logic
   - Core components isolated

2. **Single Responsibility**
   - Each class has one clear purpose
   - Features are independent modules

3. **DRY (Don't Repeat Yourself)**
   - Shared code in `core/`
   - Reusable widgets and utilities

4. **Scalability**
   - Easy to add new features
   - Modular architecture

5. **Testability**
   - Business logic is testable
   - UI components are testable

## 🎓 Architecture Benefits

✅ **Maintainable**: Clear structure, easy to navigate
✅ **Scalable**: Add features without breaking existing code
✅ **Testable**: Separated concerns make testing easier
✅ **Reusable**: Core components used across features
✅ **Professional**: Industry-standard practices
✅ **Academic-friendly**: Easy to understand and explain

---

**Esta arquitectura está diseñada para crecer con tu proyecto!** 🚀
