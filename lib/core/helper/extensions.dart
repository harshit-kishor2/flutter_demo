// All the useful extension for String

extension StringExtensions on String? {
  // Check if string is null or empty
  bool get isEmptyOrNull => this == null || this!.isEmpty;

  // Check if string is NOT null and NOT empty
  bool get isNotEmptyOrNull => !isEmptyOrNull;

  // Capitalize first letter of the string
  String get capitalize {
    if (isEmptyOrNull) return this ?? '';
    return this![0].toUpperCase() + this!.substring(1);
  }

  // Capitalize first letter of each word
  String get capitalizeWords {
    if (isEmptyOrNull) return this ?? '';
    return this!.split(' ').map((word) => word.capitalize).join(' ');
  }

  // Convert to title case (first letter of each word capitalized, rest lowercase)
  String get toTitleCase {
    if (isEmptyOrNull) return this ?? '';
    return this!.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  // Check if string is a valid email
  bool get isValidEmail {
    if (isEmptyOrNull) return false;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this!);
  }

  // Check if string is a valid phone number (basic validation)
  bool get isValidPhone {
    if (isEmptyOrNull) return false;
    final phoneRegex = RegExp(r'^\+?[\d\s-]{8,15}$');
    return phoneRegex.hasMatch(this!);
  }

  // Add ellipsis if string exceeds a certain length
  String truncate(int maxLength, {String suffix = '...'}) {
    if (isEmptyOrNull) return this ?? '';
    if (this!.length <= maxLength) return this!;
    return this!.substring(0, maxLength) + suffix;
  }
}
