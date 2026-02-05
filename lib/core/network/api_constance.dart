class ApiConstance {
  static const String BaseUrl = 'https://api.themoviedb.org/3';
  static const String BearerToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MzM5OTkyYWY5YWNiMzY5MTljZWQzNDEzYmZjZjJhZiIsIm5iZiI6MTY2NjY1NzA0NC4xNTgwMDAyLCJzdWIiOiI2MzU3MmIxNDVmNGI3MzAwN2I4NmM1YjAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.6z8pD3j7K68GOXDk4cDevgdf5LRWyaaQyg9xCXmB2B8';
  static const String ApiKey = '9b5a0a5c81e919ba6c7e7e3faabcfd0f';
  static const String imageBaseUrl =
      'https://image.tmdb.org/t/p/w500';
  static String imagePath(String? path) {
    if (path == null || path.isEmpty) {
      return 'https://via.placeholder.com/500x281?text=No+Image';
    }
    return '$imageBaseUrl$path';
  }
}
