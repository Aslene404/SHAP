class ServerExeption implements Exception {
  final String message;


  ServerExeption({required this.message});

}

class CacheException implements Exception {}