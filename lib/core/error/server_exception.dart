class ServerException implements Exception {
  final String message;
  final String? statusCode;
  const ServerException({
    required this.message,
    this.statusCode,
  });
}
