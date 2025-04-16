import 'dart:convert';

class extractUserInfoFromToken {
  String extractUserIdFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid token');
      }

      final payload = parts[1];

      final normalized = base64.normalize(payload);
      final decoded = utf8.decode(base64.decode(normalized));

      final payloadMap = json.decode(decoded);

      return payloadMap['sub'];
    } catch (e) {
      print('Error decoding token: $e');
      return '';
    }
  }

  String extractUserEmailFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('Invalid token');
      }

      final payload = parts[1];

      final normalized = base64.normalize(payload);
      final decoded = utf8.decode(base64.decode(normalized));

      final payloadMap = json.decode(decoded);

      return payloadMap['email'];
    } catch (e) {
      print('Error decoding token for email: $e');
      return '';
    }
  }
}
