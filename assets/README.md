# Assets Folder Structure

This folder contains all the assets used in the project, organized into specific subfolders:

## Folder Structure

```
assets/
  ├── images/           # Contains all image assets (JPEG, PNG, etc.)
  ├── svgs/             # Contains all SVG assets
  ├── animations/       # Contains all animation assets
  ├── fonts/            # Contains all custom fonts
  ├── launcherIcons/    # Contains app launcher icons
  ├── README.md         # Documentation for the assets folder
```

## Constants Classes inside constants directory

The following Dart classes are used to manage asset references:

### `font_const.dart`

This class contains constants for fonts.

```dart
class FontConst {
  // Example
  static const String openSansFamily = 'OpenSans';
  static const String openSansBold = '$openSansFamily-Bold';
}
```

### `image_const.dart`

This class contains constants for image and SVG asset paths.

```dart
class ImageConst {
  // Example
  static const String appIcon = 'assets/images/app_logo.png';
}
```

```dart
class SvgConst {
  // Example
  static const String appIcon = 'assets/svgs/app.svg';
}
```

```dart
class AnimationConst {
  // Example
  static const String loader = 'assets/animations/loader.lottie';
}
```

## Usage

To use an asset in your Flutter project, ensure it is declared in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
    - assets/svgs/
    - assets/fonts/
    - assets/animations/

  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf
```

Use the constants in your code:

```dart
Image.asset(ImageConst.logo);
SvgPicture.asset(SvgConst.icon);
Text("Hello", style: TextStyle(fontFamily: FontConst.roboto));
```

This structure ensures all assets are easily manageable and accessible throughout the project.
