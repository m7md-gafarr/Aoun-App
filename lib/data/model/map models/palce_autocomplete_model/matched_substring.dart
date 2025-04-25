class MatchedSubstring {
  final int length;
  final int offset;

  MatchedSubstring({required this.length, required this.offset});

  // دالة fromJson لتحويل JSON إلى كائن Dart
  factory MatchedSubstring.fromJson(Map<String, dynamic> json) {
    return MatchedSubstring(
      length: json['length'],
      offset: json['offset'],
    );
  }

  // دالة toJson لتحويل كائن Dart إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'length': length,
      'offset': offset,
    };
  }
}
